int size = 2;
float bombs = 8;
int m;
int scoreBase = 1000000;
int score;
boolean firstTileClicked = false;
boolean timerActive;
int gridheight;
int gridlength;
int frametime;
int time;
float scale;
String gameState = "homescreen";
int markedBombs,totalBombs,totalMarkers;
boolean allowedToClick;
cell[][] grid;

void setup() {
    frameRate(60);
    size(1024,672);
    restart();
}

void draw() {
    m = round((size * size + size) * ((bombs / 100) * (bombs / 100) * (bombs / 100)) * 4000);
    timerAdd();
    switch(gameState) {
        case"ingame" : drawIngame();
        break;
        case"winscreen" : drawWinscreen();
        break;
        case"endscreen" : drawLosescreen();
        break;
        case"homescreen" : drawHomescreen();
        break;
    }
}

void mousePressed() {
    int x = (int)(mouseX / scale);
    int y = (int)(mouseY / scale);
    switch(gameState) {
        case"ingame":
        if (allowedToClick) {
            if (firstTileClicked == false) {
                timerStart();
                firstTileClicked = true;
            }
            if (x >= 0 & x < 16 * size & y >= 0 & y < 9 * size) {
                if (mouseButton == 37) {
                    grid[x][y].reveal();
                } else {
                    grid[x][y].mark();
                } 
                if (mouseX >= 32 * 1 + 1 && mouseX < 32 * 4 + 1 && mouseY >= 609 && mouseY < 640) {
                    restart();
                }
                if (mouseX >= 32 * 5 + 1 && mouseX < 32 * 8 + 1 && mouseY >= 609 && mouseY < 640) {
                    lose();
                }
            }
        } else {
            gameState = "endscreen";
        }
        break;
        case"homescreen":
        if (mouseX >= 300 & mouseX < 1024 - 300 & mouseY >= 300 & mouseY < 360) {
            startGame();
        }
        if (mouseX >= 200 & mouseX < 250 & mouseY >= 550 & mouseY < 600) {
            changeSize( -1);
        }
        if (mouseX >= 300 & mouseX < 350 & mouseY >= 550 & mouseY < 600) {
            changeSize(1);
        }
        if (mouseX >= 200 & mouseX < 250 & mouseY >= 600 & mouseY < 650) {
            changeDifficulty( -1);
        }
        if (mouseX >= 300 & mouseX < 350 & mouseY >= 600 & mouseY < 650) {
            changeDifficulty(1);
        }
        break;
        case"endscreen":
        if (mouseX >= 100 & mouseX < 400 & mouseY >= 500 & mouseY < 550) {
            startGame();
        }
        if (mouseX >= 624 & mouseX < 924 & mouseY >= 500 & mouseY < 550) {
            gameState = "homescreen";
        }
        break;
        case"winscreen":
        if (mouseX >= 100 & mouseX < 400 & mouseY >= 500 & mouseY < 550) {
            startGame();
        }
        if (mouseX >= 624 & mouseX < 924 & mouseY >= 500 & mouseY < 550) {
            gameState = "homescreen";
        }
        break;
        default:
        
    }
}

void drawIngame() {
    background(200);
    if (markedBombs == totalBombs & totalMarkers == totalBombs) {win();};
    for (int i = 0; i < gridlength; i++) {
        for (int j = 0; j < gridheight; j++) {
            grid[i][j].drawMe();
        }
    }
    fill(250);
    rect(1 * 32,19 * 32,32 * 3,32);
    fill(0);
    textSize(12);
    text("restart",2 * 32,20 * 32 - 10);
    fill(250);
    rect(5 * 32,19 * 32,32 * 3,32);
    fill(0);
    textSize(12);
    text("give up",6 * 32 - 1,20 * 32 - 10);
    text("Time: " + time + " seconds",10 * 32 - 1,20 * 32 - 10);
    text("Markers: " + (totalBombs - totalMarkers),15 * 32 - 1,20 * 32 - 10);
}

void drawWinscreen() {
    background(241,196,11);
    textSize(90);
    fill(0);
    text("YOU WON",300, 200);
    textSize(30);
    text("YOU SCORED: " + score + " Points",300,350);
    fill(200);
    rect(100,500,300,50);
    rect(624,500,300,50);
    textSize(40);
    fill(100);
    text("RESTART",160,540);
    text("QUIT",724,540);
}

void drawLosescreen() {
    background(244,23,16);
    textSize(90);
    fill(0);
    text("GAME OVER",270, 200);
    fill(200);
    rect(100,500,300,50);
    rect(624,500,300,50);
    textSize(40);
    fill(100);
    text("RESTART",160,540);
    text("QUIT",724,540);
}

void drawHomescreen() {
    background(200);
    fill(0);
    textSize(120);
    text("MINESWEEPER",120, 120);
    textSize(30);
    text("Tigerentenedition",730, 160);
    fill(100);
    rect(300,300,1024 - 600,60);
    textSize(50);
    fill(200);
    text("START",440,348);
    fill(100);
    stroke(0);
    rect(22,550,178,50);
    rect(22,600,178,50);
    rect(200,550,50,50);
    rect(300,550,50,50);
    rect(200,600,50,50);
    rect(300,600,50,50);
    rect(250,600,50,50);
    rect(250,550,50,50);
    fill(200);
    text(">",308,590);
    text(">",308,640);
    text("<",208,590);
    text("<",208,640);
    textSize(40);
    text(size,264,590);
    textSize(30);
    text("Size",30,586);
    text("Bombs (%)",30,636);
    textSize(20);
    text((int)(bombs),280 + ((int)(Math.log10(bombs)) + 1) *-  9,633);
    fill(0);
    text("Score Multiplier : " + m,30,540); 
}

void startGame() {
    gameState = "ingame";
    restart();
}

void win() {
    score = (int)(m * (1.0 / time) * scoreBase / 3.0);
    gameState = "winscreen";
    timerStop();
}

void lose() { 
    timerStop();
    allowedToClick = false;
    for (int i = 0; i < gridlength; i++) {
        for (int j = 0; j < gridheight; j++) {
            grid[i][j].bombReveal();
        }
    }
}

void changeSize(int i) {
    size = size + i;
    if (size < 1) {size = 1;}
    if (size > 6) {size = 6;}
}

void changeDifficulty(float f) {
    bombs = bombs + f;
    if (bombs < 5) {bombs = 05;}
    if (bombs > 20) {bombs = 20;}
    println(bombs);
}

void timerStart() {
    time = 0;
    timerActive = true;
}

void timerAdd() {
    if (timerActive == true) {
        if (frametime < 60) {
            frametime++;
        } else {
            frametime = 0;
            time++;
        }
    }
}

void timerStop() {
    frametime = 0;
    timerActive = false;
}

void restart() {
    gridheight = 9 * size;
    gridlength = 16 * size;
    grid = new cell[gridlength][gridheight];
    scale = 64.0 / size;
    markedBombs = 0;
    totalBombs = 0;
    totalMarkers = 0;
    firstTileClicked = false;
    for (int i = 0; i < gridlength; i++) {
        for (int j = 0; j < gridheight; j++) {
            String s;
            float r = random(100);
            if (r >= (100 - bombs)) {s = "bomb"; totalBombs++;} else {s = "tile";}
            grid[i][j] = new cell(i,j,scale,s);
        }
    }
    for (int i = 0; i < gridlength; i++) {
        for (int j = 0; j < gridheight; j++) {
            grid[i][j].setNeighbours(grid[i][j].getNeighbours());
        }
    }
    allowedToClick = true;
}
