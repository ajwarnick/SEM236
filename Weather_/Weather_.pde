int r = 0; 
int g = 0; 
int b = 0; 
color myColor1 = color(r, g, b); 
color myColor2 = color(r, g, b); 

boolean over = false; 

//number of colors between our 2 colors the background will have 
float steps = 200; 
//count what step we are on 
int counter = 1; 
//tells us which direction we are moving 
boolean forward = true; 
//precent of each step 
float s = (100/steps)/100; 


int temp = int(random(100)); 

void setup() { 
  size(500, 400); 
  //frameRate(1); 
  myColor1 = color(255, 0, 0); 
  myColor2 = color(0, 0, 0); 


  //println(myColor1); 
  //println(myColor2);
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
  //call the function to write the temp
  writeTemp(temp);
} 




void writeTemp(int temp) { 
  //get the temp and cast it as a string
  String t = str(temp); 
  //add the degree symbol to the string
  t += "°"; 
  //set the color of the text
  fill(100); 
  //set the text size
  textSize(64); 
  //write the text to the screen
  text(t, height/2, width/2);
}