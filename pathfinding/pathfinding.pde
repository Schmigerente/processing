import java.util.List;
import java.util.LinkedList;

int[][] pathMap,obstacleMap;
int start,end;
List<Integer> queue;

void setup() {
  size(800, 800);
  __init();
}

void __init() {
  queue = new LinkedList<Integer>();
  pathMap = new int[20][20];
  obstacleMap = new int[20][20];
  for (int y = 0; y < 20; y++) {
    for (int x = 0; x < 20; x++) {
      if ((int)random(100) < 30) {
        obstacleMap[x][y] = 1;
      }
    }
  }
  start = getPoint();
  end = getPoint();
}

void draw() {
  for (int y = 0; y < 20; y++) {
    for (int x = 0; x < 20; x++) {
      if (obstacleMap[x][y] == 1) {
        fill(0);
      } else if (pathMap[x][y] > 0) {
        fill(pathMap[x][y]);
      } else {
        fill(255);
      }
      rect(x*40, y*40, 39, 39);      
    }
  }
  fill(0, 255, 0);
  rect(40*(start%20), 40*(start/20), 39, 39);
  fill(255, 0, 0);
  rect(40*(end%20), 40*(end/20), 39, 39);
}

int getPoint() {
  int ret = (int)random(400)+1;
  while (obstacleMap[ret%20][(int)ret/20] == 1) {
    ret = (int)random(400)+1;
  }
  return ret;
}

void keyPressed() {
  __init();
}
