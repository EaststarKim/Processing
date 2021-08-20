
class Agent2 {
  PVector location;
  float health;
  float r;
  
  Agent2(PVector l) {
    location = l.copy();
    health = 200;
    r = map(random(1), 0, 1, 0, 50);
  }
  
  void run() {
    update();
    borders();
    display();
  }
  
  void update() {
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

  boolean dead() {
    if (health < 0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}