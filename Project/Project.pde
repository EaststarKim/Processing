
Button rec,ell,pol,bal,sta,pau,pen,grid;

int[] x,y;
int t;

float d;
int th;

PVector g;
int mx,my;

ArrayList<Ball> ball;


void setup(){
  size(1200,600);
  
  rec=new Button(20,10,60,60,0);
  ell=new Button(90,10,60,60,1);
  pol=new Button(160,10,60,60,2);
  bal=new Button(230,10,60,60,3);
  sta=new Button(300,10,60,60,4);
  pau=new Button(370,10,60,60,5);
  pen=new Button(440,10,60,60,6);
  grid=new Button(1120,10,60,60,7);
  
  x=new int[1000];
  y=new int[1000];
  t=0;
  
  d=1;
  th=5;
  
  g=new PVector();
  
  ball=new ArrayList<Ball>();
  
  
  background(255);
  colorMode(RGB,255);
  
  
  frameRate(1000);
  
}

void draw(){
  
  fill(255);
  noStroke();
  rect(0,0,width,90);
  
  stroke(0);
  strokeWeight(5);
  line(0,90,width,90);
  
  rec.display();
  ell.display();
  pol.display();
  bal.display();
  sta.display();
  pau.display();
  pen.display();
  grid.display();
  
  if(sta.clicked){
    for(int i=ball.size()-1;i>=0;--i){
      Ball b=ball.get(i);
      b.run();
    }
  }
  
  fill(0);
  if(rec.clicked)text("mode : rectangle",width-680,20);
  
  if(ell.clicked)text("mode : circle",width-680,20);
  
  if(pol.clicked)text("mode : polygon",width-680,20);
  
  if(bal.clicked)text("mode : ball",width-680,20);
  
  if(sta.clicked)text("mode : start",width-680,20);
  
  if(pen.clicked){
    text("mode : pen",width-680,20);
    text("pen thickness : "+th,width-680,40);
  }
  
  if(grid.clicked){
    
    for(int i=93;i<height;i+=30){
      stroke(0,0,255);
      strokeWeight(1);
      line(0,i,width,i);
    }
    
    for(int i=0;i<width;i+=30){
      stroke(0,0,255);
      strokeWeight(1);
      line(i,93,i,height);
    }
    
  }
  
  text("mouse : "+"("+mouseX+", "+mouseY+")",width-500,20);
  
  text("density : "+d, width-500, 40);
  
  if(g.mag()<1e-4)text("gravity : "+g.mag()+" / (0.0, 0.0)",width-500,60);
  
  else text("gravity : "+g.mag()+" / ("+g.x+", "+g.y+")",width-500,60);
  
  
  
}

