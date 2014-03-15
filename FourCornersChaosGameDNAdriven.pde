 String[] lines;
 int[][] pxCount;
 int rows;
 int cols;
 int xbound;
 int ybound;
 void setup(){
  size(2*250,250);
  background(255);
  stroke(0);
  smooth();
  xbound = width/2;
  ybound = height;
 
//  lines = loadStrings("MethanocaldococcusMarkov.txt");
//  lines = loadStrings("HIVgenome.txt");
//  lines = loadStrings("heliobacterMarkov.txt");
//  lines = loadStrings("classesYaleEduDNAseqClean.txt");
  
  lines = loadStrings("g1564a209Clean.txt");
 
  
  //cout how many times each pixel is hit
  rows = ybound+1;
  cols = xbound+1;
  pxCount = new int[rows][cols];
  getGrayScale();
  drawImage();
  drawLegend();
 }
 
void drawImage(){
  char c='T';
  int dna=0;
  int px = 0;
  int py = ybound;  
 
  for (int i = 0; i < lines[0].length(); i++){
    c = lines[0].charAt(i);   
    
    if ( c == 'T') dna = 3;
    else if ( c == 'A') dna = 1;
    else if ( c == 'G') dna = 2;  
    else if ( c == 'C') dna = 0;

   switch(dna){
          case 0:
            px = px/2;
            py = (py+ybound)/2;
            break;
          case 1:
            px = (px+xbound)/2;
            py = (py+ybound)/2;
            break;
          case 2:
            px = (px+xbound)/2;
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
  int py = ybound;  
  
  for (int i = 0; i < lines[0].length(); i++){
    c = lines[0].charAt(i);   
    
    if ( c == 'T') dna = 0;
    else if ( c == 'A') dna = 1;
    else if ( c == 'G') dna = 2;  
    else if ( c == 'C') dna = 3;

   switch(dna){
          case 0:
            px = px/2;
            py = (py+ybound)/2;
            break;
          case 1:
            px = (px+xbound)/2;
            py = (py+ybound)/2;
            break;
          case 2:
            px = (px+xbound)/2;
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
void drawLegend(){
   fill(0);
   stroke(0);
   int x1 = xbound+20;
   int x2 = width-29;
   int y1 = 10+20;
   int y2 = height-20;
   textSize(25);
   text("T", x1, y2);
   text("A", x2, y2);
   text("G", x2, y1 );
   text("C", x1, y1);
   noFill();
   x1 += 18;
   y2 -= 20;
   int h = y2-y1;
   int  l = x2-x1;
   pushMatrix();
   translate(x1, y1);
   rect(0,0, l, h);
   popMatrix();

  for(int i = 1; i<=4; i++)
    drawSqares(x1, y1, l, h, pow(2, -i));
    
}

void drawSqares(int x1, int y1,int l, int h, float factor){

   pushMatrix();
   translate(x1, y1);
   scale(factor);
   rect(0, 0, l, h);
   rect(l, 0, l, h);
   rect(0, h, l, h);
   rect(l, h, l, h);
   
  
   if (factor == 0.5){

    text("CG", l*0.62, h*0.3);
    text("CT", l*0.12, h*0.82);
    text("CA", l*0.62, h*0.82);
  }else if (factor == 0.25){
    text("CCG", l*0.62, h*0.3);
    text("CCT", l*0.12, h*0.82);
    text("CCA", l*0.62, h*0.82);
  }
   popMatrix();
}   
 
