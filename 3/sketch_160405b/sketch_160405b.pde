
void setup() {
  size(640,360);
}

void draw() {
  background(255);

  float period = 120;
  float amplitude = 50, delta=150;
  float y = delta+amplitude * sin(TWO_PI * frameCount / period);  
  stroke(0);
  strokeWeight(2);
  fill(127);
  translate(width/2,0);
  line(0,0,0,y);
  ellipse(0,y,48,48);
}