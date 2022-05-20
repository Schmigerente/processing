void setup() {
  surface.setVisible(false);
  sset st = new sset(1024*512, 1024*32);
  println("Superset evaluated with the value of " + st.compile());
  exit();
}

void draw() {
  
}

class set {
  int c;
  int s;
  
  set(int size) {
    for(int i = 0; i < size; i++) {
      if((pow(random(100), 2) + pow(random(100), 2)) <= 10000) {
        c++;
      }
      s++;
    }
  }
  
  double compile() {
    return ((double)c)/((double)s)*4;
  }
}

class sset {
  double[] set;
  int gSize;
  sset(int size, int stSize) {
    gSize = size;
    set = new double[size];
    for(int i = 0; i < size; i++) {
      set[i] = new set(stSize).compile();
      println("Superset evaluating, " + (((float)i)/((float)size)*100) + "%. set evaluated with the value of " + set[i]);
    }
  }
  
  double compile(){
    double r = 0;
    for (double d : set) {
      r += d;
    }
    r /= gSize;
    return r;
  }
}
