import peasy.*;

PeasyCam cam;
int size = 50;
int i = 0;

Cube cube;
CubeVisualisation visual;
//Sequence seq = new Sequence("R U' R' F R U' R' F R U' R' F R U' R' F R U' R' F R U' R' F");
//Sequence seq = new Sequence("U' L' U' F' R2 B' R F U B2 U B' L U' F U R F'");
//Sequence seq = new Sequence("U R2 F B R B2 R U2 L B2 R U' D' R2 F R' L B2 U2 F2");
Sequence seq = new Sequence("L L R R U U D D F F B B");

void setup() {
  size(540, 540, P3D);
  cam = new PeasyCam(this, 400);
  camSetup();
  cube = new Cube();
  visual = new CubeVisualisation(cube);
}

void camSetup() {
  cam.reset(0);
  cam.rotateY(PI/6);
  cam.rotateX(PI/6);
}

void draw() {
  background(51);

  i = (i+1)%8;
  if (i == 0 && !seq.finished())
    seq.next(cube);
  visual.render();
}

void keyPressed() {
  switch (key) {
  case 'f':
    cube.rotate(0, 1);
    break;
  case 'F':
    cube.rotate(0, 3);
    break;
  case 'b':
    cube.rotate(3, 1);
    break;
  case 'B':
    cube.rotate(3, 3);
    break;
  case 'r':
    cube.rotate(1, 1);
    break;
  case 'R':
    cube.rotate(1, 3);
    break;
  case 'l':
    cube.rotate(4, 1);
    break;
  case 'L':
    cube.rotate(4, 3);
    break;
  case 'u':
    cube.rotate(2, 1);
    break;
  case 'U':
    cube.rotate(2, 3);
    break;
  case 'd':
    cube.rotate(5, 1);
    break;
  case 'D':
    cube.rotate(5, 3);
    break;
  case 'c':
    cube = new Cube();
    visual = new CubeVisualisation(cube);
    seq.reset();
    break;
  case 'p':
    camSetup();
    break;
  case 's':
    seq.reset();
    break;
  case 'ü':
      println(cube.toString());
      break;
  }
}

void printCube(Cube c) {
  for (int i = 0; i < 6; i++) {
    long t = c.getFace(i);
    String out = "";
    for (int j = 0; j < 8; j++) {
      int k = (int)((t>>j*8)&255);
      out += toChar(k);
    }
    println(out);
    //println(toBinary(t));
  }
}

String toBinary(long l) {
  return binary((int)(l>>32)) + binary((int)l);
}

char toChar(int i) {
  i = min(i, 6);
  char[] output = {'W', 'R', 'B', 'Y', 'O', 'G', ' '};
  return output[i];
}
