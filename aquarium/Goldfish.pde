class Goldfish extends Animal {
  
  Goldfish(int px, int py, Tank myTank) {
    super(px, py, myTank);
    c = color(198, 131, 108);
    velocity.y += 3;
  }
  
  void display() {
    super.display();
    fill(0);
    circle(position.x + 10, position.y + sizeH/2, 2);
  }
  
  
}
