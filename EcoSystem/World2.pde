
class World2 {

  ArrayList<Agent2> agents;   

  World2(int num) {
    agents = new ArrayList<Agent2>();              
    for (int i = 0; i < num; i++) {
      PVector l = new PVector(random(width),random(height));
      agents.add(new Spider(l));
    }
  }

  void born(float x, float y) {
    PVector l = new PVector(x,y);
    agents.add(new Spider(l));
  }

  void run() {
    
    for (int i = agents.size()-1; i >= 0; i--) {
      Agent2 a = agents.get(i);
      a.run();
      if (a.dead()) {
        agents.remove(i);
      }
    }
  }
  
}