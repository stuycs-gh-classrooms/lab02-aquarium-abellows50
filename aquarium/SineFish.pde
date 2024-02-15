class SineFish extends Animal {
  float theta = 0;
  float angleSpeed;
  float refy;
  
  SineFish(int ax, int ay, Tank myTank) {
    super(ax, ay, myTank);
    angleSpeed = random(0.05, 0.2);
    refy = ay;
  }

 void move() {
    position.x += velocity.x;
    theta += angleSpeed;
    position.y = (int)(refy + 50 * sin(theta)); 
    if (position.x + sizeL >= width || position.x <= 0) {
      velocity.x *= -1;
    }
  }

  void display() {
    fill(0, 0, 255); 
    stroke(0);
    rect(position.x, position.y, sizeH, sizeL);
  }
}
