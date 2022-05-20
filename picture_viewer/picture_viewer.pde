import java.util.*;

String[] files = {"157796477800000000102610.png", "158135166100000000089138.png", "164242357942300000024447.png", "165086938200000000153722.png", "165086938400000000184060.png", "165086996400000000150344.png", "165087067000000000097732.png", "165087067000000000117207.png", "165087086800000000049084.png", "165087115200000000080781.png", "165087126200000000176847.png", "165087137000000000103105.png", "165087146200000000070889.png", "165087149800000000094412.png", "165087149800000000362321.png", "165218551779300000022197.png"};
List<ImageWrapper> images;
boolean update = true;
int index = 0;
int[] last = {0, 0, 0, 0};
State state = State.Image;


void setup() {
    //fullScreen();
    size(1280, 720);
    
    loadFiles(); //<>//
}

void draw() {
    
    switch (state) {
        case Overview:
            drawOverviewState();
        break;
        case Image:
            drawImageState();
        break;
        default:
    }
}

void keyPressed() {
    if (key == ' ') {
        index = (index + 1) % images.size();
        update = true;
    }
}



void drawOverviewState() {
    
}

void drawImageState() {
    if (!update)
        return;
    background(0);
    drawImage(images.get(index).getImage());
    
    update = false;
}

void drawImage(PImage i) {
    float scale = min(((float)width)/((float)i.width), ((float)height)/((float)i.height));
    
    
    imageMode(CENTER);
    image(i, width/2, height/2, i.width*scale, i.height*scale);
    
}

int indexOfLowest(int[] arr) {
    int lowest = arr[0];
    int index = 0;
    for (int i = 0; i < arr.length; i++) {
        if (arr[i] > lowest) {
            index = i;
            lowest = arr[i];
        }
    }
    return index;
}

enum State {
    Overview,
    Image
}
