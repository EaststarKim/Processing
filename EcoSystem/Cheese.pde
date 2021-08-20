
class Cheese extends Agent {
  
  PVector location;
  float d=random(0.05, 0.1);
  
  Cheese(PVector l) {
    super(l);
    location=l;
  }
  
  void drawBody() {
    pushMatrix();
    translate(location.x, location.y);
    scale(d);
    tint(255,health);
    image(cheese,0,0);
    popMatrix();
    
  }
  

}