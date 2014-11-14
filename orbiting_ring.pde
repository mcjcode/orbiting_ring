//
// A Ring of Circling Moons
//
 
int n = 3;

Mass[] masses = new Mass[n];

float m = 5.972e+24; // mass of the earth.
float G = 6.67e-11; // gravitational constant
float r = 3.844e+09; // distance from the earth to the moon
float dt=3600.0*24*7; // each update is 7 days
float v = sqrt(G*m/(4*n*r));

void setup() {
  // the system variables width and height
  // are set by this function. 
  frameRate = 60;
  size(640,640, P2D);
  reset();
  float coef = 0.0;
  for(int k = 1; k < n; k++)
    coef += 1.0/sin(radians(k*180.0/n));
  v = v * sqrt(coef);  
}

void draw() {
  background(0);
  fill(255);
  for( int i = 0; i < n; i++ ) {
    PVector F = new PVector(0,0);
    for( int k = 0; k < n; k++ ) {
      if(k!=i) {
        PVector Fv = PVector.sub(masses[k].location,masses[i].location);
        float d = PVector.dist(masses[k].location,masses[i].location);
        PVector w = Fv.normalize(null);
        F.add(PVector.mult(w,G*pow(m/d/n,2)));
      }
    }
    masses[i].applyForce(F);
  }
  for( int i = 0; i < n; i++ ) {
    masses[i].update();
    masses[i].display();
  }    
}

void reset() {
  // Set up n masses, around a circle
  for (int i = 0; i < n; i++) {
    float theta = radians(i*360.0/n);
    masses[i] = new Mass(m/n,r*cos(theta),r*sin(theta),-v*sin(theta),v*cos(theta));
  }
}

