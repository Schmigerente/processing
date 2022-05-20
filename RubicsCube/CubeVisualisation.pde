class CubeVisualisation {

  private Cube cube;
  private long[] cache;
  public final int scale;
  ArrayList<Face> faces;

  public CubeVisualisation (Cube cube) {
    this(cube, 1.0);
  }

  public CubeVisualisation (Cube cube, float scale) {
    this.faces = new ArrayList<Face>();
    this.cube = cube;
    this.cache = new long[6];
    this.scale = (int)(50*scale);
    cache();
    pushMatrix();
    createFaces(0);
  }

  private void createFaces(int i) {
    for (int j = 0; j < 8; j++) {
      faces.add(new Face((i<<3) + j, this));
    }
    faces.add(new Base(i, this));
    if (i < 5) {
      applyTransformations(i);
      createFaces(i+1);
    }
  }

  private void applyTransformations(int i) {
    popMatrix();
    rotateX(HALF_PI*i);
    pushMatrix();
  }

  public color getColor (int i) {
    long mask = 255;
    int fIndex = i>>3;
    int lIndex = fIndex%2 == 0 ? i%8 : (8-i)%8;
    //int lIndex = i%8;
    int col = (int)(cache[fIndex]>>((lIndex)*8) & mask);
    return color(colorLookup(col));
  }

  public color colorLookup(int i) {
    switch (i) {
    case 0:
      return color (255, 255, 255);
    case 1:
      return color (255, 80, 80);
    case 2:
      return color (0, 102, 255);
    case 3:
      return color (255, 255, 0);
    case 4:
      return color (255, 153, 53);
    case 5:
      return color (0, 153, 0);
    default:
      return color (0, 0, 0);
    }
  }

  public void render () {
    cache();
    for (Face f : faces) {
      f.render();
    }
  }

  private void cache () {
    for (int i = 0; i < 6; i++) {
      cache[i] = cube.getFace(i);
    }
  }
  
  class Base extends Face {
    
    private int face;
    private CubeVisualisation cube;
    
    public Base(int face, CubeVisualisation cube) {
      super(face<<3, cube);
      this.face = face;
      this.cube = cube;
    }
    
    @Override
    public void render () {
      pushMatrix();
      transform(face);
      translate(0, 0, 1.5*scale);
      fill(cube.colorLookup(face));
      rectMode(CENTER);
      rect(0, 0, scale, scale);
      popMatrix();
    }
    
  }

  class Face {

    private final int colorLink;
    private CubeVisualisation cube;

    public Face (int colorLink, CubeVisualisation cube) {
      this.colorLink = colorLink;
      this.cube = cube;
    }

    public void render() {
      pushMatrix();
      transform(colorLink>>3);
      translate(0, 0, 1.5*scale);
      fill (cube.getColor(colorLink));
      rectMode(CENTER);
      strokeWeight(5);
      rect(getX(colorLink)*scale, getY(colorLink)*scale, scale, scale);
      popMatrix();
    }

    public void transform(int i) {
      switch(i) {
      case 0:
        rotateZ(HALF_PI);
        break;
      case 2:
        rotateX(HALF_PI);
        break;
      case 1:
        rotateY(HALF_PI);
        rotateZ(-HALF_PI);
        break;
      case 3:
        rotateX(PI);
        rotateZ(PI);
        break;
      case 4:
        rotateY(-HALF_PI);
        rotateZ(PI);
        break;
      case 5:
        rotateX(-HALF_PI);
        rotateZ(-HALF_PI);
        break;
      }
    }

    public int getY(int i) {
      i = i%8;
      if (i == 0 || i > 5) {
        return -1;
      }
      if (i > 1 && i < 5) {
        return 1;
      }
      return 0;
    }

    public int getX(int i) {
      i = i%8;
      if (i < 3) {
        return 1;
      }
      if (i > 3 && i < 7) {
        return -1;
      }

      return 0;
    }
  }
}
