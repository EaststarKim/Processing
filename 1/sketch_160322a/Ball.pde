class Ball {
  PVector location;
  PVector velocity;
  PVector acceleration;

  Ball() {
    location = new PVector(100, 100);
    velocity = new PVector(2.5, 5);
  }
  
  void accelerate(){
    float a=keyPressed?-0.02:0.01;
    acceleration=velocity.copy();
    acceleration.normalize();
    acceleration.mult(a);
    velocity.add(acceleration);
    velocity.limit(7);
    location.add(velocity);
  }
  
  void update() {
    accelerate();
    if ((location.x > width) || (location.x < 0)) {
      velocity.x = velocity.x * -1;
    }
    if ((location.y > height) || (location.y < 0)) {
      velocity.y = velocity.y * -1;
    }
  }
  void display() {
    stroke(0);
    fill(153,255,153);
    ellipse(location.x, location.y, 20, 20);
  }
}