void imageRender(PImage image, int x, int y, float scale) {
    imageMode(CENTER);
    scale(1,-1);
    image(image, x, -y, image.width*scale, image.height*scale);
    scale(1,-1);  
}

void textRender(String text, int x, int y, float scale) {
    textSize(20*scale);
    textAlign(CENTER, CENTER);
    scale(1,-1);
    text(text, x, y-(int)(4*scale));
    scale(1,-1);
}

enum GameState {
    START,
    ANSWER,
    SELECT,
    CORRECT,
    JOKER,
    WON,
    LOST
}
