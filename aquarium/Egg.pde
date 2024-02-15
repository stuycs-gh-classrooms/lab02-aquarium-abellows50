class Egg extends Animal{
  int hatchSize;
  int maturationTime;
  int layedTime;
  Animal baby;


  Egg(int x, int y, int maturationTime, int strength, Animal baby, Tank myTank){
    super(x,y,myTank);
    this.baby = baby;
    foodChainID = strength;
    this.maturationTime = maturationTime;
    layedTime = frameCount;
    c = #000000;
  }
  
  boolean ready(){
    return frameCount-layedTime > maturationTime;
  }
  
  void changeV(){
    int dx = (int)random(-2,2);
    int dy = (int)random(-4,1);
    changeV(dx,dy);
  }
  
  Animal hatch(){
    if(ready()){
      baby.position = this.position.copy();
      return baby;
    }
    return null;
  }
  Animal interaction(ArrayList<Animal> animals){
    return null;  
  }
} 
