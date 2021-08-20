ArrayList<Particle> particles;

void setup() {
  size(640,360);
  particles=new ArrayList<Particle>();
  background(255);
  smooth();
}

void draw() {
  background(255);
  if(particles.size()<128)particles.add(new Particle(new PVector(width/2,20)));
  for(int i=particles.size()-1;i>=0;--i){
    Particle p=particles.get(i);
    p.run();
    if (p.isDead()) {
      particles.remove(i);
      p=new Particle(new PVector(width/2,20));
      particles.add(p);
      //println("Particle dead!"); 
    }
  }
}