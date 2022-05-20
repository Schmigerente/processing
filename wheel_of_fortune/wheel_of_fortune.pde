

void setup() {
    size(800, 800);
    scale(1, -1);
    translate(width/2, -height/2);
    for (Vector v : getVectors(20, 330)) {
        circle(v.x, v.y, 100);
    }
}

void draw() {
}











public Vector[] getVectors(int amount, int radius) {
    Vector[] vecs = new Vector[amount];
    float frac = TWO_PI/amount;
    for (int i = 0; i < amount; i++) {
        float x = cos(frac*i)*radius;
        float y = sin(frac*i)*radius;
        vecs[i] = new Vector((long)x, (long)y);
    }
    return vecs;
}

public class Vector {
    public final long x, y;
    public Vector(long x, long y) {
        this.x = x;
        this.y = y;
    }
}
