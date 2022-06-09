int state = 0;

PImage texture;
PImage result;

void setup() {
    size(600, 400);
}

void button1() {
    switch(state) {
    case 0:
        selectInput("Select an image as isometric tile texture", "fileSelected");
        return;
    case 1:
        result = process(texture);
        state++;
        return;
    case 2:
        selectOutput("Select an image as isometric tile texture", "fileSaved");
        return;
    default:
        state = 0;
        return;
    }
}

PImage process(PImage texture) {
    return process(texture, texture, texture);
}

PImage process(PImage side_left, PImage side_right, PImage top) {
    PImage input = side_left;
    PImage upscaled = input.copy();
    upscaled.resize(input.width + 1, input.height + 1);
    PImage res = createTransparentImage(input.width*2, input.height*2);

    for (int j = 0; j < input.height; j++) {
        for (int i = 0; i < input.width; i++) {

            int x = input.width + i - j;
            int y = ((i+j)>>1);
            res.set(x, y, upscaled.get(i, j));
            
            if (i == input.width || j == input.height) {
                continue;
            }
            
            x = i;
            y = j + input.width/2 + i/2 + 1;
            res.set(x, y, input.get(i, j));

            x = i + input.width;
            y = j + input.width - i/2;
            res.set(x, y, input.get(i, j));
        }
    }

    return res;
}

void fileSaved(File selection) {
    if (selection == null) {
        println("Window was closed or the user hit cancel.");
        return;
    }
    result.save(selection.getAbsolutePath());
    texture = null;
    result = null;
    state = 0;
}

void fileSelected(File selection) {
    ImageFilter filter = new ImageFilter();
    if (selection == null) {
        println("Window was closed or the user hit cancel.");
    } else if (!filter.accept(selection)) {
        println("User did not select a file of the correct type.");
    } else {
        println("User selected " + selection.getAbsolutePath());
        texture = loadImage(selection.getAbsolutePath());
        state++;
    }
}







void button2() {
    if (state != 0) {
        texture = null;
        result = null;
        state = 0;
        return;
    }
    exit();
}

void mousePressed() {
    if (mouseX > 0 && mouseX < 300 && mouseY > 300 && mouseY < 400) {
        button1();
    }
    if (mouseX > 300 && mouseX < 600 && mouseY > 300 && mouseY < 400) {
        button2();
    }
}



void draw() {
    background(0);

    fill(255);
    rect(6, 6, 288, 288, 20);
    rect(306, 6, 288, 288, 20);

    rect(6, 306, 288, 88, 20);
    rect(306, 306, 288, 88, 20);

    textSize(48);
    fill(0);
    if (state == 0) {
        text("CLOSE", 380, 368);
    } else {
        text("CANCEL", 380, 368);
    }


    if (state == 0) {
        text("OPEN", 100, 368);
    } else if (state == 1) {
        text("PROCESS", 60, 368);
        imageMode(CENTER);
        image(texture, 150, 150, min(256, texture.width), min(256, texture.height));
    } else if (state == 2) {
        text("SAVE", 100, 368);
        imageMode(CENTER);
        image(texture, 150, 150, min(256, texture.width), min(256, texture.height));
        //image(result, 450, 150, min(256, result.width), min(256, result.height));
        image(result, 450, 150, 256, 256);
    } else {
        text("ERROR", 100, 368);
    }
}

PImage createTransparentImage(int w, int h) {
    PImage res = new PImage(1, 1);
    color c = color(255, 0.0);
    res.set(0, 0, c);
    res.resize(w, h);
    return res;
}
