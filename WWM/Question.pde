class Question {
  String text;
  Answer[] answers = new Answer[4];

  Question(String text, String[] ans) {
    this.text = text;
    addAnswers(ans);
  }

  void addAnswers(String[] ans) {
    for (int i = 0; i<4; i++) {
      if (i == 0) {
        answers[i] = new Answer(ans[i], true);
      } else {
        answers[i] = new Answer(ans[i], false);
      }
    }
    shuffle();
  }

  void shuffle() {
    List<Answer> temp = Arrays.asList(answers);
    Collections.shuffle(temp);
    answers = temp.toArray(answers);
  }
}

class Answer {
  String text;
  boolean correct;
  Answer(String text, boolean correct) {
    this.text = text;
    this.correct = correct;
  }
}
