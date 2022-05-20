int depth = 11;
int branches = 4;
int minRotation = -40;
int maxRotation = 40;
boolean starter = false;
float scaling = 0.7;
vector2d dir = new vector2d(0,180);
vector2d start = new vector2d(0,-400);

void setup() {
  println("Number of branches: " + calcD(branches, depth) + " | Estimated time: " + formatDate(calcD(branches, depth)/260000));
  //fullScreen();
  size(800, 800);
  long tStart = System.currentTimeMillis();
  translate(width/2,height/2);
  scale(-1,-1);
  if(starter == true) {
    if(branches > 1) {
      for(int i = 0; i < branches; i++) {
        generateBranch(start.add(start.scale(-1)),dir.rotate((i*360)/branches),0);
      }
    } else {
      generateBranch(start,dir,0);
    }
  } else {
    generateBranch(start, dir, 0);
  }
  println("time: " + formatDate((System.currentTimeMillis()-tStart)/1000) + " | " + calcD(branches, depth)/(double)(System.currentTimeMillis()-tStart) + "b/ms");
}

long calcD(int b, int d) {
  if(d > 1) {
    return (long)pow(b, d) + calcD(b, d-1);
  } else {
    return (long)pow(b, d) + 1;
  }
}

void generateBranch(vector2d s, vector2d v, int d) {
  strokeWeight(10/(d+1));
  line(s.x,s.y,s.x+v.x,s.y+v.y);
  if(d < depth) {
    s = s.add(v);
    v = v.scale(scaling);
    for(int i = 0; i < branches; i++) {
      if(branches > 1) {
        generateBranch(s,v.rotate(minRotation+((maxRotation-minRotation)/(branches-1))*i),d+1);
      } else {
        generateBranch(s,v.rotate(minRotation),d+1);
      }
  }
    return;
  } else {
    return;
  }
}

String formatDate(long time) {
  String s = "";
  s = time%60 + "s" + s;
  time = time/60;
  if (time == 0) {
    return s;
  }
  s = time%60 + "m" + s;
  time = time/60;
  if (time == 0) {
    return s;
  }
  s = time%24 + "h" + s;
  time = time/24;
  if (time == 0) {
    return s;
  }
  s = time%60 + "d" + s;
  time = time/60;
  return s;
}
