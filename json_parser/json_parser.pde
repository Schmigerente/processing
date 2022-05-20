import java.util.List;
import java.util.LinkedList;
import java.io.Reader;
import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Arrays;

public void setup() {
    Parser p = new Parser();
    try {
        List<Question> q = p.parse("D:\\processing_workspace\\json_parser\\text.txt");
        for (Question i : q) {
            println(i.QUESTION);
            for (Answer a : i.ANSWERS) {
                print(a.text + " ");
        }
            println();
        }
}
    catch(Exception e) {
        e.printStackTrace();
}
}

class Question {
    public final String QUESTION;
    //Dangerous
    public Answer[] ANSWERS = new Answer[4];
    
    public Question(String q, String[] a) {
        this.QUESTION = q;
        parseAnswers(a, ANSWERS);
}
    
    private void parseAnswers(String[] a, Answer[] b) {
        
        for (int i = 0; i < 4; i++) {
            b[i] =new Answer();
            b[i].text = a[i];
            b[i].correct = (i == 0 ? true : false);
        }
}
}

class Answer {
    public String text;
    public boolean correct;
}

class Parser {
    
    public Parser() {
}
    
    public List<Question> parse(String path) throws Exception {
        List<Question> list = new LinkedList<Question>();
        
        BufferedReader r = new BufferedReader(new FileReader(path));
        
        
        String s = r.readLine();
        while(s != null) {
            String[] t = s.split(";");
            
            Question q = new Question(t[0], Arrays.copyOfRange(t, 1, t.length));
            list.add(q);
            s = r.readLine();
        }
        r.close();
        return list;
}
}
