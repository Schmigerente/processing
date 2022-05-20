import java.util.List;
import java.util.LinkedList;

int type = 3;

Board b;
List<Field> buffer;

void setup() {
  frameRate(-1);
  size(550, 750);
  buffer = new LinkedList<Field>();
  b = new Board(type*type);
}

void draw () {
  buffer.forEach((element) -> {
    element.select();
  }
  );
  b.render(50, 50, 450);
}

void keyPressed() {
  if (key == 'c') {
    buffer = new LinkedList<Field>();
  }
  if (inRange(key, 48, 57)) {
    buffer.forEach((element) -> {
      element.display = (key-48);
    }
    );
    buffer = new LinkedList<Field>();
  }
}

void mouseClicked() {
  if (mouseX >= 50 || mouseY >= 50 || mouseX < 500 || mouseY < 500) {
    if (mouseButton == LEFT) {
      selectField();
    }
    if (mouseButton == RIGHT) {
      b.setHighlight(translateToIndex(mouseX, mouseY, b.size, 450, 50, 50));
    }
  }
}

void highlight() {
  
}

void selectField() {
  Tuple<Integer> t = translateToIndex(mouseX, mouseY, b.size, 450, 50, 50);
  Field f = b.get(t);
  if (!f.isModifiable()) {
    return;
  }
  int j;
  if ((j = indexOf(f, buffer)) >= 0) {
    buffer.remove(j);
  } else {
    buffer.add(b.get(t));
  }
}
