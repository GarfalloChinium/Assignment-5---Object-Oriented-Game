class Floor {
  Hitbox hitbox;
  
  Floor() {
    hitbox = new Hitbox();
    hitbox.topLeft = new PVector(0, 300);
    hitbox.bottomRight = new PVector(400, 400);
  }
  
  void show() {
    fill(#E8E9EA);
    rect(hitbox.topLeft.x, hitbox.topLeft.y, hitbox.width(), hitbox.height());
  }
}
