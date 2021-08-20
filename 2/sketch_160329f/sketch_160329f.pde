
Mover[] movers = new Mover[20];

float k = 2;

void setup() {
  size(1000,500);
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(1,2),random(width),random(height),random(1)); 
  }
}

void draw() {
  background(255);


  for (int i = 0; i < movers.length; i++) {
    for (int j = 0; j < movers.length; j++) {
      if (i != j) {
        PVector force = movers[j].Force(movers[i]);
        movers[i].applyForce(force);
      }
    }

    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }

}