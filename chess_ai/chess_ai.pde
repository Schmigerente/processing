PShape test;

void setup() {

  test = fetchShape("qlt");
  test = loadShape("https://upload.wikimedia.org/wikipedia/commons/f/f0/Chess_kdt45.svg");

  size(900, 900);
  background(107, 53, 14);
  drawField(50, 50, 100);

  shape (test, 50, 150, 400, 400);
}

PShape fetchShape(String s) {
  for (String q : files) {
    if (q.toLowerCase().contains(s.toLowerCase())) {
      println(q.toLowerCase());
      print(q);
      return loadShape(q);
    }
  }
  return null;
}

String[] files = {"https://upload.wikimedia.org/wikipedia/commons/f/f0/Chess_kdt45.svg", "https://upload.wikimedia.org/wikipedia/commons/4/42/Chess_klt45.svg  ", "https://upload.wikimedia.org/wikipedia/commons/4/47/Chess_qdt45.svg  ", "https://upload.wikimedia.org/wikipedia/commons/1/15/Chess_qlt45.svg  ", "https://upload.wikimedia.org/wikipedia/commons/f/ff/Chess_rdt45.svg", "https://upload.wikimedia.org/wikipedia/commons/7/72/Chess_rlt45.svg", "https://upload.wikimedia.org/wikipedia/commons/9/98/Chess_bdt45.svg", "https://upload.wikimedia.org/wikipedia/commons/b/b1/Chess_blt45.svg", "https://upload.wikimedia.org/wikipedia/commons/e/ef/Chess_ndt45.svg", "https://upload.wikimedia.org/wikipedia/commons/7/70/Chess_nlt45.svg", "https://upload.wikimedia.org/wikipedia/commons/c/c7/Chess_pdt45.svg", "https://upload.wikimedia.org/wikipedia/commons/4/45/Chess_plt45.svg", "https://upload.wikimedia.org/wikipedia/commons/9/97/Chess_Gdt45.svg", "https://upload.wikimedia.org/wikipedia/commons/0/09/Chess_Glt45.svg", "https://upload.wikimedia.org/wikipedia/commons/c/c8/Chess_Udt45.svg", "https://upload.wikimedia.org/wikipedia/commons/8/89/Chess_Ult45.svg", "https://upload.wikimedia.org/wikipedia/commons/4/4a/Chess_Zdt45.svg", "https://upload.wikimedia.org/wikipedia/commons/8/84/Chess_Zlt45.svg", "https://upload.wikimedia.org/wikipedia/commons/f/fa/Chess_Mdt45.svg", "https://upload.wikimedia.org/wikipedia/commons/2/20/Chess_Mlt45.svg", "https://upload.wikimedia.org/wikipedia/commons/c/c9/Chess_Cdt45.svg", "https://upload.wikimedia.org/wikipedia/commons/e/ea/Chess_Cet45.svg", "https://upload.wikimedia.org/wikipedia/commons/4/49/CommonerB_Transparent.svg", "https://upload.wikimedia.org/wikipedia/commons/7/7d/Commoner_Transparent.svg"};
