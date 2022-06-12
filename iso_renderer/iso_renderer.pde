import java.util.*;

//holds a resourceLoader instance;
public static ResourceLoader resourceLoader;

int x_size = 256;
int y_size = 128;

PImage c1, c2;

/** Entry point for the program
*   sets basic parameters like screen size and framerate
*/
void setup() {
    frameRate(-1);
    size(1024, 1024);
    
    Chunk ch1 = new Chunk(0, 1);
    Chunk ch2 = new Chunk(0, 0);
    
    ch1.setDefault();
      
    background(0);
      
    c1 = ch1.getChunkImage();
  
    ch2.loadFile();
    
    c2 = ch2.getChunkImage();
    
}

/** Gets called every frame
*   defines the game ticks
*   //TODO decouple game ticks from render ticks
*/  
void draw () {
    background(0);
    pushMatrix();
    imageMode(CENTER);
    translate(width/2, height/2);
    

    popMatrix();
    textSize(20);
    fill(255, 0, 0);
    text((int)frameRate, 8, 20);
}

/** returns the current resourceLoader instance and creates one if none is present
*   @return ResourceLoader instance
*/  
public ResourceLoader getResourceLoaderInstance() {
    if (resourceLoader == null)
        resourceLoader = new ResourceLoader();
    return resourceLoader;
}
