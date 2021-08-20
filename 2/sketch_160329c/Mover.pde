
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  float r,b,g;
  
  Mover() {
    location = new PVector(random(width),random(100,height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
    mass = random(1,3);
    r=random(256);
    g=random(256);
    b=random(256);
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
    line(location.x,location.y+40,location.x,location.y+100);
    beginShape(TRIANGLES);
    vertex(location.x,location.y+35);
    vertex(location.x+5,location.y+40);
    vertex(location.x-5,location.y+40);
    endShape();
    beginShape();
    for (float x = 0; x <= 5; x+=0.1) {
      float y = -(16*x+sqrt(256*x*x-4*17*(17*x*x-225)))/34;
      vertex(location.x+x*10,location.y+y*10);
    }
    for (float x = 5; x >= 0; x-=0.1) {
      float y = -(16*x-sqrt(256*x*x-4*17*(17*x*x-225)))/34;
      vertex(location.x+x*10,location.y+y*10);
    }
    for (float x = 0; x >= -5; x-=0.1) {
      float y = -(16*(-x)-sqrt(256*x*x-4*17*(17*x*x-225)))/34;
      vertex(location.x+x*10,location.y+y*10);
    }
    for (float x = -5; x <= 0; x+=0.1) {
      float y = -(16*(-x)+sqrt(256*x*x-4*17*(17*x*x-225)))/34;
      vertex(location.x+x*10,location.y+y*10);
    }
    endShape();
    fill(r,g,b,150);
  }
  
  void checkEdges() {
  
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
  
    if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }
  
  }

}