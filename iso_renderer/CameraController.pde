int fixedX = 0, fixedY = 0;
int movedX = 0, movedY = 0;

boolean moving = false;

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  scale += e*(e*0.1*e);
  println(e);
}

void mousePressed() {
    fixedX = mouseX;
    fixedY = mouseY;
    moving = true;
}

void mouseReleased() {
    globalX -= movedX;
    globalY -= movedY;
    moving = false;
}

void updateMouse() {
    if (!moving)
        return;
    movedX = fixedX - mouseX;
    movedY = fixedY - mouseY;
    translate(-movedX, -movedY);
}
