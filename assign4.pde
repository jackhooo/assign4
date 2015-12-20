




PImage BImage1,BImage2,enemy,fighter,hp,treasure,end1,end2,start1,start2;  
int Bx,hpy,Tx,Ty,Ex,Ey;

final int GAME_START = 1,GAME_WIN = 2,GAME_LOSE = 3,GAME_RUN = 4;
int gameState,n,HP;
// control
float x,y;
float speed = 5;
boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;
boolean backspacePressed = false;

float RY,enemyWidth,enemyHeight;
int timesN;
//_____________________________________________________________________________11-16
int [][]enemyX = new int [6][6];
int [][]enemyY = new int [6][6];
int numFrames=5;
int currentFrame;
PImage[]imagesF=new PImage[numFrames];
int [][]boomX = new int [6][6];
int [][]boomY = new int [6][6];
int f=0;
int [] shootX =new int [5];//only this is 5!
int [] shootY =new int [5];
boolean [] shoot =new boolean [5];
PImage shootimage;
int flyn;
//_____________________________________________________________________________11-16
final int first = 1,second = 2,third = 3;
void setup () {
  size(640, 480) ;
  gameState = GAME_START;
  //_____________________________________________________________________________11-16{{{{{
  currentFrame =0;
  for (int i=0;i<numFrames;i++){imagesF[i]=loadImage("img/flame"+(i+1)+".png");}
  frameRate(60);
  //_____________________________________________________________________________11-16}}}}}
   // load image
  BImage1 = loadImage("img/bg1.png");
  BImage2 = loadImage("img/bg2.png");
  enemy = loadImage("img/enemy.png");
  fighter = loadImage("img/fighter.png");
  hp = loadImage("img/hp.png");
  treasure = loadImage("img/treasure.png");
  end1 = loadImage("img/end1.png");
  end2 = loadImage("img/end2.png");
  start1 = loadImage("img/start1.png");
  start2 = loadImage("img/start2.png");
  shootimage = loadImage("img/shoot.png");
  // load image
  
  hpy = 38; //190~100_ /5
  HP = floor((hpy * 10) / 19);  
  //
  
  Tx = floor(random(0,599));
  Ty = floor(random(0,439));
  // Tx y  
  x = width;
  y = height/2;
  
  timesN = first;
  Ey = floor(random(50,420));
for (int i=0;i<5;i++){shoot[i]=false;}
}


