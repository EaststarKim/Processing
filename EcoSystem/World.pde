
class World {

  ArrayList<Agent> cheeses;
  ArrayList<Agent> mice;
  ArrayList<Agent> cats;   

  World(int num1,int num2,int num3) {
    cheeses = new ArrayList<Agent>();
    for (int i = 0; i < num1; i++) {
      PVector l = new PVector(random(width),random(height));
      cheeses.add(new Cheese(l));
    }
    mice = new ArrayList<Agent>();
    for (int i = 0; i < num2; i++) {
      PVector l = new PVector(random(width),random(height));
      mice.add(new Mouse(l));
    }
    cats = new ArrayList<Agent>();
    for (int i = 0; i < num3; i++) {
      PVector l = new PVector(random(width),random(height));
      cats.add(new Cat(l));
    }
  }

  void born(float x, float y) {
    PVector l = new PVector(x,y);
    if(Mode == "Cheese") {
      cheeses.add(new Cheese(l));
    }
    if(Mode == "Mouse") {
      mice.add(new Mouse(l));
    }
    if(Mode == "Cat") {
      cats.add(new Cat(l));
    }
  }

  void run() {
    
    for (int i = cheeses.size()-1; i >= 0; i--) {
      Agent a = cheeses.get(i);
      
      a.run();
      
      if(a.dead()){
        cheeses.remove(i);
      }
      
    }
    for (int i = mice.size()-1; i >= 0; i--) {
      Agent a = mice.get(i);
      a.acceleration.mult(0);
      PVector force1 = new PVector();
      PVector force2 = new PVector();
      force1 = escape(i);
      force2 = move(i);
      a.acceleration=PVector.add(force1,force2);
      a.run();
      
      if (a.dead()) {
        mice.remove(i);
      }
    }
    for (int i = cats.size()-1; i >= 0; i--) {
      Agent a = cats.get(i);
      a.acceleration.mult(0);
      PVector force = chase(i);
      force = chase(i);
      a.acceleration.add(force);
      a.run();
      if (a.dead()) {
        cats.remove(i);
      }
    }
  }
  
  PVector move(int index){
    Agent mouse = mice.get(index);
    PVector min=new PVector(width,height);
    int mi=0;
    PVector force=new PVector(random(mouse.maxspeed/4)-mouse.maxspeed/8,random(mouse.maxspeed/4)-mouse.maxspeed/8);
    
    if(cheeses.size()==0)return force;
    for(int i = cheeses.size()-1; i >= 0; i--){
      Agent cheese = cheeses.get(i);
      PVector distance = PVector.sub(cheese.location,mouse.location);
      if(distance.mag()<min.mag()){
        min=distance.copy();
        mi=i;
      }
    }
    
    if(min.mag()<5){
      Agent cheese = cheeses.get(mi);
      cheese.health=0;
      mouse.health+=10;
      return new PVector(0,0);
    }
    
    else{
      min.normalize();
      force=min.mult(mouse.maxspeed/4);
    }
    
    return force;
  }
  PVector escape(int index){
    Agent mouse = mice.get(index);
    PVector min=new PVector(width,height);
    PVector force=new PVector(random(mouse.maxspeed/4)-mouse.maxspeed/8,random(mouse.maxspeed/4)-mouse.maxspeed/8);
    
    if(cats.size()==0)return force;
    for(int i = cats.size()-1; i >= 0; i--){
      Agent cat = cats.get(i);
      PVector distance = PVector.sub(mouse.location,cat.location);
      if(distance.mag()<min.mag())min=distance.copy();
      
    }
    
    if(min.mag()>300){
      min.normalize();
      force=min.mult(mouse.maxspeed/3);
    }
    else{
      min.normalize();
      force=min.mult(mouse.maxspeed);
    }
    
    return force;
    
  }
  PVector chase(int index){
    Agent cat = cats.get(index);
    if(cat.chasechk==true)return new PVector(0,0);
    PVector min=new PVector(width,height);
    int mi=0;
    PVector force=new PVector(random(cat.maxspeed/4)-cat.maxspeed/8,random(cat.maxspeed/4)-cat.maxspeed/8);
    
    if(mice.size()==0)return force;
    for(int i = mice.size()-1; i >= 0; i--){
      Agent mouse = mice.get(i);
      PVector distance = PVector.sub(mouse.location,cat.location);
      if(distance.mag()<min.mag()){
        min=distance.copy();
        mi=i;
      }
    }
    
    if(min.mag()<50){
      Agent mouse = mice.get(mi);
      mouse.health=0;
      cat.health+=20;
      return new PVector(0,0);
    }
    else if(min.mag()<100){
        min.normalize();
        min.mult(cat.maxspeed*4);
        force=min;
        cat.chasechk=true;
        return force;
     }
     else{
       min.normalize();
       min.mult(cat.maxspeed);
       force=min;
       return force;
     }
  }
}