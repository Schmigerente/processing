void drawField(int x, int y, int scale) {
  for (int i = 0; i < 64; i++) {
    if (i%2 == (i>>>3)%2) {
      fill(247, 188, 146);
      stroke(247, 188, 146);
    } else {
      fill(89, 37, 0);
      stroke(89, 37, 0);
    }
    rect(x+(i%8)*scale, y+(i>>3)*scale, scale, scale);
  }
}

void highlight(int x, int y, int scale) {
}
