import java.util.Random;

void setup() {
  char[] a = {'C','R','S'};
  char[] b = {'r','g','b','w','u','c','y','p'};
  println(new shape(2,false,a,b).get());
}

class shape {
  String shape;
  
  char[] shapes = {'C','R','S','W'};
  char[] colors = {'r','g','b','w','u','c','y','p'};
  
  shape(int layers, boolean includeEmpty) {
    shape = generate(layers, includeEmpty);
  }
  
  shape(int layers, boolean includeEmpty, char[] shapes, char[] colors) {
    this.shapes = shapes;
    this.colors = colors;
    shape = generate(layers, includeEmpty);
  }
  
  private String generate(int l, boolean b) {
    String s = "";
    for(int i = 0; i < 4; i++) {
      if(b == true & new Random().nextInt(shapes.length+1) == 0) {
        s += "--";
      } else {
        s += shapes[new Random().nextInt(shapes.length)];
        s += colors[new Random().nextInt(colors.length)];
      }
    }
    if(l > 1) {
      return s + ":" + generate(l-1,b);
    } else {
      return s;
    }
  }
  
  void parityCheck() {
    
  }

  String get() {
   return shape;
  }
}
