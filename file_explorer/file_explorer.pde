import java.util.*;
//import java.nio.files.*;

public final int NODE_HEIGHT = 24;

public final Node root = new Node("D:/Dokuments");

void setup() {
    size(1280, 720);
    root.expand();
}

void draw() {
    background(0);
    root.render(1, 0);
}

void mousePressed() {
    
}

void keyPressed() {
    
}

class Node {
    String path;
    boolean expanded = false;
    List<Node> childs;
    
    public Node(String path) {
        this.path = path;
    }
    
    public int render(int y, int i) {     
        renderElements(y, i);
        y += NODE_HEIGHT;
        if (expanded) {
           for(Node n : childs) {
                y = n.render(y, i + 1);
                if (y > height) break;
            }
        }
        return y;
    }
    
    public void expand() {
        File f = new File(path);
        if (!f.isDirectory()) {
            return;
        }
        if (childs == null) {
             childs = new LinkedList<Node>();
             loadChilds(f);
        }
        expanded = true;
    }
    
    public void contract() {
        expanded = false;
    }
    
    private void renderElements(int y, int i) {
        File f = new File(path);
        noStroke();
        fill(255);
        if (f.isDirectory()) {
            fill(200);
        }
        rect(i*20 + 2, y+2, width - 5 - i*20, NODE_HEIGHT - 5, 5);
        
        String name = f.getName();
        stroke(0);
        fill(0);
        text(name, i*20+5, y+16);
    }
    
    private void loadChilds(File dir) {
        File[] c = dir.listFiles();
        for (File f : c) {
            Node n = new Node(f.getAbsolutePath());
            childs.add(n);
        }
    }
    
}