void draw() {
  //switch
  switch (gameState){
    
    case GAME_START:
      image(start2,0,0);
      //x,y 208,378
      if (mouseX > 208 && mouseX < 450 && mouseY > 378 && mouseY < 410){
        image(start1,0,0);
        if (mousePressed == true){
          gameState = GAME_RUN;
        }
      }
    break;
  
    case GAME_WIN:  
    break;
  
    case GAME_LOSE:
      image(end2,0,0);
      //205,308 -----436,350
      if (mouseX > 205 && mouseX < 436 && mouseY > 308 && mouseY < 350){
        image(end1,0,0);
        if (mousePressed == true){
          gameState = GAME_RUN; 
          // reset allthing_______________________________________________________________________________________
          //hpy = 38; //190~100_ /5
          hpy = 38;
          HP = floor((hpy * 10) / 19);
          Tx = floor(random(0,599));
          Ty = floor(random(0,439));
          x = width;
          y = height/2;
          
          for(int i=1;i <= 5;i++){
            for (int j =1;j <= 5;j++){
              enemyX[j][i] = -300;
              enemyX[j][i] = -300;
              boomX[j][i] = 0;
              boomY[j][i] = 0;
            }
          }
       timesN = first;
       Ex =0;
       Ey = floor(random(50,420));
       for (int i=0;i<5;i++){shoot[i]=false;}
       
          }
          //______________________________________________________________________________________________________
      }
    break;
  
    case GAME_RUN:
    
    // background
    image(BImage1,Bx,0);
    image(BImage2,Bx-640,0);
    image(BImage1,Bx-1280,0);
    Bx += 2 ;
    Bx = Bx % 1280 ;
    // background
    
    noStroke();
    fill(255,10,10);
    rect(27,26,hpy,15);
    image(hp,15,20);
    // hp
    image(fighter,x,y);
    enemyWidth = 61;
    enemyHeight = 61;
        Ex += 4;
        Ex = Ex % 946;
   //____________________________________________________________________________******** 
   for (int i=0;i<5;i++){
   //println(flyn);
   shootX[i] -= 4;
   if (shoot[i]==true){
   image(shootimage,shootX[i],shootY[i]+8);}
   if (shootX[i]<-31){shoot[i]=false;}}
   
   //____________________________________________________________________________******** 
    switch (timesN) {
     //______________________________________________
    case first:
       
        for(int i=1;i <= 5;i++){
        //_____________________________________________________________________________11-16
                     
        if(enemyX[i][3]!= -2 || enemyY[i][3]!=-2){
          enemyX[i][3]=i*70+Ex-305;
          enemyY[i][3]=Ey;
          image(enemy,enemyX[i][3],enemyY[i][3]);
          }          
                  
                  if (boomX[i][3] > 0 && boomY[i][3] >0){
                    if (frameCount % 6 ==0 && f !=5){f++;f=f%6;}
                    if(f==5){boomX[i][3] = -300;boomY[i][3] =-300;f=0;}
                     image(imagesF[f], boomX[i][3],boomY[i][3]);}         
        }   
        if (Ex >= 942){
            
            Ey = floor(random(0,114));
            for(int i=1;i <= 5;i++){
            for (int j =1;j <= 5;j++){
              enemyX[j][i] = -300;
              enemyX[j][i] = -300; 
              //boomX[j][i] = 0;
              //boomY[j][i] = 0;
              }
            }
            timesN = second;
          } 
    break;
     //______________________________________________
    case second:
        //b second time
       
            for(int j=1;j <= 5;j++){
            
            //_____________________________________________________________________________11-16
            if(enemyX[j][6-j]!= -2 || enemyY[j][6-j]!=-2){
            enemyX[j][6-j]=j*61+Ex-305;
            enemyY[j][6-j]=305-j*61+Ey;
            image(enemy,enemyX[j][6-j],enemyY[j][6-j]);
            }
            if (boomX[j][6-j] > 0 && boomY[j][6-j] >0){
                    if (frameCount % 6 ==0 && f !=5){f++;f=f%6;}
                    if(f==5){boomX[j][6-j] = -300;boomY[j][6-j] =-300;f=0;}
                     image(imagesF[f], boomX[j][6-j],boomY[j][6-j]);}
            }
        if (Ex >= 942){
            
            Ey = floor(random(0,114));
            for(int i=1;i <= 5;i++){
            for (int j =1;j <= 5;j++){
              enemyX[j][i] = -300;
              enemyX[j][i] = -300;
              //boomX[j][i] = 0;
              //boomY[j][i] = 0;
              }
            }
            timesN = third;
          } 
    break;
     //______________________________________________
    case third:
        //a thired time
        for(int i=1;i <= 5;i++){
            for (int j =1;j <= 5;j++){
              if (boomX[j][i] > 0 && boomY[j][i] >0){
              if (frameCount % 6 ==0 && f !=5){f++;f=f%6;}
              if(f==5){boomX[j][i] = -300;boomY[j][i] =-300;f=0;}
              image(imagesF[f], boomX[j][i],boomY[j][i]);}
                if(i==3){
                  if (j==1 || j==5){
                    
                    //pushMatrix();
                    //translate(j*61,i*61);
                    //image(enemy,Ex-305,Ey);
                    //popMatrix();
                    //_____________________________________________________________________________11-16
                    if(enemyX[j][i]!= -2 || enemyY[j][i]!=-2){
                    enemyX[j][i]=j*61+Ex-305;
                    enemyY[j][i]=i*61+Ey;
                    image(enemy,enemyX[j][i],enemyY[j][i]);
                    }
                  }
                }
                if(i==1 || i==5){
                  if (j==3){
                    //pushMatrix();
                    //translate(j*61,i*61);
                    //image(enemy,Ex-305,Ey);
                    //popMatrix();
                    //_____________________________________________________________________________11-16
                    if(enemyX[j][i]!= -2 || enemyY[j][i]!=-2){
                    enemyX[j][i]=j*61+Ex-305;
                    enemyY[j][i]=i*61+Ey;
                    image(enemy,enemyX[j][i],enemyY[j][i]);
                    }
                  }
                }
                if(i==2 || i==4){
                  if (j==2 || j==4){
                    //pushMatrix();
                    //translate(j*61,i*61);
                    //image(enemy,Ex-305,Ey);
                    //popMatrix();
                    //_____________________________________________________________________________11-16
                    if(enemyX[j][i]!= -2 || enemyY[j][i]!=-2){
                    enemyX[j][i]=j*61+Ex-305;
                    enemyY[j][i]=i*61+Ey;
                    image(enemy,enemyX[j][i],enemyY[j][i]);
                    }
                  }
                }
            }
        }
        if (Ex >= 942){
            
            Ey = floor(random(50,420));
            for(int i=1;i <= 5;i++){
            for (int j =1;j <= 5;j++){
              enemyX[j][i] = -300;
              enemyX[j][i] = -300;
              //boomX[j][i] = 0;
              //boomY[j][i] = 0;
              }
            }
            timesN = first;
          } 
    break;
    }
    image(treasure,Tx,Ty);
    //control___________________________________________________________________________________________________
          if (upPressed) {
          y -= speed;
        }
          if (downPressed) {
          y += speed;
        }
          if (leftPressed) {
          x -= speed;
        }
          if (rightPressed) {
          x += speed;
        }
          if (x > 589){
            x = 588;
          }
          if (y > 429){
            y = 428;
          }
          if (x < 0){
            x = 0;
          }
          if (y < 0){
            y = 0;
          }
    //__________________________________________________________________________________________________________
    //if(keyPressed == true){
    //  if (key ==' '){
    //  if (shoot[0]==true && shoot[1]==true && shoot[2]==true && shoot[3]==true && shoot[4]==true){}else{
    //  shootX[flyn]= int(x);
    //  shootY[flyn]= int(y);
    //  shoot[flyn] = true;
    //  flyn ++;
    //  flyn =flyn%5;
    //  }
    //  }
    //}
    
    //_____________________________________________________________________________11-16
            for(int i=1;i <= 5;i++){
            for (int j =1;j <= 5;j++){
            if(x > (enemyX[j][i]-51) && x < (enemyX[j][i]+61) && y > (enemyY[j][i]-51) && y < (enemyY[j][i]+61)){
             boomX[j][i] = enemyX[j][i];
             boomY[j][i] = enemyY[j][i];
             
             enemyX[j][i] = -2;
             enemyY[j][i] = -2;
             hpy -= 38; 
             HP = floor((hpy * 10) / 19);
             if  (HP < 1){
               gameState = GAME_LOSE;
               }
             }             
            }
          }
//____________-----------------------------------------------------------------------------------------
      for(int m=0;m<5;m++){
        for(int i=1;i <= 5;i++){
        for (int j =1;j <= 5;j++){
      if(shootX[m] > (enemyX[j][i]-31) && shootX[m] < (enemyX[j][i]+61) && (shootY[m]+8) > (enemyY[j][i]-27) && (shootY[m]+8) < (enemyY[j][i]+61) && shoot[m]==true){
                   boomX[j][i] = enemyX[j][i];
                   boomY[j][i] = enemyY[j][i];
                   shoot[m]=false;
                   enemyX[j][i] = -2;
                   enemyY[j][i] = -2;
                   
          }
        }
       }
      }

    if(x > (Tx-51) && x < (Tx+41) && y > (Ty-51) && y < (Ty+41)){
        hpy += 19; //190~100_ /5
        HP = floor((hpy * 10) / 19);
        Tx = floor(random(0,599));
        Ty = floor(random(0,439));
        //winTimes += 1;
    }
    
    if (hpy > 190){
    hpy = 190;
    HP = 100;
    }     
    break;
  }
}
void keyPressed() {
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
    }
  }
  //if (keyPressed){
  //if (key ==' '){
  //      backspacePressed = true;
  //      }}
}

void keyReleased() {
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
      case BACKSPACE:
        backspacePressed = false;
        break;
    }
  }
  //if (keyPressed){
  if (key ==' '){
     if (shoot[0]==true && shoot[1]==true && shoot[2]==true && shoot[3]==true && shoot[4]==true){}else{
     shootX[flyn]= int(x);
     shootY[flyn]= int(y);
     shoot[flyn] = true;
     flyn ++;
     flyn =flyn%5;
     }
    }
}

  

   
