class Ball {
  PVector s; // Position
  PVector v; // Velocity
  PVector a; // Accelaration
  PVector f; // Force
  
  float m = 10.0;      // Mass
  float r = 30.0;     // Radius
  float d = 0.002;    // Density
  float vS;           // Exit velocity
  
  float Kd1 = 0.10; // Friction constant in air
  float Kd2 = 0.30; // Friction constant in water

  Ball(PVector s0) {
    s = s0.get();
    v = new PVector(0, 0);
    a = new PVector(0, 0);
  }

  void run() {
    update();
    display();
  }

  // Update values using Symplectic Euler
  void update() {
    updateForce();
    
    v = PVector.add(PVector.mult(a, SIM_STEP), v);
    s = PVector.add(PVector.mult(v, SIM_STEP), s);
    
    a.set(0.0, 0.0);
  }
  
  // Calculate all the forces
  void updateForce() { 
    PVector fG = PVector.mult(G, m); 
    applyForce(fG);
  }
  
  // Apply forces
  void applyForce(PVector force) {
    PVector f = force.get();
    f.div(m);
    a.add(f);
  }

  // Method to display
  void display() {
    noStroke();
    fill(0, 196, 255, 100);
    
    if ((s.y > height/2) || (s.y > height/2 && s.y < height/2)){
      fill(0, 196, 255, 0);
    }
    ellipse(s.x, s.y, r, r);
  }
}
