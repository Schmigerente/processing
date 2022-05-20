import java.util.List;
import java.util.LinkedList;
import java.util.Map;

Graph g;

void setup() {
  size(800, 800);
  List<Integer> l = new LinkedList<Integer>();
  l.add(0);
  l.add(1);
  l.add(3);
  l.add(4);
  l.add(2);
  l.add(3);
  l.add(0);
  l.add(2);
  l.add(1);
  g = new Graph(l);
  frameRate(1);
}

int index = 0;

void draw() {
  background(255);
  strokeWeight(4);
  scale(1, -1);
  translate(0, -800);
  
  g.display(200, 100, 200, index++);
}

class Graph {

  List<Integer> sequence;
  int last;
  int grad[] = {3, 3, 4, 4, 2};

  
  public Graph(List<Integer> l/*, int[] t*/) {
    //sequence = s;
    //last = s.get(s.size()-1);
  }


  Graph copy () {
    List<Integer> copiedList = new LinkedList<Integer>();
    for (int i = 0; i < sequence.size(); i++) {
      copiedList.add(sequence.get(i));
    }
    return new Graph(copiedList);
  }

  void display(int x, int y, float scale) {
    display(x, y, scale, 100000);
  }

  void display(int x, int y, float scale, int state) {
    int s = sequence.get(0);
    int t;
    stroke(0);
    for (int i = 1; i < min(sequence.size(), state); i++) {
      t = sequence.get(i);
      if (min(sequence.size(), state) == i+1) {
        stroke(255,0,0);
      }
      line(x + getC(s, false)*scale, y + getC(s, true)*scale, x + getC(t, false)*scale, y + getC(t, true)*scale);
      s = t;
    }
  }

  int getC(int a, boolean vert) {   
    return (vert ? (a < 4 ? (a/2)*2 : 3) : (a < 4 ? (a%2)*2 : 1));

  }
  
}
