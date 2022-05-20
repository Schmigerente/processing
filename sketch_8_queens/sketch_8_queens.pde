int[][] arr;
boolean[] free = {true, true, true, true, true, true, true, true};
int count = 0;
int solutions = 0;

void setup() {
  arr = new int[8][8];
  //template(); println(check());
  try {
    check(0);
  } catch (Exception e) {
    e.printStackTrace();
    exit();
  }
  
  println(solutions);
  println("done : " + count);
  exit();
}

void template() {
  arr[5][0] = 1;
  arr[3][1] = 1;
  arr[6][2] = 1;
  arr[0][3] = 1;
  arr[7][4] = 1;
  arr[1][5] = 1;
  arr[4][6] = 1;
  arr[2][7] = 1;
}

void draw() {
  
}

void check(int d) {
  
  for (int i = 0; i < 8; i++) {
    if (!free[i]) {
      continue;
    }
    arr[i][d] = 1;
    free[i] = false;
    if (d == 7) {
      count++;
      if (check()) {
        solutions++;
        printGrid();
      }
    } else {
      check(d+1);
    }
    arr[i][d] = 0;
    free[i] = true;
  }
}

boolean check() {
  for(int i = 0; i < 15; i++) {
    int sum3 = 0;
    int sum4 = 0;
    int sum1 = 0;
    int sum2 = 0;
    if (i < 8) {     
      for (int j = 0; j < 8; j++) {
        sum1 += arr[i][j];
        sum2 += arr[j][i];
      }
      if (sum1 != 1 || sum2 != 1) {
        return false;
      }
    }
    int v1 = min(i, 7);
    int v2 = i < 7 ? 0 : i - 7;
    int v3 = i < 7 ? 7 : 14 - i;
    int max = i < 7 ? i : 14 - i;
    //println(v1 + " " + v2 + " " + v3 + " " + max);
    for (int j = 0; j <= max; j++) {
      sum3 += arr[v1 - j][v2 + j];
      sum4 += arr[v1 - j][v3 - j];
    }
    if (sum3 > 1 || sum4 > 1) {
        return false;
      }  
  }
  return true;
}

void printGrid() {
  for (int y = 0; y < 8; y++) {
    String s = "";
    for (int x = 0; x < 8; x++) {
      if (arr[x][y] == 1) {
        s += "O";
      } else {
        s += "H";
      }
    }
    println(s);
  }
  println("--------");
}
