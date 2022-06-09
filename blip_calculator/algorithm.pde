
Map<String, String[]> graph;
Map<String, String> parent;

String run(String source, String target) {
  
  //load graph from file
  if (graph == null) {
    loadGraph();
  }
  
  //initialize search
  List<String> queue = new LinkedList<String>();
  queue.add(source);
  parent.put(source, source);

  //dijkstra
  while (!queue.isEmpty()) {
    String n = queue.remove(0);
    for (String o : graph.get(n)) {
      if (parent.get(o) != null)
        continue;
      queue.add(o);
      parent.put(o, n);
    }
  }


  String s = "";

  //backtrace tree for edge values
  String c = target;
  String p = parent.get(c);
  do {
    //s =  p + " " + s;
    s = getMove(p, c) + s;
    c = p;
    p = parent.get(c);
  } while (!c.equals(source));
  s += "D";

  return convert(s);
}

String getMove(String source, String target) {
  String[] e = graph.get(source);
  for (int i = 0; i < e.length; i++) {
    if (e[i].equals(target))
      return i + "";
  }
  return "";
}

String hash(int[] arr) {
  if (arr.length != 3)
    return "-1";
  return arr[0] + "" + arr[1] + "" + arr[2];
}

void loadGraph() {
  println("loading graph");
  graph = new HashMap<String, String[]>();
  parent = new HashMap<String, String>();

  String[] in = loadStrings("graph.dat");
    
  for (String s : in) {
    String[] t = s.split(" ");
    String k = t[0];
    t[0] = "444";
    graph.put(k, t);
  }
  println("loaded graph");
}

String convert(String s) {
  return s.replace("0", "D").replace("1", "L").replace("2", "U").replace("3", "R").replace("DD","D");
}

void printGraph() {
  int i = 1;
  for (String k : graph.keySet()) {
    print(i++ + " " + k);
    for (String s : graph.get(k)) {
      print(" " + s);
    }
    println();
  }
}
