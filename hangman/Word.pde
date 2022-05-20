import java.util.Arrays;

class Word {
  
  private char[] word;
  private boolean[] shown;
  private String guessed;
  private String wrong;
  
  public Word(String w) {
    word = w.toCharArray();
    shown = new boolean[word.length];
    for (int i = 0; i < word.length; i++) {
      if (word[i] == ' ') {
        shown[i] = true;
      }
    }
    guessed = "";
    wrong = "";
  }
  
  public void render(int x, int y, boolean show) {
    
    int s = 30;
    
    if (word.length > 12) {
      s = 20;
    }
    
    int off = (word.length/2)*s;
    
    strokeWeight(3);
    for (int i = 0; i < word.length; i++) {
      int xp = x-off+i*s + (word.length%2 == 0 ? s/2 : 0);
      if ((shown[i] || show) && word[i] != ' ') {text(""+word[i],xp,y);}
      if (!show && word[i] != ' ') {line(xp-7,y+10,xp+7,y+10);}
    }
  }
  
  public void renderGuessed(int x, int y) {
    char[] c = guessed.toCharArray();
    Arrays.sort(c);
    int s = 20;
    int off = (c.length/2)*s;
    
    text("GUESSED LETTERS:",x,y);
    
    for (int i = 0; i < c.length; i++) {
      int xp = x-off+i*s + (c.length%2 == 0 ? s/2 : 0);
      text(""+c[i],xp,y+30);
    }
  }
  
  public boolean guessed() {
    for (boolean b : shown) {
      if (!b) {
        return false;
      }
    }
    return true;
  }
  
  public int guess(char c) {
    if (guessed.contains("" + c)) {
      return -1;
    }
    guessed += c;
    if (!String.valueOf(word).contains(""+c)) {
      
      wrong += c;
      return 1;
    }
    for (int i = 0; i < word.length; i++) {
      if (c == word[i]) {
        shown[i] = true;
      }
    }
    return 0;
  }
  
  public boolean isWord(String w) {
    if (String.valueOf(word).equalsIgnoreCase(w)) {
      guessed += "$";
      return true;
    }
    wrong += "$";
    return false;
  }
  
  public int misses() {
    return wrong.length();
  }
  
  public String getGuessed() {
    return guessed;
  }
  
  public int getGuesses() {
    return guessed.length();
  }
  
  public int getLength() {
    return word.length;
  }
  
  public String[] export() {
    String temp = "";
    for (int i = 0; i < word.length; i++) {
      if (shown[i] == true) {
        temp += word[i];
      } else {
        temp += "_";
      }
    }
    String[] exp = {temp, guessed};
    return exp;
  }
  
}
