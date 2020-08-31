class Mover {
  PVector location;
  PVector speed;
  PVector acceleration;
  float mass;
  float maxspeed = 20;

  Mover(float x, float y, float m) {
    location = new PVector(x,y);
    speed = PVector.random2D().mult(3);
    acceleration = new PVector();
    mass = m;
  }

  void applyForce(PVector force) {
    PVector f = force.copy().div(mass);
    acceleration.add(f.div(mass));
  }
  
  void move(){
    speed.add(acceleration);
    location.add(speed.limit(maxspeed));
    acceleration.mult(0);
  }

  void draw() {
    fill(255);
    stroke(0);
    ellipse(location.x, height - location.y, mass / 5, mass / 5);
  }
  
  PVector attract(Mover m){
   float G = 1.0;
    PVector force = PVector.sub(location, m.location);
   float dist = constrain(force.mag(),5,25);
   force.normalize();
   float strength = (G * mass * mass) / (dist * dist);
   force.mult(strength);
   return force;
  }
}