
World world;
//World2 world2;

PImage[] cat1=new PImage[11];
PImage[] cat2=new PImage[9];
PImage mouse,cheese,spider,web;

boolean simpleGraphics;
String Mode=new String();

ArrayList<ParticleSystem> Psystem;

void setup() {

  size(1000, 800);
  simpleGraphics = false;
  world = new World(20,10,5);
  //world2 = new World2(5);
  smooth();
  
  for(int i=0;i<11;++i)cat1[i]=loadImage((i+1)+".PNG");
  for(int i=0;i<9;++i)cat2[i]=loadImage("cat"+(i+1)+".PNG");
  mouse=loadImage("Mouse.PNG");
  cheese=loadImage("Cheese.PNG");
  
  spider=loadImage("Spider.PNG");
  web=loadImage("Web.PNG");
  
  Psystem = new ArrayList<ParticleSystem>();
  
}

void draw() {
  background(255);
  
  for(int i = Psystem.size()-1; i>=0; i--) {
    ParticleSystem p = Psystem.get(i);
    if(p.particles.size()==0)Psystem.remove(p);
    else p.run();
  }
  
  world.run();
  //world2.run();
  
  fill(0);
  text("Press 's' to view SimpleMode", 10, height-8);
  
  text("left click : create / right click : delete",10,20);
  text("<change Mode>\nCheese(a)\nMouse(b)\nCat(c)",10,40);
  
  text("cheeses : "+world.cheeses.size(),10,height-64);
  text("mice : "+world.mice.size(),10,height-48);
  text("cats : "+world.cats.size(),10,height-32);
  
}

void mousePressed() {
  if(mouseButton == LEFT)world.born(mouseX,mouseY);
  //world2.born(mouseX,mouseY);
  
  else{
    ParticleSystem p = new ParticleSystem(new PVector(mouseX,mouseY));
    Psystem.add(p);
  }
  
}

void mouseDragged() {
  if(mouseButton == LEFT)world.born(mouseX,mouseY);
  //world2.born(mouseX,mouseY);
  
  else{
    ParticleSystem p = new ParticleSystem(new PVector(mouseX,mouseY));
    Psystem.add(p);
  }
  
}

void keyPressed() {

  if (key == 's') {
    changeGraphicsMode();
  }
  if (key == 'a') {
    Mode = "Cheese"; 
  }
  if (key == 'b') {
    Mode = "Mouse";
  }
  
  if (key == 'c') {
    Mode = "Cat";
  }
  
}

void changeGraphicsMode() {
    simpleGraphics = !simpleGraphics;
}