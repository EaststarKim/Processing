
PImage back,rocket1,rocket2;
Rocket rocket;
boolean thrust=false;

void setup(){
  
  size(1200,800);
  back=loadImage("background.png");
  rocket1=loadImage("walkr1.png");
  rocket2=loadImage("walkr2.png");
  
  rocket=new Rocket();
  
}

void draw(){
  
  image(back,0,0,width,height);
  rocket.applyForce(-0.5);
  rocket.update();

}

void keyPressed() {
  if (key == CODED && keyCode == RIGHT) {
    rocket.angle += 0.1;
  } 
  else if (key == CODED && keyCode == LEFT) {
    rocket.angle -= 0.1;
  } 
  else if (key == 'z') {
    thrust=true;
    rocket.applyForce(10);
  }
}

void keyReleased(){
  if(key=='z'){
    thrust=false;
  }
}