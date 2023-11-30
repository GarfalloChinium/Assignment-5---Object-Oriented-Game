// im dying
// need collision with the ground
// make a platform
// make a cube
// needs to move left and right 
// needs to be able to jump and move left and right 

String gamestate = "START";

// objectsss

Player[] player = new Player[1];




void setup () {
  size (400, 400);
  background(#000000);
  
  player[0] = new Player();
  
}

void draw () { 
  background(#000000);
  player[0].show();
  fill(#E8E9EA);
  rect(0, 300, 400, 400);
  
  
}

void keyPressed () { 
    if (key == CODED) {
      if (keyCode == UP) {
        if (player[0].jumping == false){
        player[0].velocity.y = -10;
        player[0].jumping = true;
        }
      } else if (keyCode == DOWN) {
        player[0].velocity.y = 10;
      }
    }
     if (key == CODED) {
      if (keyCode == RIGHT) {
        player[0].velocity.x = 10;
      } else if (keyCode == LEFT) {
        player[0].velocity.x = -10;
      }
     }
     
  }
  
void keyReleased(){
  player[0].velocity.x = 0;
       player[0].velocity.y = 0;
}
