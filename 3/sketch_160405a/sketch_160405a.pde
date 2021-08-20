
// PolarToCartesian
// Convert a polar coordinate (r,theta) to cartesian (x,y):  
// x = r * cos(theta)
// y = r * sin(theta)
 
float r;
float theta;

void setup() {
  size(640, 640);
  background(255);
  // Initialize all values
  r = 0;
  theta = 0;
}

void draw() {
  
  // Translate the origin point to the center of the screen
  translate(width/2, height/2);
  
  for(int i=0;i<20;++i){
    // Convert polar to cartesian
    float x = r * cos(theta);
    float y = r * sin(theta);
    
    // Draw the ellipse at the cartesian coordinate
    ellipseMode(CENTER);
    fill(255-r*0.7);
    noStroke();
    ellipse(x, y, 15, 15);
    
    // Increase the angle over time
    theta += 0.01;
    r+=0.05; 
  }
}