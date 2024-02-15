class Animal implements Cloneable{
  PVector position, velocity;
  color c;
  int size;
  
  Tank myTank; //to know container attributes
  
  int MAXVELOCITY = 7;
  int MAXKIDS = 2;
  int REPRODUCTIVEAGE = (int)2.5*60;
  int LIFESPAN = 100*60;
  Animal parent;
  //Interaction Vars
  int foodChainID;
  int kids;
  int bornTime;
  
  //State Vars
  boolean alive;
  boolean remove;
  
  Animal(int x,int y, int size, Tank myTank){
    this.size = size;
    this.position = new PVector(x,y);
    this.velocity = new PVector();
    this.c = #FF0000;
    this.myTank = myTank;
    this.foodChainID =size;
    this.alive = true;
    this.remove = false;
    this.kids = 0;
    parent = null;
    bornTime = frameCount;
  }

  Animal(Tank myTank){
  }

  
  void setupObject(Animal other){
    other.size = 30;
    other.position = new PVector(position.x,position.y);
    other.velocity = new PVector((int)random(-2,2),(int)random(-2,2));
    other.c = #FF0000;
    other.myTank = myTank;
    other.foodChainID =size;
    other.alive = true;
    other.remove = false;
    other.kids = 0;
    other.parent = this;
    other.bornTime = frameCount;
  }
  
  Animal(int x,int y, Tank myTank){
    this(x,y,20, myTank);
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
    update();
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
  
  
  void update(){
    if(frameCount - bornTime > LIFESPAN){
      die();
    }
    if(frameCount %60 == 0){
    if(!canReproduce(this)){
      size++;
    }
    else{
    size -= 4;
    if(size <= 0){
      die();
    }
    }
    }
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
  
  boolean sameSpecies(Object other){
    return this.getClass() == other.getClass();
  }
  
  @Override
  protected Object clone() throws CloneNotSupportedException {
    println("cloning");
    Animal a = (Animal) super.clone();
    a.position = this.position.copy();
    a.velocity = this.velocity.copy();
    return a;
  }
  boolean canReproduce(Animal a){
    return frameCount - a.bornTime > REPRODUCTIVEAGE;
  }
  Animal interaction(ArrayList<Animal> animals){
    Egg e = null;
    
    for (Animal other: animals){
      if(other != this && isTouching(other) && alive && other.alive && random(1) > 0.5){
        if(sameSpecies(other) 
          && this.kids<MAXKIDS 
          && other.kids<other.MAXKIDS 
          && canReproduce(this)
          && canReproduce(other)){//same species
          Animal baby;
          try {
            baby = (Animal)this.clone();
          } catch (CloneNotSupportedException ex) {
            baby = new Animal((int)position.x,(int)position.y,10,myTank);
          }
          setupObject(baby);
          e = new Egg((int)position.x,(int)position.y,2*60,10, baby,myTank);
          this.kids++;
        }
        //else if(!(other instanceof Egg ||sameSpecies(other) )){
        else if(!(other instanceof Egg && canReproduce(this))){
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
    return e;
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
}
