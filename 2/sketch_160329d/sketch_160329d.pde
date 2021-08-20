
Mover[] movers = new Mover[9];

// Liquid
Liquid[] liquid = new Liquid[4];

void setup() {
  size(640, 640);
  reset();
  liquid[0] = new Liquid(0, height*1/5, width, height*1/4, 0.1,255,0,0);
  liquid[1] = new Liquid(0, height*1/2, width, height*1/20, 0.3,0,255,0);
  liquid[2] = new Liquid(0, height*3/5, width, height*3/10, 0.2,0,0,255);
  liquid[3] = new Liquid(0, height*9/10, width, height*1/10, 1,0,0,0);
}

void draw() {
  background(255);
  
  // Draw water
  for(int i=0;i<liquid.length;++i)liquid[i].display();

  for (int i = 0; i < movers.length; i++) {
    
    for(int j=0;j<liquid.length;++j){
      if (liquid[j].contains(movers[i])) {
        // Calculate drag force
        PVector dragForce = liquid[j].drag(movers[i]);
        // Apply drag force to Mover
        movers[i].applyForce(dragForce);
      }
    }

    // Gravity is scaled by mass here!
    PVector gravity = new PVector(0, 0.1*movers[i].mass);
    // Apply gravity
    movers[i].applyForce(gravity);
   
    // Update and display
    movers[i].update();
    movers[i].display();
    movers[i].checkEdges();
  }
  
  fill(0);
  text("click mouse to reset",10,30);
  
}

void mousePressed() {
  reset();
}

// Restart all the Mover objects randomly
void reset() {
  for (int i = 0; i < movers.length; i++) {
    movers[i] = new Mover(random(0.5, 3), 40+i*70, 0);
  }
}