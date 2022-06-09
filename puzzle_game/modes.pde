class Modes {
  
  public void base(Button[] reference) {
    for (int i = 0; i < reference.length; i++) {
        reference[i] = new Button(2, true);
        if(i%4 > 0) {
            reference[i].link(reference[i-1]);
        }
        if(i/4 > 0) {
            reference[i].link(reference[i-4]);
        }
    }
  }
  
}
