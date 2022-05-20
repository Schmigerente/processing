//Offset to the first snippet in pixels
int x_off = 14;
int y_off = 5764;
//Size of the snippets in pixels
int x_size = 198;
int y_size = 589;
//Distance between snippets
int x_dist = 15;
float y_dist = 40;
//Amount of Snippets
int x_am = 5;
int y_am = 1;
//start index
int start_index = 50;

String in = "sw_planets/input.png";
String out = "sw_planets/result/";

void setup() {
  PImage image = loadImage(in);
  
  for (int y = 0; y < y_am; y++) {
    for (int x = 0; x < x_am; x++) {
      int a = (int)(x_off + x*(x_size+x_dist));
      int b = (int)( y_off + y*(y_size+y_dist));
      int c = x_size-1;
      int d = y_size-1;
      PImage sub = image.get(a, b, c, d);
      sub.save(String.format("%s%04d_.png", out, (start_index + y*x_am+x+1)));
      
    }
  }
  
  
  println("finished");
  exit();
}
