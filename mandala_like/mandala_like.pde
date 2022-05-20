int scale = 1000;

void setup() {
  size(1000, 1000);
  frameRate(10);
  translate(width/2,height/2);
  background(255);
  pushMatrix();
  colorMode(HSB);
  
  
}
float i = 255;
int j = 0;

void draw() {
  uni(5);
}

void uni(int n) {
  popMatrix();
  fill(j,i,255-i);
  i *= 0.98;
  j = (j+4)%256;
  noStroke();
  poly(n,scale);
  rotate(0.05);
  scale(0.95,0.95);
  pushMatrix();
}

void poly(int n, int s) {  
  beginShape();
  for (int i = 0; i < n; i++) {
      vertex(sin((TWO_PI*i)/n)*s,cos((TWO_PI*i)/n)*s);
  }
  endShape(CLOSE);
}