void mouseReleased(){
  
  if(mouseButton==LEFT){
    
    if(rec.mousein()){
      ell.clicked=pol.clicked=bal.clicked=sta.clicked=pau.clicked=pen.clicked=false;
      rec.clicked=!rec.clicked;
      t=0;
    }
    
    else if(ell.mousein()){
      rec.clicked=pol.clicked=bal.clicked=sta.clicked=pau.clicked=pen.clicked=false;
      ell.clicked=!ell.clicked;
      t=0;
    }
    
    else if(pol.mousein()){
      rec.clicked=ell.clicked=bal.clicked=sta.clicked=pau.clicked=pen.clicked=false;
      pol.clicked=!pol.clicked;
      t=0;
    }
    
    else if(bal.mousein()){
        rec.clicked=ell.clicked=pol.clicked=sta.clicked=pau.clicked=pen.clicked=false;
        bal.clicked=!bal.clicked;
        t=0;
    }
    
    else if(sta.mousein()){
        rec.clicked=ell.clicked=pol.clicked=bal.clicked=pau.clicked=pen.clicked=false;
        sta.clicked=true;
        t=0;
    }
    
    else if(pau.mousein()){
        rec.clicked=ell.clicked=pol.clicked=bal.clicked=sta.clicked=pen.clicked=false;
        t=0;
    }
    
    else if(pen.mousein()){
        rec.clicked=ell.clicked=pol.clicked=bal.clicked=sta.clicked=pau.clicked=false;
        pen.clicked=!pen.clicked;
        t=0;
    }
    
    else if(grid.mousein()){
      grid.clicked=!grid.clicked;
    }
    
    if(rec.clicked){
      if(mouseY<=90)return;
      x[++t]=mouseX;
      y[t]=mouseY;
      fill(0);
      noStroke();
      ellipse(x[t],y[t],1,1);
      
      if(t==2){
        noStroke();
        if(d==0)fill(255);
        else fill(200-d);
        rect(min(x[1],x[2]),min(y[1],y[2]),abs(x[1]-x[2]),abs(y[1]-y[2]));
        t=0;
      }
    }
    if(ell.clicked){
      if(mouseY<=90)return;
      x[++t]=mouseX;
      y[t]=mouseY;
      fill(0);
      noStroke();
      ellipse(x[t],y[t],1,1);
      
      if(t==2){
        noStroke();
        if(d==0)fill(255);
        else fill(200-d);
        int r=(int)sqrt((x[2]-x[1])*(x[2]-x[1])+(y[2]-y[1])*(y[2]-y[1]));
        ellipse(x[1],y[1],r*2,r*2);
        t=0;
      }
    }
    if(pol.clicked){
      if(mouseY<=90)return;
      x[++t]=mouseX;
      y[t]=mouseY;
      fill(0);
      noStroke();
      ellipse(x[t],y[t],1,1);
      
      if(x[t]==x[t-1]&&y[t]==y[t-1]){
        noStroke();
        if(d==0)fill(255);
        else fill(200-d);
        beginShape();
        for(int i=1;i<=t;++i)vertex(x[i],y[i]);
        endShape();
        t=0;
      }
    }
    if(bal.clicked){
      if(mouseY<=90)return;
      x[++t]=mouseX;
      y[t]=mouseY;
      fill(0,255,0);
      noStroke();
      ellipse(x[t],y[t],1,1);
      
      if(t==1){
        Ball b=new Ball(x[1],y[1]);
        ball.add(b);
        fill(255,0,0);
        noStroke();
        ellipse(b.loc.x,b.loc.y,5,5);
        t=0;
      }
    }
  }
  else{
    
    fill(255);
    noStroke();
    ellipse(mx,my,2,2);
    
    loadPixels();
    mx=mouseX;
    my=mouseY;
    PVector m=new PVector(mx,my);
    fill(255,0,0);
    noStroke();
    ellipse(mouseX,mouseY,1,1);
    
    g=new PVector(0,0);
    for(int i=94*width;i<width*height;++i){
      PVector p=new PVector(i%width,i/width);
      color c=pixels[i];
      if(red(c)!=green(c)||red(c)!=blue(c)||green(c)!=blue(c))continue;
      float val=255-brightness(c);
      if(val==0)continue;
      p.sub(m);
      PVector tmp;
      tmp=p.copy();
      if(p.mag()>0)g.add(tmp.mult(0.00001*val/(p.mag()*p.mag())));
    }
    
  }
  
}

void mouseClicked(){
  if(pen.clicked){
    noStroke();
    if(d==0)fill(255);
    else fill(200-d);
    ellipse(mouseX,mouseY,th,th);
  }
}

void mouseDragged(){
  if(pen.clicked){
    noStroke();
    if(d==0)fill(255);
    else fill(200-d);
    ellipse(mouseX,mouseY,th,th);
  }
}

void mouseWheel(MouseEvent event){
  float e=event.getCount();
  th-=e;
  if(th<5)th=5;
  if(th>50)th=50;
}

void keyPressed(){
  
  if(key==CODED){
    
    if(keyCode==UP){
      d+=20;
      if(d>200)d=200;
    }
    
    if(keyCode==DOWN){
      d-=20;
      if(d<0)d=0;
    }
    
    if(keyCode==RIGHT){
      ++d;
      if(d>200)d=0;
    }
    
    if(keyCode==LEFT){
      --d;
      if(d<0)d=0;
    }
    
  }
  
  else{
    
    if(key=='r'){
      setup();
    }
    
    if(key=='0'){
      d=0;
    }
    
  }
  
}