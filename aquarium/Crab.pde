class Crab extends Animal {
  boolean reachedFloor = false;

  Crab(int _ax, int _ay) {
    super(_ax, _ay);
  }

  void move() {
    if (yspeed < 0) {
      yspeed *= -1;
    }
    if (!reachedFloor) {
      if (ay + ah >= height-floorH) {
        reachedFloor = true;
        yspeed = 0; // Stop falling when reached the floor
        xspeed = speedGenerator(); // Start crawling randomly left or right
      } else {
        ay += yspeed; // Continue falling until reached the floor
      }
    } else {
      // Randomly change direction when hitting the walls
      if (ax + aw >= width || ax <= 0) {
        xspeed *= -1;
      }
      ax += xspeed; // Move horizontally
    }
  }

  void display() {
    fill(255, 0, 0); // Change color for the crab
    stroke(0);
    rect(ax, ay, aw, ah);
  }
}
