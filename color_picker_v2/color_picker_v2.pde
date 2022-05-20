color col = color(255, 255, 255);

int r = 255;
int g = 0;
int b = 0;
int d = 180;
int w = 40;

void draw() {
  if(mousePressed == true && mouseButton == 37)
    clicked();
}

void setup() {
  size(1536, 832);
  background(255);
  drawColorBar();
  drawColorMatrix();
  drawColor();
}

void clicked() {
  if(mouseX >= 0 && mouseX < width && mouseY >= 768 && mouseY < width) {
    getColorBar(mouseX);
    drawColorMatrix();
    drawColor();
  }
  if(mouseX >= 0 && mouseX < 768 && mouseY >= 0 && mouseY < 768) {
    w = 255-mouseX/3;
    d = 255-mouseY/3;
    drawColor();
  }
}

void getColorBar(int i) {
  switch(floor(i/255)) {
    case 0:
      r = 255;
      g = i % 255;
      b = 0;
      break;
    case 1:
      r = 255 - i % 255;
      g = 255;
      b = 0;
      break;
    case 2:
      r = 0;
      g = 255;
      b = i % 255;
      break;
    case 3:
      r = 0;
      g = 255 - i % 255;
      b = 255;
      break;
    case 4:
      r = i % 255;
      g = 0;
      b = 255;
      break;
    case 5:
      r = 255;
      g = 0;
      b = 255 - i % 255;
      break;
    }
}

void getColor() {
  col = color(
    (int)((r + (255-r)*(w/255.0))*(d/255.0)),
    (int)((g + (255-g)*(w/255.0))*(d/255.0)),
    (int)((b + (255-b)*(w/255.0))*(d/255.0))
  );
}

void drawColorMatrix() {
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
}

void drawColor() {
  getColor();
  stroke(col);
  fill(col);
  rect(768, 0, 767, 767);
}

void drawColorBar() {
  int dCB_r = 255;
  int dCB_g = 0;
  int dCB_b = 0;
  for (int i = 0; i < 1536; i++) {
    switch(floor(i/255)) {
      case 0:
        dCB_g = i % 255;
        break;
      case 1:
        dCB_r = 255 - i % 255;
        break;
      case 2:
        dCB_b = i % 255;
        break;
      case 3:
        dCB_g = 255 - i % 255;
        break;
      case 4:
        dCB_r = i % 255;
        break;
      case 5:
        dCB_b = 255 - i % 255;
        break;
      
    }
    stroke(dCB_r, dCB_g, dCB_b);
    fill(dCB_r, dCB_g, dCB_b);
    rect(i, 768, 0, 64);
  }
}
