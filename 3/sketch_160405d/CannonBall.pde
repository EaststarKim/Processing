class CannonBall { 
  // All of our regular motion stuff
  PVector location;
  PVector velocity;
  PVector acceleration;
  float angle;
  
  // Size
  float r = 8;
  
  float topspeed = 10;

  CannonBall(float x, float y) {
    location = new PVector(x,y);
    velocity = new PVector();
    acceleration = new PVector();
    angle=0;
  } 

  // Standard Euler integration
  void update() { 
    velocity.add(acceleration);
    velocity.limit(topspeed);
    location.add(velocity);
    acceleration.mult(0);
  }

  void applyForce(PVector force) {
    acceleration.add(force);
  }

  
  void display() { 
    stroke(0);
    strokeWeight(2);
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    fill(128);
    ellipse(0,0,r*3,r*3);
    fill(255,128,100,100);
    beginShape();
    for(int i=0;i<=360;i+=15){
      vertex(r*2*cos(PI/180*i),r*2*sin(PI/180*i));
      i+=15;
      vertex(r*2.5*cos(PI/180*i),r*2.5*sin(PI/180*i));
    }
    endShape();
    popMatrix();
    angle+=0.1;
  }
}