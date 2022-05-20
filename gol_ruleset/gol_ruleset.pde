
boolean[] neigh = new boolean[8];

void setup() {
    String out = "{";
    for (int i = 0; i < 512; i++) {
        out += (getRule(i)) ? "1" : "0" ;
        if (i < 511)
            out += ",";
    }
    out += "}";
    println(out);
    exit();
}

boolean getRule(int i) {
    boolean living = i % 2 == 1 ? true : false; 
    int bits = getBits(i);
    if (living && bits >= 2 && bits <= 3) {
        return true;
    }
    if (!living && bits == 3)
        return true;

    return false;
}

int getBits(int i) {
    return ((i & 2)>>1) + ((i & 4)>>2) + ((i & 8)>>3) + ((i & 16)>>4) + ((i & 32)>>5) + ((i & 64)>>6) + ((i & 128)>>7) + ((i & 256)>>8);
}