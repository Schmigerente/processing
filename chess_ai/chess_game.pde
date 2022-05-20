class Game {

  private byte[] field = new byte[64];

  private final controller playerA;
  private final controller playerB;

  public Game (controller a, controller b, String field) {
    this.playerA = a;
    this.playerB = b;
  }

  public Game (controller a, controller b) {
    this(a, b, "");
  }

  public Game () {
    this(new PlayerController(), new AIController());
  }

  public void render(int x, int y, int scale) {
    for (int i = 0; i < y; i++) {
      for (int j = 0; j < x; j++) {
        renderPiece(field[i*8+j], x+j*scale, y+i*scale, scale);
      }
    }
  }

  private void renderPiece(byte lookup, int x, int y, int scale) {
  }
}
