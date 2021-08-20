
class Spider extends Agent2{
  
  float period;
  float amplitude, delta;
  float size;
  
  Spider(PVector l){
    super(l);
    period=random(50,100);
    amplitude=random(25,50);
    delta=random(70,100);
    size=random(0.1,0.3);
  }
  
  void drawBody(){
    pushMatrix();
    float y = delta+amplitude * sin(TWO_PI * frameCount / period);
    translate(location.x,location.y);
    tint(0,health);
    image(web,-web.width/2*size,-web.height/2*size,web.width*size,web.height*size);
    stroke(0,health);
    strokeWeight(2);
    line(0,0,0,y);
    tint(0,health);
    image(spider,-spider.width/2*size,y-spider.height/2*size,spider.width*size,spider.height*size);
    popMatrix();
  }
}