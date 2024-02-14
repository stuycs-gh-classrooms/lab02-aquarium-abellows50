class Starfish extends Animal {
  
  int numPoints;
  Polygon p;
  
  Starfish(int px, int py, int size, Tank myTank) {
    super(px, py, size, myTank);
    c = color(234, 132, 36);
    numPoints = int(random(5, 8));
    p = new Polygon(numPoints,px,py,size);
  }
  
   void display(){
     p.setSize(size);
     p.makeRandomShape(position);
     p.display();
   }
   
   void changeV(){
     int dy = 0;
     if (position.y + random((-myTank.h+myTank.floor_height)/2) < myTank.floor_height){
       println("above sand");
        dy = (int)random(-2,4);
     }
    changeV(0,dy);
  }
   
  }
