class Ball { 
  int posX;
  int posY;
  int speedY;
  int speedX;
  
  Ball (int x, int y) {  
    posX = x;
    posY = y; 
    speedX = int(random(0,5));
    speedY = int(random(0,5));
  } 
  
  
  void update() { 
    posX = posX + speedX;
    posY = posY + speedY;
  
    if (posX > width) {
      speedX = speedX* -1;
    }
  
    if (posX < 0) {
      speedX = speedX* -1;
    }
  
    if (posY > height) {
      speedY= speedY* -1;
    }
    
    if (posY < 0) {
      speedY= speedY*-1;
    }
    ellipse(posX, posY, 50, 50); 
  } 
  
  
  
  
}
