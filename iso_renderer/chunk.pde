class Chunk {

    // x-axis == down right
    // y-axis == up
    // z-axis == down left
    //Defines the size of all sides of a chunk cube
    public final int CHUNK_LENGTH = 16;
    //Defines the total amount of blocks in a chunk
    public final int CHUNK_SIZE = CHUNK_LENGTH * CHUNK_LENGTH * CHUNK_LENGTH;
    //stores the blocks of a chunk
    public final Block[] blockData = new Block[CHUNK_SIZE];

    //defines the global x chunk coordinate of the chunk
    public final long chunkX;
    //defines the global y chunk coordinate of the chunk
    public final long chunkY;

    private boolean updated = false;
    private PImage bakedChunk;

    /** returns the block from the given coordinate triple
    *   @param x the first horizontal coordinate parameter. must be in range of [0 , CHUNK_LENGTH)
    *   @param y the vertical coordinate parameter. must be in range of [0 , CHUNK_LENGTH)
    *   @param z the second horizontal coordinate parameter. must be in range of [0 , CHUNK_LENGTH)
    *   @return return an Instance of Block or null if the block represents air
    */  
    public Block getBlock(int x, int y, int z) {
        return blockData[x+y+z];
    }

    /** returns the block from the given coordinate triple
    *   @param x the first horizontal coordinate parameter. must be in range of [0 , CHUNK_LENGTH)
    *   @param y the vertical coordinate parameter. must be in range of [0 , CHUNK_LENGTH)
    *   @param z the second horizontal coordinate parameter. must be in range of [0 , CHUNK_LENGTH)
    *   @param b a Block instance or null if it should represent air
    */  
    public void setBlock(int x, int y, int z, Block b) {
        blockData[x + 16 * (z + y * 16)] = b;
        updated = true;
    }
    
    /** Creates a new Chunk Instance
    *   @param x the x chunk coordinate of the chunk
    +   @param y the y chunk coordinate of the chunk
    */
    public Chunk(long x, long y) {
        this.chunkX = x;
        this.chunkY = y;
    }

    /** Returns a prerendered view of the chunk
    *   @return chunk view as PImage
    */
    public PImage getChunkImage() {
        if (updated || bakedChunk == null)
            bake();
        return bakedChunk;
    }

    /** Generated a prerendered view of the chunk
    *   invoked automatically if getChunkImage is invoked and changes to the blockData array occured via
    *   the setBlock method
    */  
    public void bake() {
        int size = CHUNK_LENGTH * ResourceLoader.TEXTURE_SIZE;
        PImage bakedImage = createImage(1, 1, ARGB);
        bakedImage.set(0, 0, 16777215);
        bakedImage.resize(size, size);

        int hts = ResourceLoader.TEXTURE_SIZE/2;

        // i == x, j == z, k == y
        for (int k = 0; k < CHUNK_LENGTH; k++) {
            for (int j = 0; j < CHUNK_LENGTH; j++) {
                for (int i = 0; i < CHUNK_LENGTH; i++) {

                    int index = i + j*CHUNK_LENGTH + k*CHUNK_LENGTH*CHUNK_LENGTH;

                    if (blockData[index] == null)
                        continue;

                    Block b = blockData[index];

                    int x_coord = hts*15 + (i-j)*hts;
                    int y_coord = (i+j)*hts/2 - hts*(k-15) ;

                    paintToCanvas(bakedImage, b.getTexture(), x_coord, y_coord);
                }
            }
        }

        bakedChunk = bakedImage;
    }

    //helper method to copy block textures to the chunk image
    private void paintToCanvas(PImage canvas, PImage source, int x, int y) {
        for (int j = 0; j < source.height; j++) {
            for (int i = 0; i < source.width; i++) {

                int col = source.get(i, j);

                if (col>>24 == 0)
                    continue;

                canvas.set(x+i, y+j, col);
            }
        }
    }

    /** Sets the chunk to a default configuarion
    *   4 layers stone
    *   3 layers dirt
    *   1 layer grass
    */  
    public void setDefault() {
        for (int i = 0; i < CHUNK_SIZE; i++) {

            if (i < CHUNK_LENGTH*CHUNK_LENGTH*4) {
                blockData[i] = new Block("stone_block");
                continue;
            }

            if (i < CHUNK_LENGTH*CHUNK_LENGTH*7) {
                blockData[i] = new Block("dirt_block");
                continue;
            }

            if (i < CHUNK_LENGTH*CHUNK_LENGTH*8) {
                blockData[i] = new Block("grass_block");
                continue;
            }

            blockData[i] = null;
        }
    }

    /** Stores the chunk in a file
    *   the name of the save file is controlled by the chunk coordinate attributes
    */  
    public void saveFile() {

        String filename = "data/chunks/chunk_" + chunkX + "_" + chunkY;

        String[] strg = new String[1];
        strg[0] = toString();


        saveStrings(filename, strg);
    }
    
    /** Loads the chunk in a file or loads a default chunk if no file was found
    *   the name of the save file is controlled by the chunk coordinate attributes
    */ 
    public void loadFile() {

        String filename = "data/chunks/chunk_" + chunkX + "_" + chunkY;

        String[] loaded = loadStrings(filename);

        if (loaded == null) {
            setDefault();
            return;
        }
        
        int pointer = 0;
        
        for (int j = 0; j < loaded.length; j++) {
            String s = loaded[j];
            String[] values = s.split(":");
            String name = values[0];
            int count = Integer.parseInt(values[1]);
            
            if (!name.equals("void")) {
                for (int i = 0; i < count; i++) {
                    blockData[pointer+i] = new Block(name);
                }
            }
            
            pointer += count;      
        }
    }
    
    /** Returns a String representtion of the chunk
    *   @return String representation of the chunk
    */
    public String toString() {
        String save = "";
        String last = blockData[0] != null ? blockData[0].blockType : "void";
        int c = 1;
        for (int i = 1; i < CHUNK_SIZE; i++) {
            String block = blockData[i] != null ? blockData[i].blockType : "void";

            if (!block.equals(last)) {
                save += last + ":" + c + "\n";
                last = block;
                c = 0;
            }

            c++;
        }
        save += last + ":" + c;
        return save;
    }
}
