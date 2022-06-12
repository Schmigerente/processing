class Block {
    
    private String blockType;
    private PImage texture;
    
    /** creates a new Block instance
    *   @param type the type of the block that doubles as texture key
    */
    public Block(String type) {
        this.blockType = type;
        
    }
     
    /** Returns the block texture
    *   @return block texture as PImage
    */  
    public PImage getTexture() {
        if (texture == null)
            texture = getResourceLoaderInstance().getImage(blockType);
        return texture;
    }    
}
