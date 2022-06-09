PImage scale(PImage input) {
    PImage c = input.copy();
    c.resize(input.width, input.height);
    return c;
}
