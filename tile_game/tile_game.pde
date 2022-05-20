import java.util.List;

int max_size = 4;
int max_states = 2;
String[] imagePath = {"tile_darkblue.png", "tile_green.png", "tile_grey.png", "tile_lightblue.png", "tile_orange.png", "tile_pink.png", "tile_purple.png", "tile_red.png", "tile_yellow.png"};

long[][] matrix;
List<PImage> images = new ArrayList<PImage>();

void setup() {
  size(800, 800);
  matrix = new long[max_size][max_size];
}

void draw() {
  
}

void loadImages() {
  for (String path: imagePath) {
    images.add(loadImage(path));
  }
}

void render() {
  
}

void randomize() {
  
}
