class Viewport {

  int widthV, heightV;
  double posX, posY, scale;

  public Viewport(int w, int h, double x, double y, double s) {
    this.widthV = w;
    this.heightV = h;
    this.posX = x;
    this.posY = y;
    this.scale = s;
  }

  public Viewport(int w, int h) {
    this(w, h, -0.5, 0.0, 1.0);
  }
  
  public double getX() {
    return posX;
  }
  
  public void setX(double x) {
   this.posX = x; 
  }
  
  public double getY() {
    return posY;
  }
  
  public void setY(double y) {
   this.posY = y; 
  }
  
  public double getScale() {
    return scale;
  }
  
  public void setScale(double s) {
   this.scale = s; 
  }
  
  public void render() {
    colorMode(HSB, 100);
    background(255);
    double whs = (float)widthV/(float)heightV;
    for (int y = 0; y < heightV; y++) {
      for (int x = 0; x < widthV; x++) {
        double nr = (((2.0*x - widthV)/widthV)*whs)*(1.0/scale)+posX;
        double nc = ((2.0*y - heightV)/heightV)    *(1.0/scale)+posY;
        //println(nr + " " + nc);
        int m = mandelBrot(nr, nc, MAX_IT, MAX_DIS);
        stroke(map(sqrt(m), 0, sqrt(MAX_IT*(float)scale), 0, 360), 80, map(sqrt(m), 0, sqrt(MAX_IT), 0, 255));
        if (m == MAX_IT) {
          stroke(0);
        }
        rect(x, y, 0, 0);
      }
    }
    println("Rendered frame in x ms");
  }
}
//n + 1 - Math.log(Math.log(zn.abs()))/Math.log(2)