byte[] keys = new byte[48];


void setup() {
  size(900, 300);
  frameRate(-1);
}

void draw() {
  rectMode(CENTER);
  for(int i = 1; i < 48; i++) {
    fill(255-255*keys[i], 255-102*keys[i], 255);
    if(i >= 1 & i <= 11) {
      rect(30+60*i,30,50,50);
    }
    if(i >= 12 & i <= 23) {
      rect(60+60*(i-11),90,50,50);
    }
    if(i >= 24 & i <= 35) {
      rect(70+60*(i-23),150,50,50);
    }
    if(i >= 36 & i <= 46) {
      rect(40+60*(i-35),210,50,50);
    }
    if(i == 47) {
      rectMode(CORNER);
      rect(180+60*(i-46),245,340,50);
    }
  }
  drawChars();
}

void keyReleased() {
  keys[character(key)] = 0;
}

void drawChars() {
  
}

byte character(char c) {
  switch(c) {
    case '1': return 1;
    case '2': return 2;
    case '3': return 3;
    case '4': return 4;
    case '5': return 5;
    case '6': return 6;
    case '7': return 7;
    case '8': return 8;
    case '9': return 9;
    case '0': return 10;
    case 'ß': return 11;   
    case 'q': return 12;
    case 'w': return 13;
    case 'e': return 14;
    case 'r': return 15;
    case 't': return 16;
    case 'z': return 17;
    case 'u': return 18;
    case 'i': return 19;
    case 'o': return 20;
    case 'p': return 21;
    case 'ü': return 22;
    case '+': return 23;
    case 'a': return 24;
    case 's': return 25;
    case 'd': return 26;
    case 'f': return 27;
    case 'g': return 28;
    case 'h': return 29;
    case 'j': return 30;
    case 'k': return 31;
    case 'l': return 32;
    case 'ö': return 33;
    case 'ä': return 34;
    case '#': return 35;
    case '<': return 36;
    case 'y': return 37;
    case 'x': return 38;
    case 'c': return 39;
    case 'v': return 40;
    case 'b': return 41;
    case 'n': return 42;
    case 'm': return 43;
    case ',': return 44;
    case '.': return 45;
    case '-': return 46; 
    case ' ': return 47;
  }
  return 0;
}

char value(byte b) {
  switch(b) {
    case 1: return '1'; 
    case 2: return '2'; 
    case 3: return '3'; 
    case 4: return '4'; 
    case 5: return '5'; 
    case 6: return '6'; 
    case 7: return '7'; 
    case 8: return '8'; 
    case 9: return '9'; 
    case 10: return '0'; 
    case 11: return 'ß'; 
    case 12: return 'q'; 
    case 13: return 'w'; 
    case 14: return 'e'; 
    case 15: return 'r'; 
    case 16: return 't'; 
    case 17: return 'z'; 
    case 18: return 'u'; 
    case 19: return 'i'; 
    case 20: return 'o'; 
    case 21: return 'p'; 
    case 22: return 'ü'; 
    case 23: return '+'; 
    case 24: return 'a'; 
    case 25: return 's'; 
    case 26: return 'd'; 
    case 27: return 'f'; 
    case 28: return 'g'; 
    case 29: return 'h'; 
    case 30: return 'j'; 
    case 31: return 'k'; 
    case 32: return 'l'; 
    case 33: return 'ö'; 
    case 34: return 'ä'; 
    case 35: return '#'; 
    case 36: return '<'; 
    case 37: return 'y'; 
    case 38: return 'x'; 
    case 39: return 'c'; 
    case 40: return 'v'; 
    case 41: return 'b'; 
    case 42: return 'n'; 
    case 43: return 'm'; 
    case 44: return ','; 
    case 45: return '.'; 
    case 46: return ';'; 
    case 47: return ' ';
  }
  return '?';
}
