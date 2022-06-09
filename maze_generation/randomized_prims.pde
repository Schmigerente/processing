import java.util.*;

class PrimsAlgorithm extends Algorithm {
    
    private List<Wall> walls;
    private int[][] maze;
    private boolean started;
    private Cell last;
    private int steps = 0;
     
    Algorithm setMaze(int[][] maze) {
        this.maze = maze;
        walls = new LinkedList<Wall>();
        started = false;
        
        return this;
    }
     
    void run() {
        while(!started || !walls.isEmpty()) { 
            step();
        }
        step();
    }
      
    void step() { 
        println(steps);
        
        if (!started) {
            last = getRandom();
            addWalls(last);
            started = true;
        }
        
        maze[last.y][last.x] = 1;        
        if (walls.isEmpty())
            return;       
        steps++;       
        Wall wall = selectRandom();        
        addCell(wall);   
        prune();        
    }
    
    public String ident() {
        return "Randomized Prim's Algorithm";
    }
    
    public Algorithm newInstance() {
        return new PrimsAlgorithm();
    }
    
    private void addCell(Wall w) {
        if (!checkWall(w))
            return;
            
        int cx = w.x + ((w.r)%2)*(2-w.r);
        int cy = w.y + ((w.r+1)%2)*(1-w.r);
        Cell c = new Cell(cx, cy);
        
        maze[w.y][w.x] = 1;
        maze[c.y][c.x] = 2;
        
        last = c;
        addWalls(last);
    }
    
    private void prune() {
        for(int i = 0; i < walls.size(); i++) {
            if(!checkWall(walls.get(i))) {
                walls.remove(i--);
            }
        }
    }
    
    private boolean checkWall(Wall w) {
        int cx = w.x + ((w.r)%2)*(2-w.r);
        int cy = w.y + ((w.r+1)%2)*(1-w.r);
        Cell c = new Cell(cx, cy);
        
        if (maze[c.y][c.x] != 0)
            return false;
        return true;
    }
    
    private Wall selectRandom() {
        int i = (int)(random(0,walls.size()));
        return walls.remove(i);
    }
    
    private void addWalls(Cell c) {
        
        for (int r = 0; r < 4; r++) {
            
            int wx = c.x + ((r)%2)*(2-r);
            int wy = c.y + ((r+1)%2)*(1-r);
            
            if (wy < 0 || wy >= maze.length || wx < 0 || wx >= maze[wy].length)
                continue;
             
            if (maze[wy][wx] != 0)
                continue;
            
                
            walls.add(new Wall(wx, wy, r));

        }
        
        
    }
      
    class Wall {
        
        public final int x;
        public final int y;
        public final int r;
        public Wall(int i, int j, int k) {
            this.x = i; this.y = j; this.r = k;
        }
    }
    
}
