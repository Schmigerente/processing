class Tile {
  private PImage img;
  private int x,y,r;
  
  public Tile(PImage img, int x, int y, int r) {
    this.img = img;
    this.x = x;
    this.y = y;
    this.r = r;
  }
  
  
  
  public void render() {
    pushMatrix();
    imageMode(CENTER);
    translate(x*40+20, y*40+20);
    for(int i=0;i<r;i++) {
      rotate(HALF_PI);
      //translate(0, -40);
    }
    image(img, 0, 0);
    popMatrix();
  }
  
}
