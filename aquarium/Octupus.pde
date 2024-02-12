class Octopus extends Animal{
  PImage img;
  
  Octopus(int x,int y, int size, Tank myTank){
    super(x,y,size,myTank);
    img = loadImage("octopus.png");
    this.foodChainID = size*2;
    this.MAXVELOCITY = 5;
  }
  
  Octopus(int x,int y, Tank myTank){
    this(x,y,10, myTank);
  }
  
  Octopus(Tank myTank){
    super(myTank);
  }
  
  void display(){
    fill(#00FF00);
    circle(position.x,position.y, size);
    image(img, position.x-size/2, position.y-size/2, size, size); //the image's corner will be at (0, 0) and the size of the image will be 25x50
  }
  
  boolean inYBounds(PVector nextPos){
    return nextPos.y - size/2  <= myTank.topCorner().y ||
        nextPos.y + size/2  >= myTank.bottomCorner().y - myTank.floor_height;
  }
  
  void updateFoodChain(Animal other){
    foodChainID = other.foodChainID/2 + foodChainID;
  }
  
  void changeV(){
    int dx = (int)random(-4,4);
    int dy = (int)random(-4,4);
    changeV(dx,dy);
  }
  
}
