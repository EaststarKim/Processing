
Mover m;

void setup() {
  size(1000, 360);
  m = new Mover();
}

void draw() {
  background(255);

  float A=0.01, c=0.05, v;
  PVector drag;

  v=m.velocity.mag();
  drag=new PVector(-c*0.0001,-0.5*A*c*v*v);

  m.applyForce(drag);

  m.update();
  m.display();
  m.checkEdges();
}