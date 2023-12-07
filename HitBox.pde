class Hitbox {
  PVector topLeft;
  PVector bottomRight;
  // calculates the hitbox width and height by subtracting the bottom right from the top left
  float width() {
    return bottomRight.x - topLeft.x;
  }
  
  float height() {
    return bottomRight.y - topLeft.y;
  }
  // this allows the hitbox to move freely
  void add(PVector vector){
    topLeft.add(vector);
    bottomRight.add(vector);
  }
  
  // This basically teleports the hitbox to the newPosition. 
  // For example, rect(80, 240, 40, 40) to (100, 100, 40, 40). The hitbox topLeft moves from (80, 240) to (100, 100)
  // and the bottomRight will become (140, 140).
  void set(PVector newPosition){
    float w = width();
    float h = height();
    topLeft = newPosition;
    bottomRight = new PVector(newPosition.x + w, newPosition.y + h);
  }
  // collision detection between hitboxes
  boolean isCollide(Hitbox hitbox) {
    // checks if one hitbox is to the left of another hitbox, if they're not that means the hitboxes share an x-axis
    if (bottomRight.x < hitbox.topLeft.x || hitbox.bottomRight.x < topLeft.x) {
      return false;
    }
    
    // checks if one hitbox is above of another hitbox, if they're not that means the hitboxes share an y-axis
    if (bottomRight.y < hitbox.topLeft.y || hitbox.bottomRight.y < topLeft.y) {
        return false;
    }

    // hitboxes share x-axis & y-axis, meaning they are overlapping
    return true;
  }
}
