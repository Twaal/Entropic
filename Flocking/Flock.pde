// The Flock (a list of Boid objects)

class Flock {
  ArrayList<Boid> boids; // An ArrayList for all the boids

  Flock() {
    boids = new ArrayList<Boid>(); // Initialize the ArrayList
  }

  void run() {
    int len = boids.size();
    int i = 0;
    for (Boid b : boids) {
      b.bri = map(i,0,len,0,255);
      i += 1;
      b.run(boids);  // Passing the entire list of boids to each boid individually
    }
  }

  void addBoid(Boid b) {
    boids.add(b);
    if(boids.size() > max_boids){
      boids.remove(0);}
  }

}
