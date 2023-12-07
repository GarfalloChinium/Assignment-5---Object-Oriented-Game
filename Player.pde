class Player {
  Hitbox hitbox;
  Hitbox attack;
  PVector velocity;
  
  int damage = 10;
  boolean isInAir = false;
  boolean isAttacking = false;
  
  Player() {
    hitbox = new Hitbox();
    hitbox.topLeft = new PVector(80, 240);
    hitbox.bottomRight = new PVector(120, 280);
    
    attack = new Hitbox();
    attack.topLeft = new PVector(160, 200);
    attack.bottomRight = new PVector(180, 280);
    
    velocity = new PVector(0,0);
  }
  
  // functions to show the player
  void show() {
    fill(#0383FF);
    rect(hitbox.topLeft.x, hitbox.topLeft.y, hitbox.width(), hitbox.height());
    hitbox.add(velocity);
    if (isAttacking){
       fill(#00FF00);
       rect(attack.topLeft.x, attack.topLeft.y, attack.width(), attack.height());
    }
  }
  
  // player falling speed
  void fall(){
    if (isInAir) {
      velocity.y += 3;
    }
  }
  // this checks the player and dummy hitbox so the player doesnt fall through the floor or go through the dummy
  void collisionCheck(Hitbox objectHitbox, String objectName){
    if (hitbox.isCollide(objectHitbox)){
      switch(objectName){
        case "FLOOR": {
          isInAir = false;
          hitbox.set(new PVector(hitbox.topLeft.x, objectHitbox.topLeft.y - hitbox.height()));
        } break;
        case "DUMMY": {
          hitbox.set(new PVector(objectHitbox.topLeft.x - hitbox.width(), hitbox.topLeft.y));
        } break;
      }
    }
  }
  // checking if the attack hit the dummy or not and letting the player know
  void hitCheck(Dummy dummy){
    if (isAttacking){
      if (attack.isCollide(dummy.hitbox)){
        dummy.health -= damage;
        println("Hit! Dummy has " + dummy.health + " HP left");
      } else {
        println("Attack missed");
      }
    }
  }

  // functions for player movement
  void jump() {
    if (!isInAir){
      velocity.y -= 20;
      isInAir = true;
    }
  }
    
  void crouch() {
    velocity.y = 10;
  }
  
  void moveLeft() {
    velocity.x = -10;
  }
  
  void moveRight() {
    velocity.x = 10;
  }
  
  void stop() {
    velocity = new PVector(0, 0);
    isAttacking = false;
  }
  
  void attack() {
    isAttacking = true;
    attack.set(PVector.add(hitbox.topLeft, new PVector(80, -40)));
  }
}
  
    
    
