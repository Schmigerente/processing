PImage test;
String path = "testImage.png";
int size = 256;

void setup() {
  test = loadImage(path);
  test.loadPixels();
  for (int y = 0; y < size/2; y++) {
    for (int x = 0; x < size/2; x++) {
      int temp = test.pixels[x + y * size];
      test.pixels[x + y * size] = test.pixels[y+(size-1-x)*size];
      test.pixels[y+(size-1-x)*size] = test.pixels[(size-1-x)+(size-1-y)*size];
      test.pixels[(size-1-x)+(size-1-y)*size] = test.pixels[(size-1-y)+x*size];
      test.pixels[(size-1-y)+x*size] = temp;
    }
  }
  test.save("testImage.png");
  exit();
}

void draw() {
}
