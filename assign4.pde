int[] boom=new int[100];
int[] exarray=new int[100];
int[] eyarray=new int[100];
int[] disappear=new int[100];
int numFrames=5;
PImage [] images = new PImage[numFrames];
PImage boom1;
PImage boom2;
PImage boom3;
PImage boom4;
PImage boom5;
PImage p0;
PImage p1;
PImage e;
PImage f;
PImage hp;
PImage t;
PImage s1;
PImage s2;
PImage e1;
PImage e2;
int boomx;
int boomy;
int x;
int g;
int y;
int r;
int q;
int w;
int c;
int fx;
int fy;
int ex;
int ey;
int tx;
int ty;
int xx;
int yy;
int eex;
float eey;
int blood = 40;
int game = 1;
boolean up = false;
boolean down = false;
boolean right = false;
boolean left = false;

void setup () {
  size(640,480);
  background(255);
  for (int i=0; i<numFrames; i++){
  images[i] = loadImage("img/flame" + (i+1) + ".png");}
  p0 = loadImage("img/bg1.png");
  p1 = loadImage("img/bg2.png");
  e = loadImage("img/enemy.png");
  f = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  t = loadImage("img/treasure.png");
  s1 = loadImage("img/start1.png");
  s2 = loadImage("img/start2.png");
  e1 = loadImage("img/end1.png");
  e2 = loadImage("img/end2.png");
  x = 0;
  c = 0;
  g = -640;
  ey = floor(random(440));
  ex = 0;
  ey = floor(random(440));
  r = floor(random(200));
  tx = floor(random(600));
  ty = floor(random(400));
  for(int x = 0 ; x < 18 ; x++ ){disappear[x] = 0;}
  fx=580;
  fy=240;
  xx=580;
  yy=240;
}

void draw() {
    
  background(255);
    
  switch(game){
      case (1):    
      image(s1,0,0);
      if(mouseX<=200+255&&mouseX>=200&&mouseY<=370+42&&mouseY>=370){image(s1,0,0);if(mousePressed){game=2;}}
      else{image(s2,0,0);}    
      break;
      
      case (2):
      
  q = floor(random(600));
  w = floor(random(400));
  y = floor(random(90));
  
  if(down){fy+=10;}
  if(up){fy-=10;}
  if(right){fx+=10;}
  if(left){fx-=10;}
  if(fx>590){fx=600;}
  if(fx<0){fx=-10;}
  if(fy>430){fy=440;}
  if(fy<0){fy=-10;}
  
  x = x+1;
  if(x==640)x=-640; 
  g = g+1;
  if(g==640)g=-640;
  image(p0, x, 0);
  image(p1, g , 0);
  
  if(ex==0)
  {ey=y;ey+=140;} 
    
  for(int x = 0 ; x < 18 ; x++ )
  {     
    exarray[0]=ex;eyarray[0]=ey;
    exarray[1]=ex-70;eyarray[1]=ey;
    exarray[2]=ex-140;eyarray[2]=ey;
    exarray[3]=ex-210;eyarray[3]=ey;
    exarray[4]=ex-280;eyarray[4]=ey;
    exarray[5]=ex-640-280;eyarray[5]=ey;
    exarray[6]=ex-70-640-280;eyarray[6]=ey+30;
    exarray[7]=ex-140-640-280;eyarray[7]=ey+60;
    exarray[8]=ex-210-640-280;eyarray[8]=ey+90;
    exarray[9]=ex-280-640-280;eyarray[9]=ey+120;
    exarray[10]=ex-1280-560;eyarray[10]=ey;
    exarray[11]=ex-70-1280-560;eyarray[11]=ey+70;
    exarray[12]=ex-70-1280-560;eyarray[12]=ey-70;
    exarray[13]=ex-140-1280-560;eyarray[13]=ey+140;
    exarray[14]=ex-140-1280-560;eyarray[14]=ey-140;
    exarray[15]=ex-210-1280-560;eyarray[15]=ey+70;
    exarray[16]=ex-210-1280-560;eyarray[16]=ey-70;
    exarray[17]=ex-280-1280-560;eyarray[17]=ey;
    
    if(disappear[x] == 1)
    { 
      if (frameCount % (6) == 0){boom[x]++;}
      
      if(boom[x]<5)
      {image(images[boom[x]], exarray[x], eyarray[x]); }
      
    }
    
   if(((fx+30<=exarray[x]+61&&fx+30>=exarray[x]&&fy+30<=eyarray[x]+61&&fy+30>=eyarray[x])||
      (exarray[x]+25<=fx+51&&exarray[x]+25>=fx&&eyarray[x]+25<=fy+51&&eyarray[x]+25>=fy))&&
      disappear[x]==0)
   {
    disappear[x]=1;blood-=40;
    
    if(boom[x]>5){boom[x]=0;}
    
    if(blood<=0){blood=40;game=3;}
   }  
   else if(disappear[x] == 1)
   {}
   else
   {
     image(e,exarray[x],eyarray[x]);
   }
  }
  
  ex+=5;
   
  if(exarray[17]>=640)
  {ex=0;for(int y = 0 ; y < 18 ; y++ ){disappear[y] = 0;}}
  
  if((fx+25<=tx+38&&fx+25>=tx+3&&fy+25<=ty+38&&fy+25>=ty+3)||(tx+20<=fx+48&&tx+20>=fx+3&&ty+20<=fy+48&&ty+20>=fy+3))
  {image(t,q,w);tx=q;ty=w;if(blood<200){blood+=20;}}
  else{image(t,tx,ty);}
  
  image(f,fx,fy);
  
  fill(255,48,48);
  rect(10, 10, blood, 20);
  image(hp,5,5);
  
  break;
  
  case (3):
  image(e1,0,0);
  if(mouseX<=200+232&&mouseX>=200&&mouseY<=304+42&&mouseY>=304){image(e1,0,0);if(mousePressed){game=2;}}
  else{image(e2,0,0);}
  break;
  }
}

void keyPressed(){
if(key==CODED){
    switch(keyCode){
      case DOWN:
      down = true;
        break;  
      case UP:
      up = true;
      break;
      case RIGHT:
      right = true;
      break;
      case LEFT:
      left = true;
      break;
     }
  }
}

void keyReleased(){
if(key==CODED){
    switch(keyCode){
      case DOWN:
      down = false;
        break;  
      case UP:
      up = false;
      break;
      case RIGHT:
      right = false;
      break;
      case LEFT:
      left = false;
      break;
     }
  }
}
