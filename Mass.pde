class Mass {
  // location, velocity, acceleration
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
  
  /*
   * Call the constructor with the mass, the initial
   * x,y coordinates and the initial velocity (vx,vy)
   */
  Mass(float m, float x, float y, float vx, float vy)
  {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(vx,vy);
    acceleration = new PVector(0,0);
  }
  
  void applyForce(PVector F)
  {
    acceleration = PVector.div(F,mass);
  }
  
  //
  // update the posn, velocity of the mass
  //
  void update() {
    location.add(PVector.mult(velocity,dt));
    velocity.add(PVector.mult(acceleration, dt));
    acceleration.mult(0);
  }
  
  //
  // Draw the mass
  //
  void display() {
    fill(128);
    ellipse(location.x*100/r+320, location.y*100/r+320,7,7);
  }  
}
