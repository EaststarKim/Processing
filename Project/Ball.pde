
class Ball{
  
  PVector loc;
  PVector v;
  
  Ball(int x,int y){
    loc=new PVector(x,y);
    v=new PVector(0,0);
  }
  
  void move(PVector g){
    loc.add(v);
    v.add(g);
  }
  
  void run(){
    loadPixels();
    PVector a=new PVector(0,0);
    for(int i=94*width;i<width*height;++i){
      color c=pixels[i];
      if(red(c)!=green(c)||red(c)!=blue(c)||green(c)!=blue(c))continue;
      float val=255-brightness(c);
      if(val==0)continue;
      PVector p=new PVector(i%width,i/width);
      p.sub(loc);
      PVector tmp;
      tmp=p.copy();
      if(p.mag()>0)a.add(tmp.mult(0.000001*val/(p.mag()*p.mag())));
    }
    
    
    if(a.mag()<1e-4)return;
    
    stroke(255);
    ellipse(loc.x,loc.y,5,5);
    
    move(a);
    
    fill(255,0,0);
    noStroke();
    ellipse(loc.x,loc.y,5,5);
    
  }
  
}