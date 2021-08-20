
// A random walker object!

class Walker {
  int x,y;

  Walker() {
    x = width/2;
    y = height/2;
    fill(random(256),random(256),random(256));
  }

  void render() {
    stroke(0);
    ellipse(x,y,50,50);
  }

  // Randomly move up, down, left, right, or stay in one place
  void step() {
    
    int choice = int(random(2));
    int vx,vy;
    
    if(choice==0){
      vx=(mouseX-x)/5;
      vy=(mouseY-y)/5;
    }
    else{
      vx=vy=0;
    }
    
    x = constrain(x+vx,0,width-1);
    y = constrain(y+vy,0,height-1);
  }
}