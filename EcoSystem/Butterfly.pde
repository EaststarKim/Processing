
class Butterfly extends Agent {
  
  float s = random(-90, 90);
  float d = random(0.1, 0.3);
  float r=random(255);
  float g=random(255);
  float b=random(255);
  float ratio=random(0.5,1);
  float delta=0.01;
  
  Butterfly(PVector l) {
    super(l);
    
  }
  
  void drawBody() {
    if(ratio<0.5)delta=-delta;
    if(ratio>1)delta=-delta;
    ratio+=delta;
    pushMatrix();
      translate(location.x, location.y);
      scale(d);
      stroke(0,health);
      strokeWeight(5);
      fill(r,g,b,health);
      
      rotate(velocity.heading()-radians(45));
      beginShape();
        for (int i = 0; i <= 180; i+=20) {
          float x = tan(radians(i)) * i/3;
          float angle = sin(radians(i+s+frameCount*5)) * 50;
          vertex((x-angle)*ratio, i*2*ratio);
          vertex((x-angle)*ratio, i*2*ratio);
        }
        
       for (int i = 180; i >= 0; i-=20) {
          float x = sin(radians(i)) * i/3;
          float angle = sin(radians(i+s+frameCount*5)) * 50;
          vertex((-x-angle)*ratio, i*2*ratio);
          vertex((-x-angle)*ratio, i*2*ratio);
      }
      endShape();
    popMatrix();
  }
  



}