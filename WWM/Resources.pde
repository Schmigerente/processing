PImage money_marker;
PImage money_text;
PImage answer_neutral;
PImage answer_selected;
PImage answer_correct;
PImage logo;
PImage question;
PImage joker_half;
PImage joker_audience;
PImage joker_phone;
PImage joker_single;
PImage photo_frank;
PImage photo_micha;
PImage photo_hanno;
PImage joker_crossed;
PImage start;

SoundFile theme;
SoundFile idle1;
SoundFile idle2;
SoundFile letsPlay;
SoundFile lockedIn;
SoundFile win;
SoundFile youWin;
SoundFile joker;

void loadResources() {
    logo= loadImage("img\\logo.jpg");
    question = loadImage("img\\quest.png");
    answer_neutral = loadImage("img\\ans_blue.png");
    answer_selected = loadImage("img\\ans_yellow.png");
    answer_correct = loadImage("img\\ans_green.png");
    money_marker = loadImage("img\\step_activ.png");
    money_text = loadImage("img\\box2.png");
    joker_half = loadImage("img\\5050.png");
    joker_audience = loadImage("img\\publikum.png");
    joker_phone = loadImage("img\\telefon.png");
    joker_single = loadImage("img\\einzel.png");
    joker_crossed = loadImage("img\\joker_x.png");
    photo_frank = loadImage("img\\Frank.png");
    photo_micha = loadImage("img\\Micha.png");
    photo_hanno = loadImage("img\\Hanno.png");
    start = loadImage("img\\start.png");
    
    theme = new SoundFile(this, "sound\\mainTheme.mp3");
    idle1 = new SoundFile(this, "sound\\idle1.mp3");
    idle2 = new SoundFile(this, "sound\\idle2.mp3");
    letsPlay = new SoundFile(this, "sound\\letsPlay.mp3");
    lockedIn = new SoundFile(this, "sound\\lockedIn.mp3");
    win = new SoundFile(this, "sound\\win.mp3");
    youWin = new SoundFile(this, "sound\\youWin.mp3");
    joker = new SoundFile(this, "sound\\joker.mp3");
}
