class Mover {

  // The Mover tracks location, velocity, and acceleration 
  PVector location;
  PVector velocity;
  PVector acceleration;
  // The Mover's maximum speed
  float topspeed;

  Mover() {
    // Start in the center
    location = new PVector(width/2,height/2);
    velocity = new PVector(0,0);
    topspeed = 5;
  }

  void update() {
    
    // Compute a vector that points from location to mouse
    PVector mouse = new PVector(mouseX,mouseY);
    PVector acceleration = PVector.sub(mouse,location);//static function
    // Set magnitude of acceleration
    acceleration.setMag(0.2);
    
    //
   // acceleration.normalize();
    //acceleration.mult(0.5);
    
    // Velocity changes according to acceleration
    velocity.add(acceleration);
    // Limit the velocity by topspeed
    velocity.limit(topspeed);
    // Location changes by velocity
    location.add(velocity);
  }

  void display() {
    stroke(0);
    strokeWeight(2);
    fill(153,255,153);
    PVector mouse=new PVector(mouseX,mouseY);
    PVector mover=new PVector(location.x,location.y);
    PVector ratio=PVector.sub(mouse,mover);
    float w=20+300/sqrt(ratio.mag()+20);
    ellipse(location.x,location.y,w,w);
  }

}