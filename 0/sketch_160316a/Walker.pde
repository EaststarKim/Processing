
class Walker {
  int x,y;

  Walker() {
    x = width/2;
    y = height/2;
  }

  void render() {
    stroke(0);
    point(x,y);
  }

  void step() {
    
    int choice = int(random(100));
    
    if (choice<=35) {
      x++;
    } else if (choice<=50) {
      x--;
    } else if (choice<=85) {
      y++;
    } else {
      y--;
    }

    x = constrain(x,0,width-1);
    y = constrain(y,0,height-1);
  }
}