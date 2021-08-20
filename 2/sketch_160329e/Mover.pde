
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;

  Mover() {
    location = new PVector(10,height-10);
    velocity = new PVector(0,0);
    acceleration = new PVector(4,0);
    mass = 1;
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    rect(location.x-20,location.y-10,50,20);
    fill(0,0,100,100);
    stroke(0,100,200);
    strokeWeight(7);
    line(location.x,location.y,location.x+20,location.y-5);
  }

  void checkEdges() {

    if (location.x > width) location.x = 0;
    if (location.y < 0) location.y = height;

  }

}