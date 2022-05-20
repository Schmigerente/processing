import java.util.*;
import processing.sound.*;

QuestionReader reader = new QuestionReader();
List<Question> questions;
GameState state = GameState.START;
int questionCount;
long questionState;
long jokerState;


void setup() {

    //load resources
    loadResources();
    reset();
     
    //window setup
    frameRate(-1);
    //size(800, 450);  
    fullScreen();
}

void draw() {
    //canvas setup
    background(0);
    translate(width/2, height/2);
    scale(1, -1);
    
    renderMoney(width*7/16, height*6/16, height/1280.0, questionCount);
    renderQuestion(0, 0, height/1280.0, questionCount);
}

void keyPressed() {
    println(key);
}

void reset() {
    questions = reader.read(".\\data\\questions_answers.txt");
    questionCount = 4;
    questionState = 0;
    jokerState = 0;
}

void check(int key) {
    int i = indexOfKey(key, 1);
    Question q = questions.get(questionCount);
    if (q.answers[i].correct) {
        state = GameState.CORRECT;
    } else {
        state = GameState.LOST;
    }
}

void prune_answers() {
    long mask = 0;
    Question q = questions.get(questionCount);
    if (q.answers[0].correct) {
        mask = mask | 3<<2;
    } else {
        mask = mask | 3;
    }
    if (q.answers[2].correct) {
        mask = mask | 3<<6;
    } else {
        mask = mask | 3<<4;
    }
    questionState = questionState | mask;
}

int keyOfIndex(int value, int index) {
    return (value >> index*2)%4;
}

int indexOfKey(int value, int key) {
    for (int i = 0; i < 4; i++) {
        if (value%4 == key) {  
            return i;
        }
        value = value >> 2;
    }
    return -1;
}

String splitString(String s) {return splitString(s, 63);}

String splitString(String s, int i) {
    while (s.charAt(i) != ' ') {
        i--;
    }
    return s.substring(0, i).concat("\n").concat(s.substring(i+1, s.length()));
}
