int r = 0; 
int g = 0; 
int b = 0; 

color myColor1 = color(0, 0, 0); 
color myColor2 = color(r, g, b); 

//number of colors between our 2 colors the background will have 
float steps = 200; 
//count what step we are on 
int counter = 1; 
//tells us which direction we are moving 
boolean forward = true; 
//precent of each step 
float s = (100/steps)/100; 

void setup() { 
  size(500, 400); 
  //frameRate(1); 
  myColor1 = color(227, 38, 54); 
  myColor2 = color(164, 198, 57); 

} 



void draw() { 
 
  
  // is our counter equal to total steps 
  if (counter == steps) { 
    // swtich direction 
    forward = !forward; 
    //reset our counter 
    counter = 0;
  } else if (counter < steps && forward) { 
    //get the color at each steop between our two colors moving in one direction
    color c = lerpColor(myColor1, myColor2, s*counter); 
    //set background
    background(c); 
    //set counter to next step
    counter++;
  } else if (counter < steps && !forward) { 
    //get the color at each steop between our two colors moving in other direction
    color c = lerpColor(myColor2, myColor1, s*counter); 
    //set background
    background(c); 
    //set counter to next step
    counter++;
  } 
  
  
  fill(myColor1);
  stroke(myColor2);
  rect(30, 20, 55, 55);
  
} 