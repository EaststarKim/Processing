
float angle;
Box box;
float gravity=0.2;
boolean chk=false;

void setup(){
  
  size(800,800);
  angle=PI/6;
  box=new Box();
  
}

void draw(){
  
  background(255);
  strokeWeight(2);
  rect(0,height-50,width,height);
  triangle(width/2,height-50,width,height-50-width/2*tan(angle),width,height-50);
  
  if(chk==true)box=new Box();
  box.update();
  chk=false;
  
}

void keyPressed(){
  if(key==CODED && keyCode==LEFT){
    chk=true;
    angle+=PI/90;
    if(angle>PI/3)angle=PI/3;
  }
  if(key==CODED && keyCode==RIGHT){
    chk=true;
    angle-=PI/90;
    if(angle<0)angle=0;
  }
}