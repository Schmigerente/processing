String path = "images/";
String[] image_names = {"straight.png", "corner.png", "crossing.png", "straight_chicane.png", "straight_finish.png", "grid.png", "straight_box_right.png", "straight_box_left.png", "straight_box_right_finish.png", "straight_box_left_finish.png", "straight_finish_right.png", "straight_finish_left.png", "grid_box_right.png", "grid_box_left.png", "corner_box_right.png", "corner_box_left.png"};
PImage imgs[];
int x=4, y=4, r=0;
ArrayList<Tile> track;

int v = 0;
int rot = 0;
Tile temp = null;

void keyPressed() {
    switch(key) {
    case 'r':
        if ((v == 1 || v == 14 || v == 15)) {
            rot = (rot+1)%2;
        }
        break;
    case 's':
        app(v, rot);
        break;
    case 'e':
        v = (v+1)%imgs.length;
        if (!(v == 1 || v == 14 || v == 15)) {
            rot = 0;
        }
        break;
    case 'q':
        v = (v+imgs.length-1)%imgs.length;
        if (!(v == 1 || v == 14 || v == 15)) {
            rot = 0;
        }
        break;
    case 'c':
        track = new ArrayList<Tile>();
        break;
    }
    temp = new Tile(imgs[v], x, y, (r+rot*3)%4);
}

void setup() {
    size(400, 400);
    imgs = loadImgs(image_names);
    track = new ArrayList<Tile>();
    app(0);
    app(1);
    app(2);
    app(3);
    app(1);
    app(0);
    app(1);
    app(1, 1);
}

void draw() {
    background(0);
    for (Tile t : track) {
        t.render();
    }
    if (temp != null) {
        temp.render();
    }
}

PImage[] loadImgs(String[] arr) {
    PImage[] imageArray = new PImage[arr.length];
    for (int i = 0; i < arr.length; i++) {
        try {
            imageArray[i] = loadImage(path + arr[i]);
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    }
    return imageArray;
}

void app(int i) {
    app(i, 0);
}

void app(int i, int s) {
    track.add(new Tile(imgs[i], x, y, (r+s*3)%4));
    println("Tile :" + r + " " + i);
    if (i == 1 || i == 14 || i == 15) {
        r = ((r+3-2*s)+4)%4;
    }
    if (r%2 == 0) {
        y = y + r - 1;
    } else {
        x = x - r + 2;
    }
}

private void render (int a, int b, int c, int d) {
    new Tile(imgs[a], b, c, d).render();
}
