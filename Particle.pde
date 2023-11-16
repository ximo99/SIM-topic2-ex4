class Particle {
  PVector s;
  PVector v;
  PVector a;

  Particle(PVector s0) {
    s = s0.get();
    v = new PVector(random(-4, 4), random(-4, 0));
    a = new PVector(0, 0.1);
    
    v.mult(ball.v.y / 50.0);
  }
  
  void run() {
    update();
    display();
  }

  // Method to update the position
  void update() {
    v.add(a);
    s.add(v);
  }

  // Method to display
  void display() {
    noStroke();
    fill(0, 196, 255, 200);
    
    if ((s.y > height/2) || (s.y > height/2 && s.y < height/2))
      fill(0, 196, 255, 0);
    
    ellipse(s.x, s.y, 8, 8);
  }
}
