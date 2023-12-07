class Timer {
  int time = 10000;
  int startTime;
  
  Timer() {
    startTime = millis();
  }
  
  int timeLeft(){
    return time - (millis() - startTime);
  }
  // displaying the countdown bar based off of time and time left
  void show() {
    int totalBarWidth = 80;
    int countdownBarWidth = max(0, totalBarWidth * timeLeft() / time); 

    // displays remaining time
    fill(#000000);
    rect(160, 360, countdownBarWidth, 40);
    textSize(20);
    textAlign(LEFT, TOP);
    text("00:" + timeLeft() / 1000, 160, 340);
    // displays spent time
    fill(#AAAAAA);
    rect(160 + countdownBarWidth, 360, totalBarWidth - countdownBarWidth, 40);
  }
}
