

// All of this stuff should go into a Cannon class
float angle = -PI/4;
PVector location = new PVector(50, 520);
boolean shot = false;
ArrayList<PVector> boom=new ArrayList<PVector>();

CannonBall ball;

void setup() {
  size(1500, 600);
  ball = new CannonBall(location.x, location.y);
}

void draw() {
  background(255);
  pushMatrix();
  
  translate(location.x, location.y);
  rotate(angle);
  fill(128,128,128,50);
  rect(20, -15, 30, 30);
  ellipse(0,0,50,50);
  rotate(-angle);
  fill(128);
  rect(-30,5,60,70);
  fill(0,255,0);
  rect(-60,20,1510,60);
  popMatrix();
  for(int i=0;i<=boom.size()-1;++i){
    PVector a=boom.get(i);
    fill(0);
    ellipse(a.x,a.y+30,30,30);
  }
  if (shot) {
    PVector gravity = new PVector(0, 0.2);
    ball.applyForce(gravity);
    ball.update();
    ball.display();
  }
  else{
    fill(0);
    text("Press space key to shot!", 10,450);
  }
  
  if (ball.location.y > height-75) {
    boom.add(ball.location);
    ball = new CannonBall(location.x, location.y);
    shot = false;
  }
}

void keyPressed() {
  if (key == CODED && keyCode == RIGHT) {
    angle += 0.1;
    if(angle>0)angle=0;
  } 
  else if (key == CODED && keyCode == LEFT) {
    angle -= 0.1;
    if(angle<-PI/2)angle=-PI/2;
  } 
  else if (key == ' ') {
    shot = true;
    PVector force = PVector.fromAngle(angle); 
    force.mult(10);
    ball.applyForce(force);
  }
}