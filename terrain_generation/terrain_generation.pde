int scaleX = 16;
int scaleY = 16;
int extremeness = 3;
int x = 64;

int[] nodes = new int[x];
int previousLevel;
int previousSteep;

PImage grass;

void setup() {
  size(1024,576);
  grass = loadImage("grass.png");
  paint();
}


void draw() {
  background(101, 193, 214);
  for(int i = 0; i < x-1; i++) {
    line(i*scaleX+8,(nodes[i]*scaleY)+8,(i+1)*scaleX+8,(nodes[i+1]*scaleY)+8);
  }
  for(int i = 0; i < 64; i++) {
    image(grass,i*16,nodes[i]*16);
  }
}

void paint() {
  previousLevel = (int)random(36);
  previousSteep = 0;
  for(int i = 0; i < x; i++) {
    
    int r = (int)random(38);
    
    if(r > previousLevel+fac(previousSteep)+10 && previousSteep < extremeness) {
      previousSteep++;
    }    
    if(r <= previousLevel-fac(previousSteep)-10 && previousSteep > -extremeness) {
      previousSteep--;
    }
    
    previousLevel+=previousSteep;
    nodes[i]=previousLevel;
  }  
}

void keyPressed() {
  if(key == 'r') {
    paint();
  }
}

int fac(int i) {
  int r = 1;
  while(i > 1) {
    r=r*i;
    i--;
  }
  return r;
}
