float r1 = 201;
float r2 = 200;
float m1 = 80;
float m2 = 80;
float a1 = PI;
float a2 = -PI/2;
float g = 1;
float d = 0.995;


float a1_v = 0;
float a2_v = 0;
float a1_a = 0;
float a2_a = -0;
PGraphics canvas;

void setup() {
  size(900, 600);
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}

void draw() {

  a1_a = (-g*(2*m1 + m2)*sin(a1)
    -m2*g*sin(a1-2*a2)
    -2*sin(a1-a2)*m2
    *(a2_v*a2_v*r2+a1_v*a1_v*r1*cos(a1-a2))) / 
    (r1*(2*m1 + m2 - m2*cos(2*a1 - 2*a2)));

  a2_a = (2*sin(a1-a2)
    *(a1_v*a1_v*r1*(m1+m2) 
    + g*(m1+m2)*cos(a1)
    +a2_v*a2_v*r2*m2*cos(a1-a2))) /
    (r2*(2*m1 + m2 - m2*cos(2*a1 - 2*a2)));

  a1_v += a1_a;
  a2_v += a2_a;
  a1_v *= d;
  a2_v *= d;
  a1   += a1_v;
  a2   += a2_v;
  
  image(canvas, 0, 0);
  stroke(0);
  strokeWeight(2);
  translate(width/2, r1);
  fill(0);

  float x1 = r1*sin(a1);
  float y1 = r1*cos(a1);
  float x2 = r2*sin(a2) + x1;
  float y2 = r2*cos(a2) + y1;

  line(0, 0, x1, y1);
  ellipse(x1, y1, m1/TWO_PI, m1/TWO_PI);
  line(x1, y1, x2, y2);
  ellipse(x2, y2, m2/TWO_PI, m2/TWO_PI);

  canvas.beginDraw();
  canvas.translate(width/2, r1);
  canvas.strokeWeight(4);
  canvas.stroke(0);
  canvas.point(x2, y2);
  canvas.endDraw();
}
