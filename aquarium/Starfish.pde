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
    int dx = (int)random(-1,1);
    int dy = (int)random(-1,1);
    changeV(dx,dy);
  }
   
  }
