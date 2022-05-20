public static final int MAX_IT = 2000;
public static final double MAX_DIS = 4.0;

Viewport v;

void setup() {
  size(680, 360);
  //fullScreen();
  v = new Viewport(width, height, -0.5, 0.0, 0.8);
  v.render();
}

void draw() {
  
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  v.setScale(v.getScale()*map(e, -1, 1, 1.4, 0.6));
  v.render();
}

void mouseClicked() {
  double whs = (float)width/(float)height;
  double scale = v.getScale();
  double nr = ((2.0*mouseX - width)/width)*whs;
  double nc = (2.0*mouseY - height)/height    ;
  v.setX(nr*(1.0/v.getScale()) + v.getX());
  v.setY(nc*(1.0/v.getScale()) + v.getY());
  v.render();
}

int mandelBrot(double nr, double nc, int mi, double md) {
  int it = 0;
  double zr = 0.0 , zc = 0.0, t;
  while (it < mi && zr*zr + zc*zc <= md*md) {
    t = zr*zr - zc*zc + nr;
    zc = 2*zr*zc      + nc;
    zr = t;
    it++;
  }
  return it;
}
