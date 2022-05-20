abstract class Crypt {
  public final String alphabet = " !\"#$%&\'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~"; 
  abstract String encode(String string);
  abstract String decode(String string);
  public int convert(char c) {return (int)c - 32;}
  public char convert(int i) {return (char)(i+32);}
}
