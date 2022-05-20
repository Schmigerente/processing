class Cube implements CubeLike {

    //WHITE, RED, BLUE, YELLOW, ORANGE, GREEN
    long[] faces = new long[6];

    public Cube() {
        faces[0] = 0;
        faces[1] = 72340172838076673L;
        faces[2] = 2*faces[1];
        faces[3] = faces[1] + faces[2];
        faces[4] = 2*faces[2];
        faces[5] = faces[4] + faces[1];
    }

    public String toString() {
        String s = "";
        for (int i = 0; i < 6; i++) {
            s += hex((int)faces[i]) + hex((int)(faces[i]>>>32));
        }


        return s;
    }

    void rotate(int face, int move) {

        int rFlag = face%2;
        int aIndex = (face+1)%6;
        int bIndex = (face+2)%6;
        int cIndex = (face+4)%6;
        int dIndex = (face+5)%6;

        faces[face] = Long.rotateLeft(faces[face], 16+96*rFlag);

        if (rFlag == 0) {
            long temp = faces[aIndex];
            faces[aIndex] = transfer(faces[aIndex], faces[bIndex], 0, 2);
            faces[bIndex] = transfer(faces[bIndex], faces[cIndex], 2, 4);
            faces[cIndex] = transfer(faces[cIndex], faces[dIndex], 4, 6);
            faces[dIndex] = transfer(faces[dIndex], temp, 6, 0);
            faces[aIndex] = swap(faces[aIndex], 0);
            faces[cIndex] = swap(faces[cIndex], 4);
        } else {
            long temp = faces[aIndex];
            faces[aIndex] = transfer(faces[aIndex], faces[dIndex], 0, 6);
            faces[dIndex] = transfer(faces[dIndex], faces[cIndex], 6, 4);
            faces[cIndex] = transfer(faces[cIndex], faces[bIndex], 4, 2);
            faces[bIndex] = transfer(faces[bIndex], temp, 2, 0);
            faces[bIndex] = swap(faces[bIndex], 2);
            faces[dIndex] = swap(faces[dIndex], 6);
        }

        if (move > 1) {
            rotate(face, move-1);
        }
    }

    /*
   *   transfers
     */
    private long transfer(long target, long source, int tIndex, int sIndex) {
        long mask = 255<<16 ^ 255<<8 ^ 255;
        long e1 = source & Long.rotateLeft(mask, sIndex*8);
        long e2 = target & Long.rotateLeft(~mask, tIndex*8);
        return e2 ^ Long.rotateRight(e1, (sIndex-tIndex)*8);
    }

    public long swap(long l, int j) {
        long mask = 255;
        long temp1;
        long temp2;
        l = Long.rotateRight(l, 8*j);
        temp1 = l & mask;
        l = Long.rotateRight(l, 16);
        temp2 = l & mask;
        l = temp1 | (l&(~mask));
        l = Long.rotateLeft(l, 16);
        l = temp2 | (l&(~mask));
        l = Long.rotateLeft(l, j*8);
        return l;
    }

    public long getFace(int i) {
        return faces[i];
    }
}

interface CubeLike {
    void rotate(int face, int move);
}
