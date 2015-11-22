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
