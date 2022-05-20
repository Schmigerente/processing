int grids = 5;
int sizeX = 40;
int sizeY = 25;

boolean translating = false;
int globalX = 0;
int globalY = 0;
int tempX = 0;
int tempY = 0;

void mousePressed() {
    translating = true;
    tempX = mouseX;
    tempY = mouseY;
}

void mouseReleased() {
    translating = false;
    globalX += mouseX - tempX;
    globalY += mouseY - tempY;
    
}


void setup() {
    size(800, 800);
}

void draw() {
    background(255);
    translate(globalX, globalY);
    translate(width/2, height/2);
    if (translating)
        translate(mouseX - tempX, mouseY - tempY);
    for (int i = grids-1; i >= 0; i--) {
        int centering = (i+grids)*sizeX;
        for (int j = 0; j < i+grids; j++) {
            int x = -centering +sizeX + j*sizeX*2;
            int y = (int)((grids-1-i)*sizeY*1.75);
            
            drawHex(x, y, sizeX, sizeY);
            if (y > 0) {
                drawHex(x, -y, sizeX, sizeY);
            }
            //drawHex(size*2 + j*size*2, size*2 + i*size*2, 18);
        }
    }
}

void drawHex(int x, int y, int s1, int s2) {
    beginShape();
    for (int r = 1; r < 12; r+=2) {
        vertex(x+s1*cos((TWO_PI*r)/12.), y+s2*sin((TWO_PI*r)/12.));
    }
    endShape(CLOSE);
}
