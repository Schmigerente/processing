import java.util.List;
import java.util.LinkedList;
import java.util.Iterator;

class Sequence implements CubeLike {

  List<Move> moves;
  private Iterator<Move> it;

  public Sequence(String s) {
    this();
    //"([F,R,U,B,L,D][2,']? )*([F,R,U,B,L,D][2,']?)"
    for (String t : s.split(" ")) {
      add(t);
    }
    reset();
  }
  public Sequence() {
    moves = new LinkedList<Move>();
    reset();
  }
  
  public void add(String s) {
    moves.add(new Move(s));
  }
  
  public void add(Sequence s) {
    s.apply(this);
  }
  
  public void reset() {
    it = moves.iterator();
  }
  
  public boolean finished() {
    return !it.hasNext();
  }
  
  public void next(CubeLike cube) {
    if (!it.hasNext()) {
      return;
    }
    it.next().apply(cube);
  }
  
  public void apply(CubeLike cube) {
    for (Move m : moves) {
      m.apply(cube);
    }
  }
  
  public void rotate(int face, int move) {
    moves.add(new Move(face, move));
  }
  
  class Move {
    private int face;
    private int move;

    public Move(String s) {
      parse(s);
    }
    
    public Move(int face, int move) {
      this.face = face;
      this.move = 4-move;
    }

    public void apply(CubeLike cube) {
      cube.rotate(face, move);
    }

    public Move reverse() {
      return new Move(face, move);
    }
    
    private void parse(String s) {
      switch (s.charAt(0)) {
        case 'F':
        face = 0;
        break;
        case 'R':
        face = 1;
        break;
        case 'U':
        face = 2;
        break;
        case 'B':
        face = 3;
        break;
        case 'L':
        face = 4;
        break;
        case 'D':
        face = 5;
        break;
      }
      if (s.length() == 2) {
        if (s.charAt(1) == '\'') {
          move = 3;
        } else {
          move = 2;
        }
      } else {
        move = 1;
      }
    }
  }
}
