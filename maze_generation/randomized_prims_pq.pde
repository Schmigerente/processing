import java.util.*;

class PrimsAlgorithmPQ extends Algorithm {
    
    private PriorityQueue<Wall> walls;
    private int[][] maze;
    private boolean started;
    private Cell last;
    private int steps = 0;
     
    Algorithm setMaze(int[][] maze) {
        this.maze = maze;
        walls = new PriorityQueue<Wall>(wallComparator);
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
        Wall wall = walls.poll();        
        addCell(wall);   
        //prune();        
    }
    
    public String ident() {
        return "Randomized Prim's Algorithm with PQ instead of List";
    }
    
    public Algorithm newInstance() {
        return new PrimsAlgorithmPQ();
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
    
    Comparator<Wall> wallComparator = (w1, w2) -> {
        return (((w2.x*w2.x)+(last.x*last.x))-((w2.y*w2.y)+(last.y*last.y))) - (((w1.x*w1.x)+(last.x*last.x))-((w1.y*w1.y)+(last.y*last.y)));
    };
    
    /*
    private void prune() {
        for(int i = 0; i < walls.size(); i++) {
            if(!checkWall(walls.get(i))) {
                walls.remove(i--);
            }
        }
    }
    */
    
    private boolean checkWall(Wall w) {
        int cx = w.x + ((w.r)%2)*(2-w.r);
        int cy = w.y + ((w.r+1)%2)*(1-w.r);
        Cell c = new Cell(cx, cy);
        
        if (maze[c.y][c.x] != 0)
            return false;
        return true;
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
      
    class Wall implements Comparable<Wall> {
        
        public final int x;
        public final int y;
        public final int r;
        public Wall(int i, int j, int k) {
            this.x = i; this.y = j; this.r = k;
        }
        int compareTo(Wall c) {
            return (((this.x*this.x)+(this.y*this.y))-((c.x*c.x)+(c.y*c.y))) * (int)random(-2, 4);
        }
    }
    
}
