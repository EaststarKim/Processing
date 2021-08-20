
class Mouse extends Agent {
  
  float d=random(0.2, 0.4);
  float r=random(255);
  float g=random(255);
  float b=random(255);
  
  Mouse(PVector l) {
    super(l);
  }
  
  void drawBody() {
    pushMatrix();
    translate(location.x, location.y);
    scale(d);
    rotate(velocity.heading()-180);
    tint(r,g,b,health);
    image(mouse,0,0);
    popMatrix();
    
  }
  

}