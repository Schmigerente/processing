class Board {

  private Field[][] field;
  final int size;
  
  private int highlight = 0;

  public Board(int size) {
    int q = (int)sqrt(size);
    field = new Field[size][size];
    this.size = size;
    generate(q, 70);
  }
  
  public void setHighlight(Tuple<Integer> t) {
    int v = field[t.x1][t.x2].display;
    highlight = (v == highlight ? 0 : v);
  }

  private void highlight(int v) {
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        if (field[j][i].display == v) {
          field[j][i].highlight();
        }
      }
    }
  }

  private void generate(int z, int d) {
    int[] arr = getShuffled(size);
    int index = 0;
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        field[j][i] = new Field((int)random(100) + 1 < d ? false : true, arr[(index+j)%size]);
      }
      index += z - (i%z == z-1 ? z-1 : 0);
    }
  }

  private int[] getShuffled(int k) {
    IntList l = new IntList(size);
    for (int i = 1; i <= k; i++) {
      l.append(i);
    }
    l.shuffle();
    return l.array();
  }

  public Field get(Tuple<Integer> t) {
    return field[t.x1][t.x2];
  }

  public boolean check() {
    for (int i = 0; i < size; i++) {
      for (int j = 0; j < size; j++) {
        if (!field[i][j].correct()) {
          return false;
        }
      }
    }
    return true;
  }

  public void render(int xo, int yo, int s) {
    highlight(highlight);
    int t = s/(size);
    int q = (int)sqrt(size);
    for (int y = 0; y < size; y++) {
      for (int x = 0; x < size; x++) {
        strokeWeight(1);
        field[x][y].render(xo+x*t, yo+y*t, t);
        strokeWeight(3);
        noFill();
        stroke(0);
        rect(xo+((q*x)%size)*t, yo+((q*y)%size)*t, t*q, t*q);
      }
    }
  }
}

class Field {
  final color select = color(0, 0, 255, 100);
  final color mark = color(255, 0, 0);
  color highlight = color(0, 255, 0, 50);
  final boolean changeable;
  private boolean marked = false;
  private boolean selected = false;
  private boolean highlighted = false;
  final int value;
  int display;

  public Field(boolean b, int i) {
    changeable = b;
    value = i;
    if (!changeable) {
      display = value;
    }
  }

  public boolean isModifiable() {
    return changeable;
  }

  public boolean correct() {
    return value == display;
  }

  public void highlight() {
    highlighted = true;
  }

  public void select() {
    selected = true;
  }

  public Field(boolean b) {
    this(b, 0);
  }

  public void render(int x, int y, int s) {

    fill(255);

    rect(x, y, s-1, s-1);
    if (display > 0) {
      textSize(s);
      fill(changeable ? 0 : 100);
      char c = (char)(display + 48);
      text("" + c, x+s/4, y+s*0.85);
    }

    if (highlighted) {
      if (display == 0) {
        return;
      }
      fill(highlight);
      highlighted = !highlighted;
      stroke(highlight);
      rect(x+2, y+2, s-5, s-5);
    }

    if (selected) {
      stroke(select);
      selected = !selected;
      noFill();
      strokeWeight(5);
      rect(x+2, y+2, s-5, s-5);
    }
  }
}
