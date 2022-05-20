import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class snake extends PApplet {

int[] head = {15, 15};
int gridX,gridY = 30;
int[][] grid = new int[30][30];
int snakeLength;
int growthRate = 1;
boolean ingame = false;
enum Direction {UP, DOWN, RIGHT, LEFT};
Direction dir;
ArrayList<Direction> inputBuffer = new ArrayList<Direction>();

public void setup() {
  frameRate(15);
  
  reset();
}

public void draw() {
  if(inputBuffer.size() > 0) {
    dir = inputBuffer.get(0);
    inputBuffer.remove(0);
  }
  if(ingame) {
    nextStep();
    drawGrid();
  }
  if(!ingame) {
    fill(255);
    text("PRESS ANY ARROW KEY TO START",200,400);
  }
}

public void drawGrid() {
  for (int i = 0; i < grid.length; i++) {
      for(int j = 0; j < grid[0].length; j++) {
        if(grid[i][j] > 0) {
          grid[i][j]--;
          fill(255);
        } else if (grid[i][j] < 0) {
          fill(255,0,0);
        } else {
          fill(0);
        }
        rect(i*20,j*20,19,19);
      }
   }
}

public void reset() {
  inputBuffer = new ArrayList<Direction>();
  grid = new int[30][30];
  head[0] = 15;
  head[1] = 15;
  snakeLength = 5;
  grid[head[0]][head[1]] = snakeLength;
  generatePoint();
  drawGrid();
}

public void nextStep() {
  switch(dir) {
    case UP:
      head[1] = (head[1]+29)%30;
      break;
    case DOWN:
      head[1] = (head[1]+1)%30;
      break;
    case RIGHT:
      head[0] = (head[0]+1)%30;
      break;
    case LEFT:
      head[0] = (head[0]+29)%30;
      break;
  }
  
  if(grid[head[0]][head[1]] <= 0) {
    if(grid[head[0]][head[1]] < 0) {
      sizeUp();
    }
    grid[head[0]][head[1]] = snakeLength;
    
  } else {
    ingame = !ingame;
    reset();
  }
}

public void sizeUp() {
  snakeLength += growthRate;
  for (int i = 0; i < grid.length; i++) {
      for(int j = 0; j < grid[0].length; j++) {
        if(grid[i][j] > 0) {
          grid[i][j] += growthRate;
        }
      }
   }
   generatePoint();
}

public void generatePoint() {
  int x = floor(random(30));
  int y = floor(random(30));
  if(grid[x][y] == 0) {
    grid[x][y] = -1;
  } else
    generatePoint();
}

public void keyPressed() {
  if(!ingame)
    ingame = !ingame;
    switch(key) {
      case 'w':
        if(dir != Direction.DOWN)
          inputBuffer.add(Direction.UP);
        break;
      case 'a':
        if(dir != Direction.RIGHT)
          inputBuffer.add(Direction.LEFT);
        break;
      case 's':
        if(dir != Direction.UP)
          inputBuffer.add(Direction.DOWN);
        break;
      case 'd':
        if(dir != Direction.LEFT)
          inputBuffer.add(Direction.RIGHT);
        break;
    }
}
  public void settings() {  size(600,600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "snake" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
