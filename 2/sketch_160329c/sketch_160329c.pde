
Mover[] balloon=new Mover[20];

void setup() {
  size(1000,640);
  for(int i=0;i<20;++i)balloon[i]=new Mover();
}

void draw() {
  background(255);

  PVector wind = new PVector(noise(1)/4-0.125,0);
  PVector buoyancy = new PVector(0,-0.1);
  
  for(int i=0;i<20;++i){
    balloon[i].applyForce(wind);
    balloon[i].applyForce(buoyancy);
  
    balloon[i].update();
    balloon[i].display();
    balloon[i].checkEdges();
  }

}