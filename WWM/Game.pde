
void renderMoney(int x, int y, float scale, int key) {
    key = min(14,max(key,0));
    int offset = (int)((key - 7) * 15 * scale);
    imageRender(money_marker, x, y + offset, scale * 0.9);
    imageRender(money_text, x, y, scale);
}

void renderJoker(int x, int y, float scale, int key) {
    
}


/**
* 0 = neutral
* 1 = selected
* 2 = correct
* 3 = pruned
*/
void renderQuestion(int x, int y, float scale, int key) {
    Question q = questions.get(questionCount);
    imageRender(question, x, y, scale);
    textRender(q.text.length() > 64 ? splitString(q.text) : q.text, x, y, scale);
}

void renderAnswer(int x, int y, float scale, int key) {
    
}
