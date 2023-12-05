class Player {
  
  PVector velocity;
  PVector location; 
  boolean jumping = false;
  
  Player () {
    location = new PVector(50,50);
    velocity = new PVector (0,0);
  }
  
  
  
  void show() {
    fill(#0383FF);
    rect(location.x, location.y, 5, 5);
    if (jumping){
    location.y += 5; // gravityyyy
    if (location.y > 300) { // setting up the collission
     location.y = 295; // cant be 300 cause it just IGNORES THE COLLISSIONNNN 
     jumping = false;
     if (location.y > 300) {
       
    }
    }
    
  location.x += velocity.x;
  location.y += velocity.y;
  }
    
    
    
    
  }
  
}
  
    
    
