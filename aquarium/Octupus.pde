class Octopus extends Animal {
    PImage img;

    Octopus(int x, int y, int size, Tank myTank, PImage img) {
        super(x, y, size, myTank);
        this.img = img;
        this.foodChainID = size;
        this.MAXVELOCITY = 3;
    }

    Octopus(int x, int y, Tank myTank, PImage img) {
        this(x, y, 10, myTank, img);
    }

    Octopus(Tank myTank) {
        super(myTank);
    }

    void display() {
        fill(#00FF00);
        circle(position.x, position.y, size);
        image(img, position.x - size / 2, position.y - size / 2, size, size);
    }

    boolean inYBounds(PVector nextPos) {
        return nextPos.y - size / 2 <= myTank.topCorner().y ||
                nextPos.y + size / 2 >= myTank.bottomCorner().y - myTank.floor_height;
    }

    void updateFoodChain(Animal other) {
        foodChainID = other.foodChainID + foodChainID;
    }

    void changeV() {
        int dx = (int) random(-3, 3);
        int dy = (int) random(-3, 3);
        changeV(dx, dy);
    }
}
