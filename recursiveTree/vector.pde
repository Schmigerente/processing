class vector {
  float[] v;
  int d;
  
  vector(float[] v) {
    this.v = v;
    this.d = v.length;
  }
  vector is() {
    return new vector(v);
  }
  vector scale(float z) {
    float[] r = new float[v.length];
    int i = 0;
    for(float f : v) {
      r[i] = f*z;
    }
    return new vector(r);
  }
  vector add(vector z) {
    float[] r = new float[v.length];
    int i = 0;
    for(float f : v) {
      r[i] = f+z.v[i];
    }
    return new vector(r);
  }
    float[] toArray() {
    return v;
  }
}

class vector2d {
  float x,y;
  vector2d(float x, float y) {
    this.x = x;
    this.y = y;
  }
  vector2d is() {
    return new vector2d(x, y);
  }
  vector2d scale(float z) {
    return new vector2d(x*z, y*z);
  }
  vector2d add(vector2d v) {
    return new vector2d(x+v.x,y+v.y);
  } 
  vector2d rotate(float r) {
    r = radians(r);
    return new vector2d(x*cos(r)-y*sin(r),x*sin(r)+y*cos(r));
  }
  float[] toArray() {
    return new float[] {x,y};
  }
}

class vector3d {
  float x1,x2,x3;
  vector3d(float x1, float x2, float x3) {
    this.x1 = x1;
    this.x2 = x2;
    this.x3 = x3;
  }
  vector3d is() {
    return new vector3d(x1,x2,x3);
  }
  vector3d scale(float s) {
    return new vector3d(x1*s,x2*s,x3*s);
  }
  vector3d add(vector3d v) {
    return new vector3d(x1+v.x1,x2+v.x2,x3+v.x3);
  } 
  vector3d crossProduct(vector3d v) {
    return new vector3d(x2*v.x3-x3*v.x2,x3*v.x1-x1*v.x3,x1*v.x2-x2*v.x1);
  }
    float[] toArray() {
    return new float[] {x1,x2,x3};
  }
}
