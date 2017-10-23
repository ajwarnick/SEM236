// Info we need to make our app run
String zip_code = "44102"; // this is our default value we will allow the user reset it
String api_key = "";

// Data we will use in our app
float tempK;
float tempF;
String description;

void setup(){
    getWeather();
    extractData();
}



void draw(){ 
}





void getWeather(){
  // Get the data from Open Weather Map
  String url = "http://samples.openweathermap.org/data/2.5/weather?zip=" + zip_code + ",us&appid=" + api_key;
  String[] json = loadStrings(url);
  
  // Save that data locally
  saveStrings("weather_data.json", json);
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
}