PImage img;
PShape globe;

float x=0,y=0;

void setup() {
  size(1500, 900, P3D);
}

void draw() {
  background(255);
  //camera(x,y,(height/2)/tan(PI/9),width/2,height/2,0,0,1,0);
  //camera(mouseX, mouseY, (height/2) / tan(PI/9), width/2, height/2, 0, 0, 1, 0);
  translate(width/2, height/2, -100);
  stroke(255);
  noFill();
  lights();
  stroke(255,50);
  img = loadImage("earth.jpg");
  globe = createShape(SPHERE, 300);
  globe.setTexture(img);
  globe.rotateY(x/50);
  globe.rotateX(-y/50);
  shape(globe);
}
/*
void keyPressed(){
  if(keyCode==LEFT)x-=100;
  if(keyCode==RIGHT)x+=100;
  if(keyCode==UP)y-=100;
  if(keyCode==DOWN)y+=100;
}*/

void mouseDragged(){
  x+=mouseX-pmouseX;
  y+=mouseY-pmouseY;
}