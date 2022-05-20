import java.util.List;
import java.util.LinkedList;
import java.util.regex.*;
import java.util.Scanner; 
import java.util.Arrays;

float bias = 1;

public class HangmanGuesser {
  
  List<String> list;
  
  public HangmanGuesser(int l) {
    list = new LinkedList<String>(Arrays.asList(dictionary));
    list = filter(list, l);
  }
  
  public String guess (String[] args) {
    if (args.length == 1) {
      
      list = filter(list, Integer.parseInt(args[0]));
      char[] cs = getUnique(list, "");
      char c = getGuess(list, cs);
      return ""+c;
    }
    if (args.length != 2) {
      return "";
    }
    String in = args[0];
    String guessed = args[1];
    list = filter(list, compile(in));
    
    if (list.size() < 2) {
      return list.get(0);
    }
    
    char[] cs = getUnique(list, guessed);
    char c = getGuess(list, cs);
    return ""+c;
    
  }
  
  private Pattern compile(String s) {
    s = s.replaceAll("_","[a-z,ä,ö,ü,ß]");
    return Pattern.compile(s);
  }
  
  private char getGuess(List<String> list, char[] chars) {
    int[] score = new int[chars.length];
    int median = list.size()/2;
    for (int i = 0; i < chars.length; i++) {
      int x = 0;
      for (String s : list) {
        if (s.contains(""+chars[i])) {
          x++;
        }
      }
      score[i] = (int)((list.size()-x)*bias + ((x-median)*(x-median))*(1-bias));
    }
    int index = 0;
    for (int i = 0; i < score.length; i++) {
      index = (score[i] < score[index] ? i : index);
    }
    return chars[index];
  }

  private char[] getUnique(List<String> list, String guessed) {
    String s = "";
    for (String w : list) {
      for (char c : w.toCharArray()) {
        if (!s.contains(""+c) && !guessed.contains(""+c)) {
          s+=c;
        }
      }
    }
    return s.toCharArray();
  }
  
  private List<String> filter(List<String> list, Pattern pattern) {
  List<String> returnList = new LinkedList<String>();
    for (String s : list) {
      if (s.matches(pattern.toString())) {
        returnList.add(s);
      }
    }
    return returnList;
  }

  private List<String> filter(List<String> list, int l) {
    List<String> returnList = new LinkedList<String>();
    for (String s : list) {
      if (s.length() == l) {
        returnList.add(s);
      }
    }
    return returnList;
  }

}
