// Gridsize
final int sx = 50;
final int sy = 50;
// cycles per second
int cs = 32;

int[] mPos = new int[2];
int pState = 1;
boolean nFrame = false;
byte[][] grid = new byte[sx][sy];
byte[][] tempGrid = new byte[sx][sy];
byte[] ruleSet  = {0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

void setup() {
  glider();
  size(1000, 1000);
  //fullScreen();
  frameRate(cs);
  background(0);
}

void draw() {
  if (pState ==  0 ||  nFrame == true) {
    lifeCycle();
  } else {
    tempGrid = grid;
  }
  nFrame =false;
  render();
}

void render() {
  for (int x =0; x < sx; x++) {
    for (int y =0; y < sy; y++) {
      int col = 180 * grid[x][y];
      stroke(col);
      fill(col);
      rect(x * width / sx, y * height / sy, width / sx - 1, height / sy - 1);
    }
  }
}

void keyPressed() {

  switch(key) {
  case'r' : 
    randomInit();
    break;
  case'y' : 
    if (cs < 1024) {
      cs *=  2; 
      frameRate(cs); 
      println(cs);
    };
    break;
  case'x' : 
    if (cs > 1) {
      cs /=  2; 
      frameRate(cs); 
      println(cs);
    };
    break;
  case'f' : 
    if (pState==  1) {
      nFrame = true;
    };
    break;
  case'c' : 
    clearGrid();
    break;
  case'g' : 
    glider();
    break;
  case' ':
    pState = (pState + 1) % 2;
    break;
  }
}

void glider() {
  grid[3][3] = 1;
  grid[3][4] = 1;
  grid[3][5] = 1;
  grid[4][5] = 1;
  grid[5][4] = 1;
}

void lifeCycle() {
  int cellState;
  for (int y = 0; y < sy; y++) {
    for (int x = 0; x < sx; x++) {
      cellState = getNewState(grid, x, y);
      tempGrid[x][y] = (byte)(1 * ruleSet[cellState]);
    }
  }
  grid = tempGrid;
}

int getNewState(byte[][] g, int x, int y) {
  return(
    g[x     ][y     ]   +
    2 * g[csx(x)][csy(y + 1)] +
    4 * g[csx(x + 1)][csy(y + 1)] +
    8 * g[csx(x + 1)][csy(y)] +
    16 * g[csx(x + 1)][csy(y - 1)] +
    32 * g[csx(x)][csy(y - 1)] +
    64 * g[csx(x - 1)][csy(y - 1)] +
    128 * g[csx(x - 1)][csy(y)] +
    256 * g[csx(x - 1)][csy(y + 1)] 
    );
}

void randomInit() {
  for (int x = 0; x < sx; x++) {
    for (int y = 0; y < sy; y++) {
      tempGrid[x][y] = (byte) random(2);
    }
  }
  grid = tempGrid;
}

void clearGrid() {
  tempGrid = new byte[sx][sy];
  grid = tempGrid;
}

int csy(int i) {
  int j = i % sy;
  if (i < 0) {
    j = i + sy;
  } 
  return j;
}

int csx(int i) {
  int j = i % sx;
  if (i < 0) {
    j = i + sx;
  } 
  return j;
}

int mult(int a, int b, ) {

}