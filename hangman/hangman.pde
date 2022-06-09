GameState state;
int osc = 0;

//ETAOINS

public static final int MIN_LENGTH = 4;
public static final int MAX_LENGTH = 21;

public long guessed;
public long missed;
public int games;
public int worst_miss;
public int worst_guess;
public float avg_guessed;
public float avg_missed;

public String[] dictionary;
public static final String ALPHABET = "abcdefghijklmnopqrstuvwxyzäöüß ";

HangmanGuesser guesser;
String inputField;
Word word;
char last;

void setup () {
  dictionary  = loadStrings("wordlist.txt");
  frameRate(-1);
  size(450, 600);
  state = GameState.TITLE;
  inputField = "";
  set();
}

void draw () {

  //simulateGuess();
  

  oscilate();

  translate(width/2, height/2);
  background(255);

  switch (state) {
  case TITLE:
    title();
    break;
  case LOSS:
    loss();
    break;
  case WIN:
    win();
    break;
  case WORD_SELECT:
    wordSelect();
    break;
  case WORD_GUESSING:
    wordGuessing();
  default:
    break;
  }
}

void set() {
  word  = new Word(getRandomWord(dictionary));
  guesser = new HangmanGuesser(word.getLength());
  state = GameState.WORD_GUESSING;
}

void reset() {
  missed += word.misses();
  guessed += word.getGuesses();
  worst_guess = max(word.getGuesses(), worst_guess);
  worst_miss = max(word.misses(), worst_miss);
  games++;
  set();
  avg_missed = (missed+0.0)/games;
  avg_guessed = (guessed+0.0)/games;
  println(games  + "  | " + avg_guessed + "  | " + avg_missed + "  | " + worst_guess + "  | " + worst_miss);
}

void simulateGuess() {

  if (worst_miss >= 13) {
    games = 2000;
  }

  if (games >= 2000) {
    exit();
  }

  if (word.guessed()) {
    reset();
  }

  HangmanGuesser g = new HangmanGuesser(word.getLength());
  inputField = g.guess(word.export());
  if (inputField.length() == 1) {
    word.guess(inputField.charAt(0));
  } else {
    word.isWord(inputField);
    reset();
  }

  inputField = "";
}

void keyPressed() {
  switch (state) {
  case TITLE:
  case LOSS:
  case WIN:
    if (keyCode == ENTER) {
      inputField = "";
      cont();
    }
    break;
  case WORD_SELECT:
    if (keyCode == ENTER) {
      selectEnter();
      break;
    }
    if (keyCode == BACKSPACE) {
      removeLast();
      break;
    }
    if (ALPHABET.contains("" + key)) {
      textInput(key);
    }
    break;
  case WORD_GUESSING:
    if (keyCode == ENTER) {
      guess();
      break;
    }
    if (keyCode == BACKSPACE) {
      removeLast();
      break;
    }
    if (ALPHABET.contains("" + key)) {
      textInput(key);
    }
  default:
    break;
  }
}

void textInput (char c) {
  if (c == ' ' && last == ' ') {
    return;
  }
  inputField += c;
  last = c;
}

public void guess() {

  if (inputField.length() == 0) {
    inputField = guesser.guess(word.export());
    return;
  }

  if (inputField.length() == 1) {
    word.guess(inputField.charAt(0));
  }
  if (inputField.length() > 1 && word.isWord(inputField)) {
    state = GameState.WIN;
  }

  if (word.guessed()) {
    state = GameState.WIN;
  }

  if (word.misses() > 12) {
    state = GameState.LOSS;
  }
  inputField = "";
}

void removeLast() {
  if  (inputField.length() > 0) {
    inputField = inputField.substring(0, inputField.length() - 1);
  }
}

void oscilate() {
  if (osc%2 == 0) {
    osc+=2;
  } else {
    osc-=2;
  }
  if (osc > 255) {
    osc--;
  }
  if (osc < 0) {
    osc++;
  }
}

void selectEnter() {
  if (inputField.length() >= MIN_LENGTH && inputField.length() <= MAX_LENGTH) {
    if (inputField.equals("rand")) {
      word  = new Word(getRandomWord(dictionary));
    } else {
      word = new Word(inputField);
    }
    inputField = "";
    state = GameState.WORD_GUESSING;
  }
}

void cont () {
  if (state == GameState.TITLE) {
    state = GameState.WORD_SELECT;
    return;
  }

  if (state == GameState.WIN || state == GameState.LOSS) {
    state = GameState.TITLE;
    return;
  }
}

public String getRandomWord(String[] dict) {
  int i = (int)(Math.random()*dict.length);
  return dict[i];
}
