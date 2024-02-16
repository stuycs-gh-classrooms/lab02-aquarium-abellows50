class Crab extends Animal {
  boolean reachedFloor = false;

  Crab(int _ax, int _ay, Tank myTank) {
    super(_ax, _ay, myTank);
    velocity.y = 1;
    this.LIFESPAN = 200*60;
    this.foodChainID = 200;
  }

  void changeV(){
    if (position.y + sizeH  >= myTank.bottomCorner().y - myTank.floor_height) {
        reachedFloor = true;
        velocity.y = 0; // Stop falling when reached the floor
    }
   
  else{
    velocity.y = random(0,6);
    println(frameCount);
  }
  velocity.x = random(-5,5);
  }

}
