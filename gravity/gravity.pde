public final float G = 0.001;

GravityObject e = new GravityObject(1, 100, new PVector(100,0.1), new PVector(1,0));

void setup() {
  size(800, 800);
}

void draw() {
  frameRate(60);
  background(0);
  translate(width/2, height/2);
  scale(0.1, 0.1);
  e.accelerate(new PVector(0,0), 100);
  e.move();
}

class GravityObject {
  float mass;
  float size;
  PVector position;
  PVector velocity;
  
  public GravityObject(float m, float s, PVector p, PVector v) {
    this.mass = m;
    this.size = s;
    this.position = p;
    this.velocity = v;
    
  }
  
  void accelerate(PVector p2, float m2) {
    float accX = ((G*mass*m2)/((position.x-p2.x)*(position.x-p2.x)));
    float accY = ((G*mass*m2)/((position.y-p2.y)*(position.y-p2.y)));
    
    PVector acceleration = new PVector(accX, accY);
    println(acceleration.x + " " + acceleration.y);
    println(velocity.x + " " + velocity.y);
    velocity.add(acceleration);
    
  }
  
  void move() {
    position.add(velocity);
    circle(position.x, position.y, size);
  }
  
}
/*
class staticGravityObject extends GravityObject {
  public staticGravityObject() {
    super();
  }
}
*/
