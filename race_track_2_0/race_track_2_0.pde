

void setup() {
  
}

void draw() {
  
}

class Track {

    private Node start = null;
    private Node back = null;
    
    public void add(double x, double y, float r) {
        if (start == null) {
            start = new Node (0, 0, 0);
            back = start;
            return;
        }
        back.next = new Node(x, y, r);
        back = back.next;
    }
    
    public void render() {

    }

}

class Node {

    final double x, y;
    final float rotation;
    float width;
    Node next;

    public Node(double x, double y, float r) {
        this.x = x;
        this.y = y;
        this.rotation = r;
        width = 1;
    }

}
