class Crab extends Animal {
  boolean reachedFloor = false;

  Crab(int _ax, int _ay, Tank myTank) {
    super(_ax, _ay, myTank);
    velocity.y = 1;
  }

  void move() {
    if (velocity.y < 0) {
      velocity.y *= -1;
    }
    if (!reachedFloor) {
      if (position.y  >= myTank.bottomCorner().y - myTank.floor_height) {
        reachedFloor = true;
        velocity.y = 0; // Stop falling when reached the floor
        velocity.x = random(-2,2); // Start crawling randomly left or right
      } else {
        position.y += velocity.y; // Continue falling until reached the floor
      }
    } else {
      // Randomly change direction when hitting the walls
      if (position.y + sizeL >= width || position.x <= 0) {
        velocity.x *= -1;
      }
      position.x += velocity.x; // Move horizontally
    }
  }


}
