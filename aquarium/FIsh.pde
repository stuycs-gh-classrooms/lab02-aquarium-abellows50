class Fish extends Animal{
  PImage img;
  
  Fish(int x,int y, int size, Tank myTank, PImage img){
    super(x,y,size,myTank);
    this.img = img;
    this.foodChainID = size/4;
    this.MAXVELOCITY = 5;
  }
  
  Fish(int x,int y, Tank myTank, PImage img){
    this(x,y,10, myTank, img);
  }
  
  Fish(Tank myTank){
    super(myTank);
  }
  
  void display(){
    fill(#FFFF00);
    circle(position.x,position.y, size);
    image(img, position.x-size/2, position.y-size/2, size, size); //the image's corner will be at (0, 0) and the size of the image will be 25x50
  }
  
  boolean inYBounds(PVector nextPos){
    return nextPos.y - size/2  <= myTank.topCorner().y ||
        nextPos.y + size/2  >= myTank.bottomCorner().y;
  }
  
  void updateFoodChain(Animal other){
    foodChainID = other.foodChainID + foodChainID;
  }
  
  void changeV(){
    int dx = (int)random(-2,2);
    int dy = (int)random(-2,2);
    changeV(dx,dy);
  }
  
}
