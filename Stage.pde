class Stage {
   Player player;
   Dummy dummy;
   Floor floor;
   Timer timer;
   
   Stage() {
     player = new Player();
     dummy = new Dummy();
     floor = new Floor();
     timer = new Timer();
   }
   
   void show() {
     // functions that show all the objects
     background(#000000);
     floor.show();
     dummy.show();
     player.show();
     // showing the UI (healthbar and timer)
     dummy.showHealthBar();
     timer.show();
   }
   
   void constraint() {
     // player gravity 
     player.fall();
     // checking collision for the player
     player.collisionCheck(floor.hitbox, "FLOOR");
     player.collisionCheck(dummy.hitbox, "DUMMY");
   }
   // controls for player movement
   void playerControl(){
     if (key == CODED) {
        switch(keyCode){
          case UP: player.jump(); break;
          case DOWN: player.crouch(); break;
          case LEFT: player.moveLeft(); break;
          case RIGHT: player.moveRight(); break;
        }
     } else {
        switch(key) {
          case 'z':
          case 'Z': player.attack(); break;
        }
     }
   }
   
   void handleKeyRelease(){
     // checking if the attack hit and adding traction
     player.hitCheck(dummy);
     player.stop();
   }
   // checking for win loss condition
   String status() {
     if (dummy.health <= 0) return "VICTORY";
     else if (timer.timeLeft() <= 0) return "LOSE";
     else return "IN_PROGRESS";
   }
}
