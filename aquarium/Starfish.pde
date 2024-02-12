class Starfish extends Animal {
  
  int numPoints;
  
  Starfish(int px, int py) {
    super(px, py);
    body = color(234, 132, 36);
    numPoints = int(random(5, 8));
  }
  
    boolean isValidStarfish() {
     if(position.y > tankY + (tankH - floorH)) {
       return true;
     }
     else {
       return false;
     }
   }
   
   void move() {
     super.move();
         velocity.y = 0;
   }
   
  }