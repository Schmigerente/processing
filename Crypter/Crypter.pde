import java.awt.Toolkit;
import java.awt.datatransfer.StringSelection;
import java.awt.datatransfer.Clipboard;
import java.awt.datatransfer.Transferable;
import java.awt.datatransfer.DataFlavor;
import java.awt.datatransfer.UnsupportedFlavorException;

String input,output;
int inputPosition;
public Crypt crypter = new AlphaCrypt();

void setup() {
    size(800, 500);
    input = "";
    output = "";
    PFont font = createFont("Courier New", 11);
    textFont(font);
}

void draw() {
    background(0);
    showInputField();
    showOutputField();
    showEncodeButton();
    showDecodeButton();
    showCopyButton();
    showPasteButton();
}

void keyPressed() {
    if (key == BACKSPACE & input.length() > 0) {
        input = input.substring(0,input.length() - 1);
} else if (key == DELETE & input.length() > 0) {
        input = "";
} else if (crypter.alphabet.contains(Character.toString(key)) & input.length() < 10 * 106) {
        input = input + key;
}
}

void mousePressed() {
    if (mouseX >= 25 & mouseX < 175 & mouseY >= 225 & mouseY < 275) {
        output = crypter.encode(input);
}
    if (mouseX >= 225 & mouseX < 375 & mouseY >= 225 & mouseY < 275) {
        output = crypter.decode(input);
}
    if (mouseX >= 425 & mouseX < 575 & mouseY >= 225 & mouseY < 275) {
        StringSelection selection = new StringSelection(output);
        Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
        clipboard.setContents(selection, selection);
}
    if (mouseX >= 625 & mouseX < 775 & mouseY >= 225 & mouseY < 275) {
        input = getTextFromClipboard();
        if (input.length() > 106 * 9) {
            input = input.substring(0,106 * 9 - 1);
        }
}
}

void renderText(String s, int x, int y) {
    String[] string = new String[floor((s.length()) / 106) + 1];  
    for (int i = 0; i < string.length; i++) {
        if (s.length() > 106 * (i + 1)) {
            string[i] = s.substring(i * 106,(i + 1) * 106);
        } else {
            if (s.length() > i * 106) {string[i] = s.substring(i * 106);}
        }
}
    int offset = 0;
    for (String st : string) {
        try {text(st, x, y + offset);} catch(Exception e) {}
        offset += 14;
}
}


void showInputField() {
    fill(255);
    rect(25,25,750,175,10);
    fill(0);
    renderText(input, 50, 50);
}

void showOutputField() {
    fill(200);
    rect(25,300,750,175,10);
    fill(0);
    renderText(output, 50, 325);
}

void showEncodeButton() {
    fill(200);
    rect(25,225,150,50,10);
    fill(0);
    text("ENCODE", 75, 255);
}

void showDecodeButton() {
    fill(200);
    rect(225,225,150,50,10);
    fill(0);
    text("DECODE", 275, 255);
}

void showCopyButton() {
    fill(200);
    rect(425,225,150,50,10);
    fill(0);
    text("COPY", 485, 255);
}

void showPasteButton() {
    fill(200);
    rect(625,225,150,50,10);
    fill(0);
    text("PASTE", 680, 255);
}

String getTextFromClipboard() {
    return(String) getFromClipboard(DataFlavor.stringFlavor);
}

Object getFromClipboard(DataFlavor flavor) {
    Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard(); 
    Transferable contents = clipboard.getContents(null);
    Object object = null;
    if(contents != null && contents.isDataFlavorSupported(flavor))
        {
        try
    {
            object= contents.getTransferData(flavor);
        }
        catch(UnsupportedFlavorException e1) {}
        catch(java.io.IOException e2) {}
}
    return object;
} 
