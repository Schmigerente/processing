import java.io.*;
import java.util.*;

final String path = "D:\\Workspace/processing/byte_compare/input";

void setup() {
    try {
        BufferedReader r = new BufferedReader(new FileReader(path));
        
        List<String> buffer = new ArrayList<String>();
        
        String s;
        while ((s = r.readLine()) != null) {
            buffer.add(s);
        }
        
        String[] arr = new String[buffer.size()]; 
        for (int i = 0; i < arr.length; i++) {
            
            arr[i] = buffer.get(i);;
        }
        
        saveStrings("read.txt", arr);
        
        r.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    exit();
}
