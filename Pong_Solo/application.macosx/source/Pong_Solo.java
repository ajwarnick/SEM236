import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Pong_Solo extends PApplet {


int posX = 0;
int posY = 0;
int speedY= 4;
int speedX = PApplet.parseInt(random(1,4));
PFont font;
int[] leveColors = {color(191,255,140), color(140,255,145), color(140,255,203),color(140,249,255),color(140,191,255)};
int level = 1;
int lives = 3;
int winLevel = 4;

public void setup() {
  
  font = createFont("AptiferSlabLTPro-Bold.otf", 20);
  textFont(font);
}

public void draw() {
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


public boolean contact(){
  boolean hit = false;
  if( posX >= 700 && posX <= 710){
    if(posY >= mouseY && posY <= mouseY+50 ){
      hit = true;
    }
  }  
  return hit;
}

public void upLevel(){
  if(level<winLevel){
    level++;
    
    if(speedX < 0){
      speedX -= PApplet.parseInt(random(1,4));
    }else{
      speedX += PApplet.parseInt(random(1,4));
    }
    
  }else{
    win();  
  }
}


public void farWall(){
  if(lives > 1){
    lives--;
    if(speedY < 0){
      speedY -= PApplet.parseInt(random(1,4));
    }else{
      speedY += PApplet.parseInt(random(1,4));
    }
    posX = 60;
    posY = height/2;
    
  }else{
    fail(); 
  }
}


public void fail(){
  noLoop();
  background(59,54,127);
  textAlign(CENTER);
  text("GAME OVER", width/2, height/2);
  
}

public void win(){
  noLoop();
  background(255,135,253);
  textAlign(CENTER);
  text("CONGRADTULATIONS", width/2, height/2);
  
}
  public void settings() {  size(800, 500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Pong_Solo" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
