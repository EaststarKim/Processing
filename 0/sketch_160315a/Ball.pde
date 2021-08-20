class Ball {

  float x;       // x location of square 
  float y;       // y location of square 
  float xspeed,yspeed;   // speed of square 
  float w;       // size
  float gravity;
  float r,g,b;
  float e;
  // Ball constuctor
  Ball() {
    x = random(1000);
    y = random(1000);
    w = random(100);
    xspeed=random(-10,10);
    yspeed=0;
    gravity=0.1;
    r=random(255);
    g=random(255);
    b=random(255);
    e=-random(0.8,0.95);
  }


  void display() {
    // Display the square 
    fill(r,g,b); 
    stroke(0); 
    ellipse(x,y,w,w); 
  }

  void update() {
    // Add speed to location
    x=x+xspeed;
    y=y+yspeed; 

    // Add gravity to speed
    
    yspeed = yspeed + gravity;
    // If square reaches the bottom 
    // Reverse speed 
    if (x > width)xspeed = xspeed * e;
    if (x < 0)xspeed = xspeed * e;
    if(y > height)yspeed = yspeed * e;
  }
}