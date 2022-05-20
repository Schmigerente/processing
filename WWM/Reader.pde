import java.io.*;
import java.util.*;
import java.lang.*;

class QuestionReader {

    public QuestionReader() {
    }

    List<Question> read(String fileName) {
        List<Question> questions = new LinkedList<Question>();
        String[] lines = loadStrings(fileName);
        for (String line : lines) {
            String[] ans = line.split(";");
            questions.add(new Question(ans[0], Arrays.copyOfRange(ans, 1, ans.length)));
        }
        return questions;
    }
}
