abstract class Algorithm {

    public abstract Algorithm setMaze(int[][] maze);

    public abstract void run();

    public abstract void step();
    
    public abstract String ident();
    
    public abstract Algorithm newInstance();

    void step(int j) {
        for (int i = 0; i < j; i++) {
            step();
        }
    }

    protected Cell getRandom() {
        int y = (int)random(0, maze.length);
        y -= y%2;
        int x = (int)random(0, maze[y].length);
        x -= x%2;

        return new Cell(x, y);
    }

    class Cell implements Comparable<Cell> {
        public final int x;
        public final int y;
        public Cell(int i, int j) {
            this.x = i;
            this.y = j;
        }

        Cell mid(Cell c) {
            return new Cell((this.x + c.x)/2, (this.y + c.y)/2);
        }
        
        int compareTo(Cell c) {
            return ((this.x*this.x)+(this.y*this.y))-((c.x*c.x)+(c.y*c.y));
        }
        
    }
}
