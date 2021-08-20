
class Box{
  
  PVector location;
  float normal,friction,acceleration;
  float mass;
  float c,cstop;
  float theta;
  PVector velocity;
  
  Box(){
    
    location=new PVector(width-10-10*sin(angle),height-50-(width/2-10)*tan(angle)-10*cos(angle));
    normal=0;
    friction=0;
    mass=1;
    c=0.15;
    cstop=0.2;
    theta=PI-angle;
    velocity=new PVector(0,0);
  }
  
  void update(){
    pushMatrix();
    normal=mass*gravity*cos(PI-theta);
    friction=c*normal;
    acceleration=mass*gravity*sin(theta);
    PVector force=PVector.fromAngle(theta);
    if(velocity.mag()>0 || acceleration>=cstop*normal)force.mult((acceleration-friction)/mass);
    else force.mult(0);
    velocity.add(force);
    if(velocity.x>0)velocity.mult(0);
    location.add(velocity);
    if(location.y>height-60){
      location.y=height-60;
      velocity.x=-velocity.mag();
      velocity.y=0;
      theta=PI;
      c=2;
      cstop=3;
    }
    translate(location.x,location.y);
    rotate(theta);
    rect(-10,-10,20,20);
    popMatrix();
  }
  
}