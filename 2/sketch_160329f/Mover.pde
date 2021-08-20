
class Mover {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass,charge;

  Mover(float m, float x, float y,float z) {
    mass = m;
    location = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0, 0);
    charge=(z>0.5?1:-1)*mass;
  }

  void applyForce(PVector force) {
    PVector f = PVector.div(force, mass);
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
    fill(0, 100);
    ellipse(location.x, location.y, mass*24, mass*24);
    line(location.x-10,location.y,location.x+10,location.y);
    if(charge>0)line(location.x,location.y-10,location.x,location.y+10);
  }

  PVector Force(Mover m) {
    PVector force = PVector.sub(location, m.location);             // Calculate direction of force
    float distance = force.mag();                                 // Distance between objects
    distance = constrain(distance, 5.0, 25.0);                             // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                            // Normalize vector (distance doesn't matter here, we just want this vector for direction

    float strength = -(k * charge * m.charge) / (distance * distance); // Calculate gravitional force magnitude
    force.mult(strength);                                         // Get force vector --> magnitude * direction
    return force;
  }
  
  void checkEdges() {
    if (location.x < 0) location.x=width;
    if (location.x > width) location.x = 0;
    if (location.y < 0) location.y = height;
    if (location.y > height) location.y = 0;

  }

}