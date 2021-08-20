
Walker w;

void setup() {
  size(1000,500);
  w = new Walker();
}

void draw() {
  w.step();
  background(255);
  w.render();
}