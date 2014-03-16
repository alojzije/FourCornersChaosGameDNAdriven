 String[] lines;

 int xbound;
 int ybound;
 
 void setup(){
  size(2*250,250);
  background(255);
  smooth();
  xbound = width/2;
  ybound = height;
 
//  lines = loadStrings("MethanocaldococcusMarkov.txt");
//  lines = loadStrings("HIVgenome.txt");
// lines = loadStrings("HIVmarkov.txt");
// lines = loadStrings("heliobacterMarkov.txt");
 
  lines = loadStrings("g1564a209Clean.txt");
 
  strokeWeight(2);
  stroke(0, 80);

  drawImage();
  drawLegend();
}
 
void drawImage(){
  char c='T';
  int dna=0;
  int px = xbound/2;
  int py = ybound/2;  
 
  for (int i = 0; i < lines[0].length(); i++){
    c = lines[0].charAt(i);   
    
    if ( c == 'T' || c == 'U') dna = 1;
    else if ( c == 'A') dna = 0;
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

        point(int(px),int(py));
    }   
}
 
void drawLegend(){
   fill(0);
   stroke(0);
    textSize(25*height/250);
   int x1 = xbound+5;
   int x2 = width- int(textWidth("A"))-5;
   int y1 = int(textAscent());
   int y2 = y1 + x2 -x1;
  
   text("T", x1, y2);
   text("A", x2, y2);
   text("G", x2, y1 );
   text("C", x1, y1);
   noFill();
   x1 += textWidth("A");
   y2 -= textAscent();
   int d = x2-x1;
   pushMatrix();
   translate(x1, y1);
   rect(0,0, d, d);
   popMatrix();

  for(int i = 1; i<=4; i++)
    drawSqares(x1, y1, d, pow(2, -i));
    
}

void drawSqares(int x1, int y1,int d, float factor){

   pushMatrix();
   translate(x1, y1);
   scale(factor);
   rect(0, 0, d, d);
   rect(d, 0, d, d);
   rect(0, d, d, d);
   rect(d, d, d, d);
   
  
   if (factor == 0.5){

    text("CG", d*0.62, d*0.3);
    text("CT", d*0.12, d*0.82);
    text("CA", d*0.62, d*0.82);
  }else if (factor == 0.25){
    text("CCG", d*0.62, d*0.3);
    text("CCT", d*0.12, d*0.82);
    text("CCA", d*0.62, d*0.82);
  }
   popMatrix();
}   
 
