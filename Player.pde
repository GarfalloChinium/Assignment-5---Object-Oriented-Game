class Player {
  Hitbox hitbox;
  Hitbox attack;
  PVector velocity;
  int damage = 10;
  boolean isInAir = false;
  boolean isAttacking = false;
  
  Sprite idleSprite;
  Sprite jumpSprite;
  Sprite attackSprite;
  Sprite moveSprite;
  Sprite activeSprite; // communicates which sprite is currently active out of the 4
  
  Player() {
    hitbox = new Hitbox();
    hitbox.topLeft = new PVector(80, 240);
    hitbox.bottomRight = new PVector(120, 280);
    
    attack = new Hitbox();
    attack.topLeft = new PVector(160, 200);
    attack.bottomRight = new PVector(180, 280);
    
    velocity = new PVector(0,0);
    
    idleSprite = new Sprite("Sprites/Player/Player Sword Idle", "PlayerIdle_", 10, 120);
    jumpSprite = new Sprite("Sprites/Player/Player Jump", "PlayerJump_", 3, 120);
    attackSprite = new Sprite("Sprites/Player/Player Attack", "PlayerAttack_", 6, 120);
    moveSprite = new Sprite("Sprites/Player/Player Sword Run", "PlayerRun_", 8, 120);
    activeSprite = idleSprite; // starting the player in idle sprite
  }
  
  // functions to show the player
  void show() {
    image(activeSprite.show(), hitbox.topLeft.x, hitbox.topLeft.y, hitbox.width(), hitbox.height());
    hitbox.add(velocity);
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
          activeSprite = idleSprite;
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
      activeSprite = jumpSprite;
    }
  }
    
  void crouch() {
    velocity.y = 10;
  }
  
  void moveLeft() {
    velocity.x = -10;
    activeSprite = moveSprite; 
  }
  
  void moveRight() {
    velocity.x = 10;
    activeSprite = moveSprite; 
  }
  
  void stop() {
    velocity = new PVector(0, 0);
    isAttacking = false;
    activeSprite = idleSprite;
    activeSprite.reset();
  }
  
    void attack() {
    activeSprite = attackSprite;
    if (!isAttacking) { // Only reset animation on the first frame of the attack
      activeSprite.reset();
    }
    isAttacking = true;
    attack.set(PVector.add(hitbox.topLeft, new PVector(80, -40)));
  }
}
  
    
    
