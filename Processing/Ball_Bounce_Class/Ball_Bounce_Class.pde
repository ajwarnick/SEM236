ArrayList<Ball> balls = new ArrayList<Ball>();
int numberOfBalls = 10;

void setup() {
  size(500, 500);
  
  for(int i = 0; i<= numberOfBalls; i++){
    balls.add(new Ball( int(random(100,400)), int(random(100,400)) ));
  }
}

void draw() {
  background(0);
  
  // We can loop through our ArrayList using an enhanced loop:
  for (Ball myBall : balls) {
    myBall.update();
  }
}
