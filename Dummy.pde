class Dummy{
  Hitbox hitbox;
  int health = 100;
  
  Dummy() {
    hitbox = new Hitbox();
    hitbox.topLeft = new PVector(300.0, 200.0);
    hitbox.bottomRight = new PVector(340.0, 300.0);
  }
  
  void show() {
    // shows the dummy
    fill(#FF6B08);
    rect(hitbox.topLeft.x, hitbox.topLeft.y, hitbox.width(), hitbox.height());
  }
  
  void showHealthBar() {
    // shows the dummy's remaining health bar
    int totalBarWidth = 340;
    int activeBarWidth =  totalBarWidth * health / 100;
    fill(#00EE00);
    rect(20, 20, activeBarWidth, 20);
    // shows the dummy's lost health on the health bar
    fill(#EEEEEE);
    rect(20 + activeBarWidth, 20, totalBarWidth - activeBarWidth, 20);
  }
}
  
