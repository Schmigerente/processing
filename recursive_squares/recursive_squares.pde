public float T = 0.97;

void setup() {
    size(1025, 1025);
    background(0);
    rect(1, 1, 1024);
}

void draw() {
    
}
void rect(int x, int y, int s) {

    fill(255);
    rect(x, y, s-2, s-2);

    if (Math.random() < T && s > 3) {
        int s2 = s>>1;
        rect(x, y, s2);
        rect(x + s2, y, s2);
        rect(x, y + s2, s2);
        rect(x + s2, y + s2, s2);
    }
}

void keyPressed() {
    
    if (key == ' ') {
        background(0);
        rect(1, 1, 1024);
    }
    
    if (key == 'y') {
        T = max(0.0, T - 0.01);
        background(0);
        rect(1, 1, 1024);
    }
    
    if (key == 'x') {
        T = min(1.0, T + 0.01);
        background(0);
        rect(1, 1, 1024);
    }
    
    println(T);
    
}
