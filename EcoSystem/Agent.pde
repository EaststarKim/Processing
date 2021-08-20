
class Agent {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float health;
  float xoff;
  float yoff;
  
  float r;
  float maxspeed;
  
  boolean chasechk=false;
  
  Agent(PVector l) {
    location = l.copy();
    health = 200;
    
    maxspeed = map(random(1)+1, 1, 2, 1, 5);
    r = map(random(1), 0, 1, 0, 50);
    
    velocity = new PVector(random(maxspeed/2)-maxspeed/4, random(maxspeed/2)-maxspeed/4);
    acceleration = new PVector(0,0);
    
  }
  
  void run() {
    update();
    borders();
    display();
  }
  
  void update() {
    
    velocity.add(acceleration);
    if(velocity.mag()>maxspeed){
      velocity.normalize();
      velocity.mult(maxspeed);
    }
    location.add(velocity);
    
    health -= 0.2;
  }
  
  void borders() {
    if (location.x < -r) location.x = width+r;
    if (location.y < -r) location.y = height+r;
    if (location.x > width+r) location.x = -r;
    if (location.y > height+r) location.y = -r;
  }
  
  void display() {
    
    pushMatrix();
      if(simpleGraphics == false)
        drawBody();
      else
        simpleShape();
    popMatrix();
  }
  
  void drawBody() {
  
  }
  void simpleShape() {
      ellipseMode(CENTER);
      stroke(0,health);
      fill(0, health);
      ellipse(location.x, location.y, r, r);
  }
  
  boolean killed(){
    for(int i=Psystem.size()-1;i>=0;--i){
      ParticleSystem psystem = Psystem.get(i);
      for(int j=psystem.particles.size()-1;j>=0;--j){
        Particle particle = psystem.particles.get(j);
        PVector distance = PVector.sub(particle.location,this.location);
        if(distance.mag()<30)return true;
      }
    }
    return false;
  }
  
  boolean dead() {
    if (health < 0.0 || killed()) {
      return true;
    } 
    else {
      return false;
    }
  }
}