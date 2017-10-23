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
//Ramdom Temp
int temp = int(random(100)); 
//Global ZIP CODE 
String gZIP = "";


// Info we need to make our app run
String zip_code = "44102"; // this is our default value we will allow the user reset it
String api_key = "b40ad42b19570cda654f98c76b597e22";


// Data we will use in our app
float tempK;
float tempF;
String description;





void setup() { 
  size(450, 800); 
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
  
  //Test if ZIP has been written 
  if(gZIP != ""){
    //call the function to write the zip code
    //println("zip");
    writeZIP(gZIP);
  }else{
    //call the function to write the temp
    //println("temp");
    writeTemp(temp);
  }
  
  //Call the get Weather here if you want to hook the app up to the internet
  if(gZIP.length() == 5){
    getWeather(gZIP);
  }
  
} 


void keyPressed() {
  if(gZIP.length() == 4){
    
    if (keyCode == 49) {
      gZIP += "1";
    }else if(keyCode == 50){
      gZIP += "2";
    }else if(keyCode == 51){
      gZIP += "3";
    }else if(keyCode == 52){
      gZIP += "4";
    }else if(keyCode == 53){
      gZIP += "5";
    }else if(keyCode == 54){
      gZIP += "6";
    }else if(keyCode == 55){
      gZIP += "7";
    }else if(keyCode == 56){
      gZIP += "8";
    }else if(keyCode == 57){
      gZIP += "9";
    }else if(keyCode == 48){
      gZIP += "0";
    }
    
  }else{
    
    if (keyCode == 49) {
      gZIP += "1";
    }else if(keyCode == 50){
      gZIP += "2";
    }else if(keyCode == 51){
      gZIP += "3";
    }else if(keyCode == 52){
      gZIP += "4";
    }else if(keyCode == 53){
      gZIP += "5";
    }else if(keyCode == 54){
      gZIP += "6";
    }else if(keyCode == 55){
      gZIP += "7";
    }else if(keyCode == 56){
      gZIP += "8";
    }else if(keyCode == 57){
      gZIP += "9";
    }else if(keyCode == 48){
      gZIP += "0";
    } 
  } 
}




void writeTemp(int t) { 
  //get the temp and cast it as a string
  String lt = str(t); 
  //add the degree symbol to the string
  lt += "°"; 
  //set the color of the text
  fill(255); 
  //set the text size
  textSize(64); 
  textAlign(CENTER, CENTER);  
  //write the text to the screen
  text(lt, width/2, height/2);
}

void writeZIP(String z) { 
  //set the color of the text
  fill(255); 
  //set the text size
  textSize(64); 
  textAlign(CENTER, CENTER); 
  //write the text to the screen
  text(z, width/2, height/2);
  
  
}


void getWeather(String z){
  // Get the data from Open Weather Map
  String zip_code = z;
  String url = "http://api.openweathermap.org/data/2.5/weather?zip=" + zip_code + ",us&appid=" + api_key;
  String[] json = loadStrings(url);
  
  // Save that data locally
  saveStrings("weather_data.json", json);
  extractData();
}


void extractData(){
  // Process the data into the variables we set at the beginning 
  JSONObject jobj =  loadJSONObject("weather_data.json");
  
  // Get the discription
  JSONArray weatherJSONArray = jobj.getJSONArray("weather");
  description = weatherJSONArray.getJSONObject(0).getString("description");
  
  // Get the temp out of the JSON
  JSONObject mainJSONArray  = jobj.getJSONObject("main");
  tempK = mainJSONArray.getInt("temp");
  
  // Convert from Kelvin to Fahrenheit
  //T(°F) = T(K) × 9/5 - 459.67
  tempF = (tempK * 1.8) - 459.67; 
  temp = int(tempF);
  gZIP = "";
}