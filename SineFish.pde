class SineFish extends Animal {
  float theta = 0;
  float angleSpeed;
  float refy;
  
  SineFish(int _ax, int _ay) {
    super(_ax, _ay);
    angleSpeed = random(0.05, 0.2);
    refy = ay;
  }

 void move() {
    ax += xspeed;
    theta += angleSpeed;
    ay = (int)(refy + 50 * sin(theta)); 
    if (ax + aw >= width || ax <= 0) {
      xspeed *= -1;
    }
  }

  void display() {
    fill(255, 0, 255); 
    stroke(0);
    rect(ax, ay, aw, ah);
  }
}
