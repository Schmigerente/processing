abstract class AbstractCube {
  
  public abstract void rotate(CubeColor col, Move move);
  
  public abstract CubeColor get(Face face, Position position);
  
}

public abstract class AbstractSequence {
  
  public List<Move> moves;
  
  public void apply (AbstractCube cube) {
    for (Move m : moves) {
      cube.rotate(null,m);
    }
  }
  
}

public interface Sequenceable {
  
  public void performSequence (AbstractSequence sequence);
  
}

enum Position {
  DOWN_RIGHT,
  DOWN,
  DOWN_LEFT,
  LEFT,
  UP_LEFT,
  UP,
  UP_RIGHT,
  RIGHT
}

enum Face {
  FRONT,
  RIGHT,
  UP,
  BACK,
  LEFT,
  DOWN
}

enum CubeColor {
  WHITE,
  RED,
  BLUE,
  YELLOW,
  ORANGE,
  GREEN
}

enum Move {
  CLOCKWISE,
  DOUBLE,
  REVERSE
}
