
class Cat extends Agent {
  
  float d=random(0.4, 0.6);
  float r=random(255);
  float g=random(255);
  float b=random(255);
  int i=0,j=0;
  
  Cat(PVector l) {
    super(l);
  }

  void drawBody() {
    if(i>54)i=0;
    if(j>44){
      j=0;
      chasechk=false;
    }
    pushMatrix();
    translate(location.x, location.y);
    rotate(velocity.heading());
    tint(r,g,b,health);
    if(chasechk==false){
      scale(d);
      image(cat1[i++/5],0,0);
    }
    else{
      scale(d*0.8);
      image(cat2[j++/5],0,0);
    }
    popMatrix();
  }
  



}