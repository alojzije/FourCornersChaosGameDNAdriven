 String[] lines;
 int[][] pxCount;
 int rows;
 int cols;

 void setup(){
  size(150,150);
  background(255);
  stroke(0);
  smooth();
 
//  lines = loadStrings("MethanocaldococcusMarkov.txt");
//  lines = loadStrings("HIVgenome.txt");
  lines = loadStrings("heliobacterMarkov.txt");
  
  //cout how many times each pixel is hit
  rows = height+1;
  cols = width+1;
  pxCount = new int[rows][cols];
  getGrayScale();
  drawImage();
 }
 
void drawImage(){
  char c='T';
  int dna=0;
  int px = 0;
  int py = height;  
  
  for (int i = 0; i < lines[0].length(); i++){
    c = lines[0].charAt(i);   
    
    if ( c == 'T') dna = 0;
    else if ( c == 'A') dna = 1;
    else if ( c == 'G') dna = 2;  
    else if ( c == 'C') dna = 3;

   switch(dna){
          case 0:
            px = px/2;
            py = (py+height)/2;
            break;
          case 1:
            px = (px+width)/2;
            py = (py+height)/2;
            break;
          case 2:
            px = (px+width)/2;
            py = py/2;
            break;   
          case 3:
            px = px/2;
            py = py/2;
            break;     
        }
        stroke(pxCount[py][px]);
        fill(pxCount[py][px]);
        point(int(px),int(py));
    }
    
 
 }
 
 void getGrayScale(){
  char c='T';
  int dna=0;
  int px = 0;
  int py = height;  
  
  for (int i = 0; i < lines[0].length(); i++){
    c = lines[0].charAt(i);   
    
    if ( c == 'T') dna = 0;
    else if ( c == 'A') dna = 1;
    else if ( c == 'G') dna = 2;  
    else if ( c == 'C') dna = 3;

   switch(dna){
          case 0:
            px = px/2;
            py = (py+height)/2;
            break;
          case 1:
            px = (px+width)/2;
            py = (py+height)/2;
            break;
          case 2:
            px = (px+width)/2;
            py = py/2;
            break;   
          case 3:
            px = px/2;
            py = py/2;
            break;     
        }
        pxCount[py][px]++;
    }
    
    float max = -1;
    for(int j =0; j< rows; j++){
      for(int i =0; i< cols; i++){
        if (pxCount[j][i] > max) 
          max = pxCount[j][i];
      }    
    }
    for(int j =0; j< rows; j++){
      for(int i =0; i< cols; i++){
        pxCount[j][i] =  int(map(pxCount[j][i], 0, max, 200, 0));
        print(pxCount[j][i], "\n");
      } 
    }
    
}
