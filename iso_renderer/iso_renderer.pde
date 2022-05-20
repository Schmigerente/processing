PImage ground;
PImage road;

float scale = 0.7;

int off_y = 33;
int off_x = 66;

int globalX = 0;
int globalY = 0;


void setup() {
    size(800, 800);
    ground = loadImage("tiles/ground_asphalt.png");
    road = loadImage("tiles/road_straight_left.png");
}

void draw () {
    
    translate(width/2, height/2);
    translate(globalX, globalY);
    updateMouse();
    
    background(255);
    
    for (int x = 0; x < 20; x++) {
        for (int y = 0; y < 20; y++) {
            int pos_y = (int)((x+y)*off_y*scale);
            int pos_x = (int)((x-y)*off_x*scale);
            renderImage(x == 11 ? road : ground, pos_x, pos_y, scale);
        }
    }
}

void renderImage(PImage img, int x, int y, float scale) {
    imageMode(CENTER);
    image(img, x, y, img.width*scale, img.height*scale);
}
