int barIndex;
int rectIndexX;
int rectIndexY;

void setup(){
  size(1536, 832);
  drawColorBar();
}

void draw() {
  if(mousePressed == true && mouseButton == 37) {
    clicked();
  }
}

void clicked() {
  if(mouseX >= 0 && mouseX < width && mouseY >= 768 && mouseY < width) {
    barIndex = mouseX;
  }
  if(mouseX >= 0 && mouseX < 768 && mouseY >= 0 && mouseY < 768) {
    rectIndexX = 255-mouseX/3;
    rectIndexY = 255-mouseY/3;
    drawColorSquare();
  }
  drawColorBar();
}

void drawColorBar() {
  int r,g,b;
  for (int i = 0; i < 1536; i++) {
    r = (i%256)*(i >= 1024 && i < 1280 ? 1 : 0) + (255)*(i < 256 || i >= 1280 ? 1 : 0) + (255-i%256)*(i >= 256 && i < 512 ? 1 : 0);
    g = (i%256)*(i >= 0 && i < 256 ? 1 : 0)     + (255)*(i >= 256 &&  i < 768 ? 1 : 0) + (255-i%256)*(i >= 762 && i < 1024 ? 1 : 0);
    b = (i%256)*(i >= 512 && i < 768 ? 1 : 0)   + (255)*(i >= 768 && i < 1280 ? 1 : 0) + (255-i%256)*(i >= 1280 && i < 1536 ? 1 : 0);
    stroke(r, g, b);
    fill(r, g, b);
    rect(i, 768, 0, 64);
  }
  stroke(0);
  fill(255, 0);
  rect(barIndex-2, 768, 4, 64);
  int i = barIndex;
  r = (i%256)*(i >= 1024 && i < 1280 ? 1 : 0) + (255)*(i < 256 || i >= 1280 ? 1 : 0) + (255-i%256)*(i >= 256 && i < 512 ? 1 : 0);
  g = (i%256)*(i >= 0 && i < 256 ? 1 : 0)     + (255)*(i >= 256 &&  i < 768 ? 1 : 0) + (255-i%256)*(i >= 762 && i < 1024 ? 1 : 0);
  b = (i%256)*(i >= 512 && i < 768 ? 1 : 0)   + (255)*(i >= 768 && i < 1280 ? 1 : 0) + (255-i%256)*(i >= 1280 && i < 1536 ? 1 : 0);
  drawColorMatrix(r, g, b);
}

void drawColorMatrix(int r, int g, int b) {
  for(int i = 0; i < 256; i++) {
    for(int j = 0; j < 256; j++) {
      int dotR = (int)((r + (255-r)*(j/255.0))*(i/255.0));
      int dotG = (int)((g + (255-g)*(j/255.0))*(i/255.0));
      int dotB = (int)((b + (255-b)*(j/255.0))*(i/255.0));
      stroke(dotR, dotG, dotB);
      fill(dotR, dotG, dotB);
      rect(765-j*3, 765-i*3, 2, 2);
    }
  }
  drawColorSquare();
}

void drawColorSquare() {
  stroke(0);
  fill(255, 0);
  rect(764-rectIndexX*3, 764-rectIndexY*3, 4, 4);
}
