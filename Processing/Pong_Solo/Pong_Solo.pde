
int posX = 0;
int posY = 0;
int speedY= 4;
int speedX = int(random(1,4));
PFont font;
color[] leveColors = {color(191,255,140), color(140,255,145), color(140,255,203),color(140,249,255),color(140,191,255)};
int level = 1;
int lives = 3;
int winLevel = 4;

void setup() {
  size(800, 500);
  font = createFont("AptiferSlabLTPro-Bold.otf", 20);
  textFont(font);
}

void draw() {
  noCursor();
  background(leveColors[level]);
  noStroke();
  
  String t = "LIVES: " + str(lives);
  text(t, 12, 20);
  String l = "LEVEL: " + str(level);
  text(l, 102, 20);
  
  
  posX = posX + speedX;
  posY = posY + speedY;

  if (posX > width) {
    //speedX = speedX* -1;
    farWall();
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
  
  if(contact()){
    upLevel();
    speedX = speedX* -1;
  }
  
  ellipse(posX, posY, 10, 10);
  rect(700, mouseY, 10, 50);
  
}


boolean contact(){
  boolean hit = false;
  if( posX >= 700 && posX <= 710){
    if(posY >= mouseY && posY <= mouseY+50 ){
      hit = true;
    }
  }  
  return hit;
}

void upLevel(){
  if(level<winLevel){
    level++;
    
    if(speedX < 0){
      speedX -= int(random(1,4));
    }else{
      speedX += int(random(1,4));
    }
    
  }else{
    win();  
  }
}


void farWall(){
  if(lives > 1){
    lives--;
    if(speedY < 0){
      speedY -= int(random(1,4));
    }else{
      speedY += int(random(1,4));
    }
    posX = 60;
    posY = height/2;
    
  }else{
    fail(); 
  }
}


void fail(){
  noLoop();
  background(59,54,127);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2);
  
}

void win(){
  noLoop();
  background(255,135,253);
  textAlign(CENTER);
  text("CONGRATULATIONS", width/2, height/2);
  
}