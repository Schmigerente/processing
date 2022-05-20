int grid[][] = new int[35][35];
boolean grid2[][] = new boolean[35][33];

void setup() {
  String[] split = loadStrings("input.txt");
  int i2 = 0;
  for (String s : split) {   
    char[] split2 = s.toCharArray();
    for (int j = 0; j < 35; j++) {
      grid[i2][j] = Integer.parseInt("" + split2[j]);
    }
    i2++;
  }
  
  size(264, 264);
  for(int i = 1; i < 34; i++) {
    for(int j = 1; j < 34; j++) {
      if(grid[i][j] == 0) {
        stroke(0,255,0,128);
        fill(0,255,0,128);
        rect((j-1)*8,(i-1)*8,7,7);
      }
    }
  }
  
  for(int i = 1; i < 34; i++) {
    for(int j = 1; j < 34; j++) {
      if(grid[i+1][j-1]*grid[i+1][j]*grid[i+1][j+1]*grid[i][j+1]*grid[i][j-1]*grid[i-1][j-1]*grid[i-1][j]*grid[i-1][j+1] > 0) {
        for(int k = i-1; k <= i+1; k++) {
          for(int l = j-1; l <= j+1; l++) {
            if(k!=i || l!=j) {
              grid[k][l]--; 
            }
          }
        }
        grid2[i-1][j-1] = true;
        stroke(255,0,0,128);
        fill(255,0,0,128);
        rect((j-1)*8,(i-1)*8,7,7);
      }
    }
  }
}
