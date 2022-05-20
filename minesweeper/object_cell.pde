class cell {
  int x,y;
  float s;
  int neighbours;
  String type;
  boolean revealed;
  boolean marked;
  
  cell(int x2,int y2, float s2, String t) {
    x = x2;
    y = y2;
    s = s2;
    type = t;
  }
  
  String getData() {
    String r = type;
    return r;
  }
  
  void bombReveal() {
    if(type.equals("bomb")) {
      revealed = true;
      marked = false;
    }
  }
  
  void reveal() {
    if (revealed == false&&type.equals("tile")&&marked==false) {
      revealed = true;    
      if (neighbours == 0&&type.equals("tile")) { 
        try{ grid[x+1][y  ].reveal(); } catch(Exception e) {};
        try{ grid[x-1][y  ].reveal(); } catch(Exception e) {};
        try{ grid[x  ][y+1].reveal(); } catch(Exception e) {};
        try{ grid[x  ][y-1].reveal(); } catch(Exception e) {};
        try{ grid[x+1][y+1].reveal(); } catch(Exception e) {};
        try{ grid[x-1][y+1].reveal(); } catch(Exception e) {};
        try{ grid[x+1][y-1].reveal(); } catch(Exception e) {};
        try{ grid[x-1][y-1].reveal(); } catch(Exception e) {};
      }
    } 
    if (revealed == false&&type.equals("bomb")) {
      lose(1);
    }
  }

  void mark() {
    if (marked == false && revealed == false) {
      marked = true;
      totalMarkers++;
      if(type.equals("bomb")) {markedBombs++;}
    } else {
      marked = false;
      totalMarkers--;
      if(type.equals("bomb")) {markedBombs--;}
    } 
  }
  
  void setNeighbours(int n) {
    neighbours = n;
  }
  
  int getNeighbours() {
    int i = 0;
      try { if(grid[x-1][y+1].getData().equals("bomb")) {i++;} } catch(Exception e) {};
      try { if(grid[x  ][y+1].getData().equals("bomb")) {i++;} } catch(Exception e) {};
      try { if(grid[x+1][y+1].getData().equals("bomb")) {i++;} } catch(Exception e) {};
      try { if(grid[x-1][y  ].getData().equals("bomb")) {i++;} } catch(Exception e) {};
      try { if(grid[x+1][y  ].getData().equals("bomb")) {i++;} } catch(Exception e) {};
      try { if(grid[x-1][y-1].getData().equals("bomb")) {i++;} } catch(Exception e) {};
      try { if(grid[x  ][y-1].getData().equals("bomb")) {i++;} } catch(Exception e) {};
      try { if(grid[x+1][y-1].getData().equals("bomb")) {i++;} } catch(Exception e) {};
      
    return i;
  }
  
  void drawMe() {
    stroke(100);
    if (revealed == true & type.equals("tile")) {
      fill(70+40*neighbours,150,80);
      if (neighbours == 0) {
        fill(150);
      }
      rect(x*s,y*s,s,s);
      fill(0);
      textSize(s/2);
      String st;
      if (neighbours == 0) {
        st = "";
      } else {
        st = "" + neighbours;
      }  
      text(st,x*s+s/2.9,y*s+s/1.6);
    } else if (marked == true){
      fill(120);
      rect(x*s,y*s,s,s);
      fill(255,0,0);
      textSize(s/2*3/2);
      text("X",x*s+s/3.6,y*s+s/1.3);
    } else if (revealed == true & type.equals("bomb")) {
      fill(255,0,0);
      rect(x*s,y*s,s,s);
      fill(0);
      textSize(s/2);
      text("X",x*s+s/3,y*s+s/1.4);
    } else {
      fill(120);
      rect(x*s,y*s,s,s);
    }  
  }  
}
