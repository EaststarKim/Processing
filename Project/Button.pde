
class Button{
  
  int x,y,w,h;
  boolean clicked;
  int shape;
  
  Button(int x,int y,int w,int h,int shape){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=h;
    this.shape=shape;
    clicked=false;
  }
  
  boolean mousein(){
    return x<=mouseX&&mouseX<=x+w&&y<=mouseY&&mouseY<=y+h;
  }
  
  void display(){
    stroke(0);
    strokeWeight(5);
    fill(255);
    rect(x,y,w,h,7);
    
    if(mousein()||clicked){
      stroke(0,0,255);
      strokeWeight(4);
      noFill();
      rect(x+w/8,y+h/8,w*3/4,h*3/4,5);
    }
    
    fill(0);
    stroke(1);
    
    if(shape==0){
      rect(x+w/4,y+h/4,w/2,h/2);
    }
    
    if(shape==1){
      ellipse(x+w/2,y+h/2,w/2,h/2);
    }
    
    if(shape==2){
      beginShape();
      vertex(x+w/2,y+h/4);
      vertex(x+w*3/4,y+h/2);
      vertex(x+w*2/3,y+h*3/4);
      vertex(x+w/3,y+h*3/4);
      vertex(x+w/4,y+h/2);
      vertex(x+w/2,y+h/4);
      endShape();
    }
    
    if(shape==3){
      fill(255,0,0);
      ellipse(x+w/2,y+h/2,w/3,h/3);
    }
    
    if(shape==4){
      fill(0);
      triangle(x+w/4,y+h/4,x+w*3/4,y+h/2,x+w/4,y+h*3/4);
    }
    
    if(shape==5){
      rect(x+w/4,y+h/4,w/6,h/2);
      rect(x+w*7/12,y+h/4,w/6,h/2);
    }
    
    if(shape==6){
      
      beginShape();
      vertex(x+w/3,y+h/4);
      vertex(x+w*5/12,y+h/4);
      vertex(x+w*5/12,y+h*2/3);
      vertex(x+w*9/24,y+h*3/4);
      vertex(x+w/3,y+h*2/3);
      vertex(x+w/3,y+h/4);
      endShape();
      
      stroke(0);
      strokeWeight(3);
      line(x+w*9/24,y+h*5/6,x+w*3/4,y+h*5/6);
    }
    
    if(shape==7){
      strokeWeight(5);
      line(x+w/3,y+h/4,x+w/3,y+h*3/4);
      line(x+w*2/3,y+h/4,x+w*2/3,y+h*3/4);
      line(x+w/4,y+h/3,x+w*3/4,y+h/3);
      line(x+w/4,y+h*2/3,x+w*3/4,y+h*2/3);
      
    }
  }
  
}