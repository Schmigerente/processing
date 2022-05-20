short[] grid;
boolean playerTurn;
int index;

void setup() {
  size(600, 800);
  resetGrid();
}

void draw() {
  background(0);
  drawGrid();
  drawChars();
  drawRestart();
  mousePreview();
  updateIndex();
  if(checkForWin('x')) {
    println("X has won");
  }
  if(checkForWin('o')) {
    println("O has won");
  }
}

void resetGrid() {
  playerTurn = true;
  grid = new short[9];
}

void updateIndex() {
  if(mouseX >= 0 & mouseX < 600 & mouseY >= 0 & mouseY < 599) {
    index = ((int)(mouseX/200)+3*(int)(mouseY/200));
  } else if (mouseX >= 0 & mouseX < 600 & mouseY >= 600 & mouseY < 799) {
    index = 9;
  }
}

void mousePressed() {
  if(index >= 0 & index <= 8) {
    setGrid(index, (short)2);
  } else if(index == 9) {
    resetGrid();
  }
}

void mousePreview() {
  if(playerTurn == true & mouseY < 600 & index < 9) {
    if(grid[index] != 'x' & grid[index] != 'o') {
      drawCross(getXfromI(), getYfromI() ,true);
    }
  }
}

void setGrid(int index, short c) {
  if (grid[index] == 0 & playerTurn) {
    grid[index] = c;
    playerTurn = false;
  }
}

void drawChars() {
  for(int i = 0; i < 9; i++) {
    switch(grid[i]) {
      case 2: drawCross(i%3,(int)(i/3),false);
      break;
      case 5: drawCircle(i%3,(int)(i/3),false);
      break;
    }
  }
}

void drawCircle(int x, int y, boolean preview) {
  if (preview == false) {
    stroke(255);
  } else {
    stroke(255, 120);
  }
  strokeWeight(10);
  noFill();
  circle(100 + (x*200), 100 + (y*200), 130);
}

void drawCross(int x, int y, boolean preview) {
  if (preview == false) {
    stroke(255);
  } else {
    stroke(255, 120);
  }
  strokeWeight(10);
  line(35 + (x*200), 35 + (y*200), 165 + (x*200), 165 + (y*200));
  line( 35 + (x*200), 165 + (y*200), 165 + (x*200), 35 + (y*200));
}

void drawGrid() {  
  stroke(255);
  strokeWeight(10);
  line(200, 25, 200, 575);
  line(400, 25, 400, 575);
  line(25, 200, 575, 200);
  line(25, 400, 575, 400);
  line(25, 600, 575, 600);
}

void drawRestart() {
  if (mouseY >= 600 & mouseY < 800) {
    stroke(255, 120);
  }
  //R
  noFill();
  line(24, 650, 24, 750);
  arc(59, 675, 50, 50, 0-PI/2, PI/2);
  line(40, 650, 44, 650);
  line(40, 700, 44, 700);
  line(40, 716, 79, 750);
  //E
  line(106, 650, 106, 750);
  line(122, 650, 166, 650);
  line(122, 700, 166, 700);
  line(122, 750, 166, 750);
  //S
  line(229, 650, 242, 650);
  arc(213, 675, 50, 50, PI/2+0.1, PI+PI/2);
  arc(223, 725, 50, 50, 0-PI/2+0.1, PI/2);
  line(194, 750, 207, 750);
  //T
  line(270, 650, 330, 650);
  line(300, 666, 300, 750);
  //A
  line(374, 650, 352, 750);
  line(390, 650, 412, 750);
  line(378, 700, 386, 700);
  //R
  line(434, 650, 434, 750);
  arc(469, 675, 50, 50, 0-PI/2, PI/2);
  line(450, 650, 455, 650);
  line(450, 700, 455, 700);
  line(450, 716, 489, 750);
  //T
  line(516, 650, 576, 650);
  line(546, 666, 546, 750);
}

int getXfromI() {
  return index%3;
}

int getYfromI() {
  return (int)(index/3);
}

boolean checkForWin(char c) {
  if(true) {
    return true;
  } else {
    return false;
  }
}
