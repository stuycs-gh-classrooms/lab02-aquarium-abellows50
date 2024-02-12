class Fish extends Animal{
  PImage img;
  
  Fish(int x,int y, int size, Tank myTank){
    super(x,y,size,myTank);
    img = loadImage("fish.png");
    this.foodChainID = size/2;
    this.MAXVELOCITY = 20;
  }
  
  Fish(int x,int y, Tank myTank){
    this(x,y,10, myTank);
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
    foodChainID = other.foodChainID*2 + foodChainID;
  }
  
  void changeV(){
    int dx = (int)random(-2,2);
    int dy = (int)random(-2,2);
    changeV(dx,dy);
  }
  
}
