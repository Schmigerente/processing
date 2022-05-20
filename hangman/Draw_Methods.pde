void win() {
  
  fill(255, 255, 204);
  stroke(255, 255, 204);
  rect(-215, -290, 430, 580, 7);
  
  textSize(20);
  fill(0+osc/2);
  text("PRESS ENTER TO CONTINUE", 0, 200);
  
  textSize(120);
  fill(255, 204, 0);
  text("WON",0,-100);
  
  textSize(40);
  fill(0);
  word.render(0, 50, true);
  
}

void loss() {
  
  fill(255, 255, 204);
  stroke(255, 255, 204);
  rect(-215, -290, 430, 580, 7);
  
  textSize(20);
  fill(0+osc/2);
  text("PRESS ENTER TO CONTINUE", 0, 200);
  
  textSize(120);
  fill(204, 51, 0);
  text("LOSS",0,-100);
  
  textSize(40);
  fill(0);
  drawHangman(0,-200,12);
  word.render(0, 50, true);
  
}

public void wordGuessing() {
  
  fill(255, 255, 204);
  
  if (word.misses() == 12) {
    fill(255, 204, 204);
  }
  
  stroke(255, 255, 204);
  rect(-215, -290, 430, 580, 7);
  
  stroke(0);
  fill(255);
  rect(-200, 70, 400, 30, 7);
  
  textSize(20);
  fill(0);
  text(inputField, 0, 94);
  
  if (word.misses() == 12) {
    textSize(60);
    text("LAST CHANCE", 0, 250);
  }
  
  if (inputField.length() == 0) {
    textSize(16);
    fill(0);
    text("ENTER A LETTER OR A WORD AS YOUR GUESS", 0, 50);
  }
  
  if (inputField.length() == 1 && word.getGuessed().contains(inputField)) {
    textSize(16);
    fill(0);
    text("YOU ALREADY GUESSED THAT LETTER", 0, 50);
  }
  
  if (inputField.length() > word.getLength()) {
    textSize(20);
    fill(0+osc/2);
    text("YOUR GUESS CANT BE LONGER THAN THE WORD", 0, 50);
  }
  
  drawHangman(40,-150,word.misses());
  
  textSize(24);
  word.render(0, 0, false);
  word.renderGuessed(0,150);
  
}

public void title () {
  textAlign(CENTER);
  
  fill(255, 255, 204);
  stroke(255, 255, 204);
  rect(-215, -290, 430, 580, 7);
  
  fill(255, 255, 204);
  stroke(255, 255, 204);
  rect(-215, -290, 430, 580, 7);
  
  textSize(80);
  fill(64);
  text("Hangman", 0, -100);
  
  textSize(20);
  fill(0+osc/2);
  text("PRESS ENTER TO START A GAME", 0, 50);
}

public void wordSelect() {
  textAlign(CENTER);
  
  fill(255, 255, 204);
  stroke(255, 255, 204);
  rect(-215, -290, 430, 580, 7);
  
  stroke(0);
  fill(255);
  rect(-200, -15, 400, 30, 7);
  
  textSize(40);
  fill(0);
  text("ENTER A WORD", 0, -100);
  
  textSize(20);
  fill(0);
  if (inputField.length() < MIN_LENGTH || inputField.length() > MAX_LENGTH) {
    fill(osc/2);
  }
  text(inputField, 0, 6);
  
  if (inputField.length() < MIN_LENGTH) {
    textSize(16);
    fill(0);
    text(String.format("YOUR WORD MUST BE AT LEAST %d CHARACTERS",MIN_LENGTH), 0, 50);
  }
  
  if (inputField.length() > MAX_LENGTH) {
    textSize(16);
    fill(0);
    text(String.format("YOUR WORD CANT BE LONGER THAN %d CHARACTERS", MAX_LENGTH), 0, 50);
  }
  
  if (inputField.length() >= MIN_LENGTH && inputField.length() <= MAX_LENGTH) {
    textSize(20);
    fill(0+osc/2);
    text("PRESS ENTER TO CONTINUE", 0, 50);
  } 
}

void drawHangman(int x, int y, int p) {
  strokeWeight(6);
  stroke(0);
  noFill();
  if (p > 0) {
    line (x-100,y+50,x-40,y+50);
  }
  if (p > 1) {
    arc(x-70,y+50,60,60,PI,TWO_PI);
  }
  if (p > 2) {
    line (x-70,y+20,x-70,y-80);
  }
  if (p > 3) {
    line (x-10,y-80,x-90,y-80);
  }
  if (p > 4) {
    line (x-70,y-60,x-50,y-80);
  }
  strokeWeight(4);
  if (p > 5) {
    line (x-10,y-60,x-10,y-80);
  }
  if (p > 6) {
    circle (x-10,y-50,20);
  }
  if (p > 7) {
    line (x-10,y-40,x-10,y-15);
  }
  if (p > 8) {
    line (x-10,y-40,x-20,y-15);
  }
  
  if (p > 9) {
    line (x-10,y-40,x,y-15);
  }
  
  if (p > 10) {
    line (x-10,y-15,x-20,y+10);
  }
  
  if (p > 11) {
    line (x-10,y-15,x,y+10);
  }
}
