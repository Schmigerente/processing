int size = 32;

Algorithm[] algos = {new RecDepth(), new PrimsAlgorithm(), new PrimsAlgorithmPQ()};
int algoIndex = 0;


int[][] maze;

boolean autoStepping = false;
boolean boostStepping = false;

Algorithm alg;

void draw() {
    if (autoStepping)
        alg.step(boostStepping ? 32 : 1);
    background(0);
    int xSize = width/((maze[0].length+1)*2);
    int ySize = height/((maze.length+1)*2);
    for (int y = 0; y < maze.length; y++) {
        for (int x = 0; x < maze[y].length; x++) {
            switch(maze[y][x]) {
            case 0:
                fill(0);
                stroke(0);
                break;
            case 1:
                if (y%2 != x%2) {
                    fill(255);
                    stroke(255);
                } else {
                    fill(255);
                    stroke(255);
                }
                break;
            default:
                fill(255, 0, 0);
                stroke(255, 0, 0);
            }
            rect((2*x+1)*xSize, (2*y+1)*ySize, 2*xSize-1, 2*ySize-1);
        }
    }

    fill(255);
    stroke(255);
    rect(xSize, 0, 2*xSize-1, ySize-1);
    rect(width - 3*xSize, height-ySize, 2*xSize-1, ySize-1);
}

void setup() {
    frameRate(-1);
    size(1024, 1024);
    //size(256, 256);
    reset();
    println("KEYBINDS");
    println("c <-> clear the maze");
    println("r <-> clear the maze and run the algorithm");
    println("s <-> step the algorithm by one");
    println("a <-> enables/disables autostepping every frame");
    println("b <-> enables/disables boost for autostepping");
    println("y <-> halfes the maze size down to 4");
    println("x <-> doubles the maze size up to 256");
    println("q <-> change algorithm");
}

void keyPressed() {
    if (key == 'c') {
        reset();
    }
    if (key == 'r') {
        reset();
        alg.run();
    }
    if (key == 's') {
        alg.step();
    }
    if (key == 'p') {
        saveFrame("maze.png");
    }
    if (key == 't') {
        saveStrings("maze.txt", mazeToString().split("1"));
    }
    if (key == 'a') {
        autoStepping = autoStepping ? false : true ;
    }
    if (key == 'b') {
        boostStepping = boostStepping ? false : true ;
    }
    if (key == 'y') {
        if (size > 4) {
            size = size>>1;
            reset();
        }
    }
    if (key == 'x') {
        if (size < 256) {
            size = size<<1;
            reset();
        }
    }
    if (key == 'q') {
        algoIndex = (algoIndex+1)%(algos.length);
        println(algos[algoIndex].ident());
        reset();
    }
}

void reset() {
    maze = new int[size-1][size-1];
    algos[algoIndex] = algos[algoIndex].newInstance();
    alg = algos[algoIndex];
    //alg = new PrimsAlgorithmPQ();
    //alg = new PrimsAlgorithm();
    alg.setMaze(maze);
}

String mazeToString() {
    String s = "";
    for (int y = 0; y < maze.length; y++) {
        for (int x = 0; x < maze[y].length; x++) {
            if (maze[y][x] == 0) {
                s += "██";
            } else {
                s += "  ";
            }
            /*
            if (maze[y][x] == 0) {
             s += "O";
             } else {
             s += "X";
             }
             */
        }
        s += "\n";
    }
    return s;
}
