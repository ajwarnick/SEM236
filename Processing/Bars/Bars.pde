
int steps = 3;
color start_color = color(255, 104, 10);
color end_color = color(20, 254, 50);

void setup() {
  size(600, 360);
  
  //start_color =  rC();
  //end_color = rC();
  
  steps = 300;
  //steps = 30;
  
  background(250, 100, 20);
  noLoop();
}


void draw(){
  for (int i = 0; i <= steps; i++) {
    
    float s = ((100/float(steps))*0.01)*i; 
    color c = lerpColor(start_color, end_color, s);
    
    noStroke();
    fill(c);
    rect((width/steps)*i, 0, width/steps, height);
    
  }
}









color rC(){
  color r = color(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
  return r;
}


//drawbar( width/steps, (width/steps)*i, c);
/*
void drawbar(int wdt, int start, color c){
  noStroke();
  fill(c);
  rect(start, 0, wdt, height);
}
*/