
class Rocket{
  
  PVector location;
  float speed;
  float angle;
  
  Rocket(){
    location=new PVector(width/2,height/2);
    speed=0;
    angle=0;
  }
  
  void applyForce(float force){
    speed+=force;
    if(speed<0){
      speed=0;
    }
    if(speed>50)speed=50;
  }
  
  void update(){
    pushMatrix();
    PVector velocity=new PVector(speed*cos(angle),speed*sin(angle));
    location.add(velocity);
    if(location.x<0)location.x=width;
    if(location.x>width)location.x=0;
    if(location.y<0)location.y=height;
    if(location.y>height)location.y=0;
    if(thrust==false){
      translate(location.x-rocket1.width/2,location.y-rocket1.height/2);
      rotate(angle);
      image(rocket1,0,0,rocket1.width/4,rocket1.height/4);
    }
    else{
      translate(location.x-rocket2.width/2,location.y-rocket2.height/2);
      rotate(angle);
      image(rocket2,0,0,rocket2.width/4,rocket2.height/4);
    }
    popMatrix();
  }
}