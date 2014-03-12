import random
##################################################
## NOTE: YOU NEED TO IMPLEMENT A WINDOWS SIZE 6 ##
##################################################

#f = open('bookShortInput.txt', 'r')
f = open('HIVgenome.txt', 'r')
#f = open('orionExampleGenome.txt', 'r')
data = f.read()
f.close()


countC = 0
countG = 0
countT = 0
countA = 0
countXX = 0
probabilityMatrix = []
words = (   ('C', 'C'),
            ('G', 'C'),
            ('A', 'C'),
            ('T', 'C'),
            ('C', 'G'),
            ('G', 'G'),
            ('A', 'G'),
            ('T', 'G'),
            ('C', 'A'),
            ('G', 'A'),
            ('A', 'A'),
            ('T', 'A'),
            ('C', 'T'),
            ('G', 'T'),
            ('A', 'T'),
            ('T', 'T'))

window =['A', 'A']
succ = 'A'
for j in range(0,16):
    for i in range(1, len(data)-1):
        window[0] = data[i-1]
        window[1] = data[i]
        succ = data[i+1]
        if window[0] == words[j][0] and window[1] == words[j][1]:
            countXX +=1
            if succ == 'C': countC +=1
            elif succ == 'G': countG +=1
            elif succ == 'A': countA +=1
            elif succ == 'T': countT +=1

    if countXX == 0:
        probabilityMatrix.append([0.25, 0.25, 0.25, 0.25])
    else:
        probabilityMatrix.append([countC/float(countXX), countG/float(countXX), countA/float(countXX), countT/float(countXX)])
    for pList in probabilityMatrix:
        pList[0] = round(pList[0], 3)
        pList[1] = round(pList[1], 3)
    countC, countG, countA, countT, countXX = 0,0,0,0,0

#p[ p(c), p(c+g), p(c+g+a)]
outputProbM = []
for p in probabilityMatrix:
    #wokrs fine with a bug p[0]+p[1]+p[3]
    outputProbM.append([p[0],p[0]+p[1], p[0]+p[1]+p[2])
output = []
window = ('A', 'A')
succ = 'A'

for i in range (0, 10000):
    index = words.index(window)
    p = random.random()
    if p < outputProbM[index][0]: succ = 'C'
    elif p < outputProbM[index][1]: succ = 'G'
    elif p < outputProbM[index][2]: succ = 'A'
    else: succ = 'T'
    output.append(succ)
    window = (window[1], succ)

f = open('output.txt', 'w')
for c in output:
    f.write(c)
f.close()

