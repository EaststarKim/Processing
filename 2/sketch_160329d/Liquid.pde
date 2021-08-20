 // Liquid class 
 class Liquid {

  
  // Liquid is a rectangle
  float x,y,w,h;
  // Coefficient of drag
  float c;
  float r,g,b;

  Liquid(float x_, float y_, float w_, float h_, float c_, float r_, float g_, float b_) {
    x = x_;
    y = y_;
    w = w_;
    h = h_;
    c = c_;
    r = r_;
    g = g_;
    b = b_;
  }
  
  // Is the Mover in the Liquid?
  boolean contains(Mover m) {
    PVector l = m.location;
    return l.x > x && l.x < x + w && l.y > y && l.y < y + h;
  }
  
  // Calculate drag force
  PVector drag(Mover m) {
    // Magnitude is coefficient * speed squared
    float speed = m.velocity.mag();
    float dragMagnitude = c * speed * speed;

    // Direction is inverse of velocity
    PVector dragForce = m.velocity.get();
    dragForce.mult(-1);
    
    // Scale according to magnitude
    // dragForce.setMag(dragMagnitude);
    dragForce.normalize();
    dragForce.mult(dragMagnitude);
    return dragForce;
  }
  
  void display() {
    noStroke();
    fill(r,g,b,50);
    rect(x,y,w,h);
  }

}