import java.util.*;

public static int scale_x = 64, scale_y = 4, scale_z = 64;

boolean flag = true;

PImage tile;

float scale = 0.7;

int globalX = 0;
int globalY = 0;

int max = 20;

Tile[][] tiles;

void setup() {
    frameRate(60);
    size(800, 800);
    tile = loadImage("tiles/tile_64.png");
    tiles = new Tile[max][max];

    loadTiles();
}

void loadTiles() {
    for (int i = 0; i < max; i++) {
        for (int j = 0; j < max; j++) {
            Tile t = new Tile(tile, i, (int)random(-4, 4), j);


            tiles[i][j] = t;
        }
    }
}

void draw () {

    translate(width/2, height/2);
    scale(1, 1);
    translate(globalX, globalY);
    background(255);

    updateMouse();


    for (int i = 0; i < max; i++) {
        for (int j = 0; j < max; j++) {
            tiles[i][j].render(0);
        }
    }

    println(frameRate);
}

class Tile {

    public int x, y, z;
    private PImage image;

    public Tile(PImage i, int x, int y, int z) {
        this.image = i;
        this.x = x;
        this.y = y;
        this.z = z;
    }

    public void render() {
        render(0);
    }

    public void render(int offset_y) {
        image(image, 0.5 * (scale_x * x - scale_z * z), 0.25 * (scale_x * x + scale_z * z - 2 * scale_y * y - scale_y * offset_y));
    }
}

void keyPressed() {
    switch(key) {
    case 'v':
        if (flag) {
            flag = false;
            tile = loadImage("tiles/tile_64_v.png");
        } else {
            flag = true;
            tile = loadImage("tiles/tile_64.png");
        }
        loadTiles();
        break;
    }
}

void smooth() {
}

class Person {

    //private final PImage[] charSheet;

    public Person() {
    }

    void render() {
    }
}
