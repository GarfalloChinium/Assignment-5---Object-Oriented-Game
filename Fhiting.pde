// im dying
// need collision with the ground
// make a platform
// make a cube
// needs to move left and right 
// needs to be able to jump and move left and right 

String gamestate = "START";

// objectsss
Stage stage;

void setup () {
  size (400, 400);
  background(#000000);
  stage = new Stage();
}

void draw () { 
  switch(gamestate) {
    case "IN_PROGRESS": {
        stage.show();
        stage.constraint();
        gamestate = stage.status();
    } break;
    case "VICTORY": drawVictoryScreen(); break;
    case "LOSE": drawLosingScreen(); break;
    case "START": drawStartScreen(); break;
  }
}
// victory royale screen
void drawVictoryScreen() {
  background(#000000);
  fill(#FFFFFF);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("You Win! Try Again?", 0, 0, 400, 400);
}
// losing screen
void drawLosingScreen() {
  background(#000000);
  fill(#FFFFFF);
  textSize(50);
  textAlign(CENTER, CENTER);
  text("You Lose! Try Again?", 0, 0, 400, 400);
}
// start screen
void drawStartScreen() {
  background(#000000);
  fill(#FFFFFF);
  textSize(20);
  textAlign(CENTER);
  text("FIGHT!", 0, 20, 400, 80);
  text("Press any key to start", 0, 120, 400, 100);
  text("Direction key to move", 0, 220, 400, 100);
  text("Z to attack", 0, 320, 400, 100);
}

void keyPressed() { 
  if (gamestate.equals("IN_PROGRESS")){
    stage.playerControl();
  }
}
     
  
void keyReleased(){ 
  switch (gamestate) {
    case "IN_PROGRESS": stage.handleKeyRelease(); break;
    case "VICTORY":
    case "LOSE": gamestate = "START"; break;
    case "START": {
      gamestate = "IN_PROGRESS";
      stage = new Stage();
    }
  }
}
