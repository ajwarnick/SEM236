import gab.opencv.*;
import processing.video.*; 
import java.awt.Rectangle;

Capture cam; 
OpenCV opencv;
Rectangle[] faces;

void setup() {
  size(960, 540); 
  background (0, 0, 0); 
  
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      //println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, width, height, cameras[0]);
    cam.start();  
    
    opencv = new OpenCV(this, cam.width, cam.height); 
    opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
   
    faces = opencv.detect();
  } 
  
}

void draw() { 
  opencv.loadImage(cam); 
  faces = opencv.detect(); //init the faces array - its now no longer null
  //println(faces.length); // gives 0
  image(cam, 0, 0); 
 
  if (faces!=null) { 
    for (int i=0; i< faces.length; i++) { 
      noFill(); 
      stroke(255, 255, 0); 
      strokeWeight(10); 
      rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
    }
  } 
  if (faces.length<=0) { 
    textAlign(CENTER); 
    fill(255, 0, 0); 
    textSize(56); 
    println("no faces");
    text("UNDETECTED", 200, 100);
  }
}
 
void captureEvent(Capture cam) { 
  cam.read();
}
