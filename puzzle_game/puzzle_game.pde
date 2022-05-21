import java.util.*;

String[] files = {"tile_white.png", "tile_dark_blue.png", "tile_cyan.png", "tile_green.png", "tile_light_blue.png", "tile_light_red.png", "tile_lime.png", "tile_mint.png", "tile_orange.png", "tile_pink.png", "tile_purple.png", "tile_red.png", "tile_yellow.png", "tile_black.png", "tile_dark_grey.png", "tile_light_grey.png"};
PImage[] images;
Button[] grid;

void setup() {
    size(600, 600);
    background(0);
    
    loadResources();
    
    grid = new Button[16];
    for (int i = 0; i < grid.length; i++) {
        grid[i] = new Button(4);
        if(i%4 > 0) {
            grid[i].link(grid[i-1]);
        }
        if(i/4 > 0) {
            grid[i].link(grid[i-4]);
        }
    }
    
}

void draw() {
    for (int i = 0; i < grid.length; i++) {
        int x = i%4;
        int y = i/4;
        grid[i].render(x,y,1);
    }
}

void loadResources() {
    images = new PImage[files.length];
    for (int i = 0; i < files.length; i++) {
        images[i] = loadImage("resources/" + files[i]);
    }
}

void mousePressed() {
    int index = (mouseX -12)/144 + ((mouseY-12)/144)*4;
    grid[index].click();
}

class Button {
    
    int maxStates;
    private List<Button> linked;
    private int state;
    
    public Button(int m) {
        linked = new LinkedList<Button>();
        linked.add(this);
        this.maxStates = m;
    }
    
    public void render(int x, int y, float s) {
        image(images[state], x*144+24+0*s, y*144+24);
        
    }
    
    public void click() {
        linked.forEach((Button b) -> {
            b.change();
        });
    }
    
    public void change() {
        state = (state + 1)%maxStates;
    }
    
    public void link(Button b) {
        if (isLinked(b)) {
            return;
        }
        linked.add(b);
        b.link(this);
        
    }
    
    private boolean isLinked(Button b) {
        for(Button but : linked) {
            if (but == b) {
                return true;
            }
        }
        return false;
    }
    
}
