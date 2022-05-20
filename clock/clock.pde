import java.time.*; 

void setup() {
    size(400, 400);
}

void draw() {
    LocalDateTime date = java.time.LocalDateTime.now();
    int hours = date.getHour();
    int minutes = date.getMinute();
    int seconds = date.getSecond();

    background(255);
    translate(width/2, height/2);
    rotate(-HALF_PI);
    strokeWeight(12);
    noFill();
    stroke(255,0,0);
    arc(0, 0, 300, 300, 0, TWO_PI*(seconds/60.0));
    stroke(0,255,0);
    arc(0, 0, 250, 250, 0, TWO_PI*(minutes/60.0));
    stroke(0,0,255);
    arc(0, 0, 200, 200, 0, TWO_PI*(min(hours/12.0,12.00)));
    if (hours > 12.00) {
      stroke(255);
      strokeWeight(4);
       arc(0, 0, 200, 200, 0, TWO_PI*((hours%12)/12.0));
    }
}
