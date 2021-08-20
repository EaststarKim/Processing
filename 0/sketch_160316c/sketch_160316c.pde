void setup() {
  size(640, 640);
  background(255);
}

void draw() {

  float xloc = randomGaussian(),yloc=randomGaussian();

  float sd = 60;
  float mwidth = width/2,mheight=height/2;
  xloc = ( xloc * sd ) + mwidth;
  yloc = ( yloc * sd ) + mheight;
  
  stroke(randomGaussian()*255, randomGaussian()*255, randomGaussian()*255);
  point(xloc, yloc);
}