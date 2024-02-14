class Animal {
  PVector position, velocity;
  color c;
  int size;
  
  int sizeL;
  int sizeH;
    
  Tank myTank; //to know container attributes
  
  int MAXVELOCITY = 10;
  
  //Interaction Vars
  int foodChainID;
  
  //State Vars
  boolean alive;
  boolean remove;
  
  Animal(int x,int y, int size, Tank myTank){
    this.size = size;
    position = new PVector(x,y);
    velocity = new PVector();
    c = #FF0000;
    this.myTank = myTank;
    this.foodChainID =size;
    alive = true;
    remove = false;
  }
  
  Animal(int x,int y, Tank myTank){
    this(x,y,20, myTank);
  }
  
  Animal(Tank myTank){
  }
  
  boolean inXBounds(PVector nextPos){
    return nextPos.x - size/2 <= myTank.topCorner().x ||
        nextPos.x + size/2 >= myTank.bottomCorner().x;
  }
  
  boolean inYBounds(PVector nextPos){
    return nextPos.y - size/2  <= myTank.topCorner().y ||
        nextPos.y + size/2  >= myTank.bottomCorner().y;
  }
  
  void move(){
    changeV(); //random velocity change
    PVector nextPos = position.copy();
    nextPos.add(velocity);
    if (inXBounds(nextPos)){
          velocity.x = -velocity.x;
    }
    if (inYBounds(nextPos)){
          velocity.y = -velocity.y;
    }
    position.add(velocity);

      if(position.y - size/2 < myTank.topCorner().y){
        position.y = myTank.topCorner().y + size/2 + 1;
      }
      if(position.y + size/2 > myTank.bottomCorner().y){
        position.y = myTank.bottomCorner().y -size/2 - 1;
      }
      if(position.x - size/2 < myTank.topCorner().x){
        position.x = myTank.topCorner().x + size/2 + 1;
      }
      if(position.x + size/2 > myTank.bottomCorner().x){
        position.x = myTank.bottomCorner().x - size/2 - 1;
      }
  }
  
  void display(){
    fill(c);
    circle(position.x,position.y, size);
  }
  
  void changeV(int dx, int dy){
    velocity.add(new PVector(dx,dy));
    if (abs(velocity.x) > MAXVELOCITY){
      velocity.x = abs(velocity.x)*MAXVELOCITY/velocity.x;
    }
    if (abs(velocity.y) > MAXVELOCITY){
      velocity.y = abs(velocity.y)*MAXVELOCITY/velocity.y;
    }
  }
  
  void changeV(){
    int dx = (int)random(-2,2);
    int dy = (int)random(-2,2);
    changeV(dx,dy);
  }
  
  void interaction(ArrayList<Animal> animals){
    for (Animal other: animals){
      if(other != this && isTouching(other) && alive && other.alive && random(1) > 0.5){
        //basic eat
        float theirFactor = random(2);
        float myFactor = random(2);
        
        if(other.foodChainID*theirFactor < this.foodChainID*myFactor){
          this.eat(other);
          other.die();
        }
        else if(other.foodChainID*theirFactor == this.foodChainID*myFactor){
          
          if(random(1) > 0.5){
            this.eat(other);
            other.die();
          }
          else{
            other.eat(this);
            this.die();
          }
          
        }
        else {
          other.eat(this);
          this.die();
        }
      }
    }
  }
  
  void die(){
    alive = false;
    remove = true;
  }
  
  void updateSize(Animal other){
    size = (int)sqrt(size*size + other.size*other.size);
    if(size>width/2){
      size/=2;
    }
  }
  
  void updateFoodChain(Animal other){
    foodChainID = size/3;
  }
  
  void eat(Animal other){
    updateSize(other);
    updateFoodChain(other);
  }
  
  boolean isTouching(Animal other){
    return dist(this.position.x,this.position.y,other.position.x,other.position.y) < (this.size+other.size)/2 - 4;
  }
  
  //NEW METHODS
  int speedGenerator() {
    int genspeed = int(random(-4,4));
    while (genspeed == 0) {
       genspeed = int(random(-4,4));
    } 
    return genspeed;
  }
  
  
}
