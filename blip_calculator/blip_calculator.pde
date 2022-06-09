import java.util.*;

int[] pips = new int[3];
int selected = 0;
String result = "";

void setup() {
  size(300, 500);
  pips[0] = 4;
  pips[1] = 4;
  pips[2] = 4;
  drawFrame();
}

void keyPressed() {
  switch (key) {

  case RIGHT:
  case 'd':
    selected += 1;
    break;
  case LEFT:
  case 'a':
    selected -= 1;
    break;
  case UP:
  case 'w':
    if (selected > -1 && selected < 3)
      modifyPips(selected, 1);
    else
      calculate();
    break;
  case DOWN:
  case 's':
    if (selected > -1 && selected < 3)
      modifyPips(selected, -1);
    else
      calculate();
    break;
  case ' ':
    if (selected == 3)
      calculate();
    break;
  default:
  }
  if (selected != -2)
    selected = max(0, min(selected, 3));
}

void calculate() {
  if (checkPips() != 1)
    return;
  result = run("444", hash(pips));
  selected = -2;
}

void modifyPips(int i, int inc) {
  pips[i] += inc;
  pips[i] = max(0, min(pips[i], 8));
}

void draw() {
  drawFrame();
}

void drawFrame() {
  background(0);
  translate(width/2, height/2 + 30);
  scale(1, -1);

  //draw

  rectMode(CENTER);

  textSize(12);
  strokeWeight(2);

  fill(255);
  fText("SYSTEM", -100, 130);
  fill(getColor(pips[0], 1));
  rect(-80, -60, 32, 32);
  fill(getColor(pips[0], 3));
  rect(-80, -20, 32, 32);
  fill(getColor(pips[0], 5));
  rect(-80, 20, 32, 32);
  fill(getColor(pips[0], 7));
  rect(-80, 60, 32, 32);

  fill(255);
  fText("ENGINE", -20, 130);
  fill(getColor(pips[1], 1));
  rect(0, -60, 32, 32);
  fill(getColor(pips[1], 3));
  rect(0, -20, 32, 32);
  fill(getColor(pips[1], 5));
  rect(0, 20, 32, 32);
  fill(getColor(pips[1], 7));
  rect(0, 60, 32, 32);

  fill(255);
  fText("WEAPON", 60, 130);
  fill(getColor(pips[2], 1));
  rect(80, -60, 32, 32);
  fill(getColor(pips[2], 3));
  rect(80, -20, 32, 32);
  fill(getColor(pips[2], 5));
  rect(80, 20, 32, 32);
  fill(getColor(pips[2], 7));
  rect(80, 60, 32, 32);

  fill(255, 0);
  stroke(255);
  if (selected > -2 && selected < 3) {
    rect(-80 + 80*selected, 30, 60, 240);
  } else if (selected == 3) {
    rect(0, -160, 240, 60);
  } else {
    rect(0, 210, 240, 40);
  }


  fill(getColor(checkPips(), 0));
  rect(0, -160, 200, 40);
  fill(255);
  textSize(20);
  strokeWeight(4);
  fText("CALCULATE", -50, -170);
  
  textSize(20);
  strokeWeight(4);
  fText(result, -6*result.length() , 203);
  
}

int checkPips() {
  int sum = 0;
  for (int i = 0; i < pips.length; i++) {
    sum += pips[i];
  }
  return (sum == 12 ? 1 : 0);
}

color getColor(int a, int b) {
  if (a > b) {
    return color(252, 144, 3);
  }
  if (a < b) {
    return color(144, 144, 144);
  }
  return color(133, 75, 0);
}

void fText(String s, int x, int y) {
  scale(1, -1);
  text(s, x, -y);
  scale(1, -1);
}
