// Hilbert Curve
// Coding in the Cabana
// The Coding Train / Daniel Shiffman
// https://thecodingtrain.com/CodingInTheCabana/003-hilbert-curve.html
// https://youtu.be/

// Processing Sketch: https://github.com/CodingTrain/website/tree/master/CodingInTheCabana/Cabana_003_Hilbert_Curve/Processing
// p5js Sketch: https://editor.p5js.org/codingtrain/sketches/LPf9PLmp

int order = 3;
int N = int(pow(2, order));
int total = N * N;
int drawMin,drawMax = 0;
int stepSize = 1;

PVector[] path = new PVector[total];

void setup() {
  frameRate(-1);
  size(512, 512);
  colorMode(HSB, 360, 255, 255);
  background(0);
  float len = width / N;

  for (int i = 0; i < total; i++) {
    path[i] = hilbert(i);
    path[i].mult(len);
    path[i].add(len/2, len/2);
  }
  println("done");
  background(0);
  drawMax = stepSize;
  drawMin = 0;
}

void draw() {
  stroke(255);
  strokeWeight(1);
  noFill();
  //beginShape();
  for (int i = drawMin; i <= drawMax; i++) {
    stroke(map(i, 0, path.length, 0, 360), 255, 255);
    try {line(path[i].x, path[i].y, path[i+1].x, path[i+1].y);} catch(Exception e) {}
  }
  //endShape();

  drawMin+=stepSize;
  drawMax+=stepSize;
  if (drawMax >= path.length) {
    delay(3000);
    drawMax = stepSize;
    drawMin = 0;
    background(0);
  }
  if (order == 9) {
    order = 1;
  } else {
     order++; 
  }

  //strokeWeight(4);
  //for (int i = 0; i < path.length; i++) {
  //  point(path[i].x, path[i].y);
  //  text(i, path[i].x+5, path[i].y);
  //}
}


PVector hilbert(int i) {
  PVector[] points = {
    new PVector(0, 0), 
    new PVector(0, 1), 
    new PVector(1, 1), 
    new PVector(1, 0)
  };

  int index = i & 3;
  PVector v = points[index];

  for (int j = 1; j < order; j++) {
    i = i >>> 2;
    index = i & 3;
    float len = pow(2, j);
    if (index == 0) {
      float temp = v.x;
      v.x = v.y;
      v.y = temp;
    } else if (index == 1) {
      v.y += len;
    } else if (index == 2) {
      v.x += len;
      v.y += len;
    } else if (index == 3) {
      float temp = len - 1 - v.x;
      v.x = len - 1 - v.y;
      v.y = temp;
      v.x += len;
    }
  }
  return v;
}
