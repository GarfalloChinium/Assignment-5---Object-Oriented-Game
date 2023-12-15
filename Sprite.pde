class Sprite {
  PImage[] sprites; // images of the sprites 
  int loopLength; // how long it'll take till the animation loops in frames
  int framesShown = 0; // keeps count on how many frames the sprite has shown
  
  Sprite(String spriteFolder, String spritePrefix, int spriteSize, int animationLengthInFrame) {
    sprites = new PImage[spriteSize];
    
    for(int i = 0; i < sprites.length; i++) {
      sprites[i] = loadImage(spriteFolder + "/" + spritePrefix + i + ".png");    
    }
    loopLength = animationLengthInFrame; 
    
  }
  PImage show() {
    framesShown++;
    int spriteDuration = loopLength / sprites.length;
    int spriteIndex = (framesShown % loopLength) / spriteDuration; 
    return sprites[spriteIndex];
    
  }
  
  void reset() { // To reset the animation when player change from one state to another (e.g: idle -> jumping, running -> idle, etc)
    framesShown = 0;
  }
    
  
  
}
  
