
// Two ball objects
Ball[] ball=new Ball[1000];

// Global gravity variable
void setup() { 
  size(1000,1000); 
  smooth();
  
  for(int i=0;i<1000;++i)ball[i]=new Ball();
 
} 

void draw() { 
  background(255); 
  
  // Display ball objects
  for(int i=0;i<1000;++i)ball[i].display();

  for(int i=0;i<1000;++i)ball[i].update();

} 