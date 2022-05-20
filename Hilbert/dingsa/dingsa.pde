int points = 500;
float mul = 2;

void setup() {
  frameRate(-1);
  //fullScreen();
  size(600,600);
}

void draw() {
  println(mul);
  background(0);
  stroke(255);
  strokeWeight(5);
  line(10,580,10+(mul%1)*580,580);
  line(10,590,10+(mul/points)*580,590);
  text(mul,550,570);
  strokeWeight(1);
  translate(width/2,height/2);
  for(int i = 0; i < points; i++) {
    //stroke(((i*1.0)/points)*255,255-((i*1.0)/points)*255,255);
    line(sin(((i*1.0)/points)*TWO_PI)*250.0,-cos(((i*1.0)/points)*TWO_PI)*250,sin(((i*1.0)/points)*TWO_PI*mul)*250,-cos(((i*1.0)/points)*TWO_PI*mul)*250);
  }
  mul = (((int)(mul*20+1))/20.0)%points;
}
