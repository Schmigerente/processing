class RecDepth extends Algorithm {

    private int[][] maze;
    private int steps = 0;
    private Cell start;
    private Cell active;
    private boolean finished = false;

    private List<Cell> stack;

    Algorithm setMaze(int[][] maze) {
        this.maze = maze;
        stack = new LinkedList<Cell>();
        return this;
    }

    void run() {
        while (!finished)
            step();
    }

    void step() {

        if (finished)
            return;

        if (start != null && start.equals(active)) {
            finished = true;
            maze[active.y][active.x] = 1;
            return;
        }

        if (start == null) {
            start = getRandom();
            active = start;
            maze[active.y][active.x] = 2;
        }

        List<Cell> neighbours = getFreeNeighbours(active);

        if (neighbours.size() == 0) {
            Cell temp = active;
            active = stack.remove(stack.size()-1);
            maze[temp.y][temp.x] = 1;
            temp = temp.mid(active);
            maze[temp.y][temp.x] = 1;
            return;
        }

        Cell next = getRandom(neighbours);
        Cell mid = next.mid(active);

        stack.add(active);
        active = next;

        maze[next.y][next.x] = 2;
        maze[mid.y][mid.x] = 2;
    }
    
    public String ident() {
        return "Recursive Depth First Algorithm";
    }
    
    public Algorithm newInstance() {
        return new RecDepth();
    }

    private Cell getRandom(List<Cell> l) {
        int index = (int)random(0, l.size());
        return l.get(index);
    }

    private List<Cell> getFreeNeighbours(Cell c) {
        List<Cell> l = new LinkedList<Cell>();
        for (int r = 0; r < 4; r++) {
            int nx = c.x + ((r)%2)*(2-r)*2;
            int ny = c.y + ((r+1)%2)*(1-r)*2;

            if (ny < 0 || ny >= maze.length || nx < 0 || nx >= maze[ny].length)
                continue;

            if (maze[ny][nx] != 0)
                continue;

            l.add(new Cell(nx, ny));
        }
        return l;
    }
}
