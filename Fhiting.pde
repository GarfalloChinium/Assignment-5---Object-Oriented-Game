// im dying
// need collision with the ground
// make a platform
// make a cube
// needs to move left and right 
// needs to be able to jump and move left and right 

String gamestate = "START";

// objectsss

Player player = new Player();
Dummy dummy = new Dummy();




void setup () {
  size (400, 400);
  background(#000000);
  
  player = new Player();
  
}

void draw () { 
  background(#000000);
  player.show();
  fill(#E8E9EA);
  rect(0, 300, 400, 400);
  dummy.show();
  
  
}

void keyPressed () { 
    if (key == CODED) {
  switch(keyCode) {
    case UP: {
      if (!player.jumping) {
        player.velocity.y = -10;
        player.jumping = true;
      }
    } break;
    case DOWN: {
      player.velocity.y = 10;
    } break;
    case LEFT: {
      player.velocity.x = -10;
    } break;
    case RIGHT: {
      player.velocity.x = 10;
    } break;
  }
}
}
     
  
void keyReleased(){ 
  player.velocity.x = 0; // 60 - 61 is to stop player from endlessly gliding across the screen
       player.velocity.y = 0;
}
