Tank t;
int tankX = 0;
int tankY = 50;
int floorH = 100;
int tankW;
int tankH;
int sizeH=0;
int sizeL=0;
PImage fishImg, octopusImg;


void setup() {
  size(600,600);
  fishImg = loadImage("fish.png");
  octopusImg = loadImage("octopus.png");
  tankW = width;
  tankH = height - 20;
  t = new Tank(tankX, tankY, tankW, tankH, floorH);
  t.display();
  frameRate(60);
}//setup


void draw(){
  background(150);
  t.moveAnimals();
  
  
  t.interactions();
  t.hatch();
  
  t.clean();
  t.display();
  
}

void mouseClicked() {

  println("clicked");
  //t.addAnimal(new Crab(mouseX,mouseY,t));

}

void keyPressed(){
  t.addAnimal(key);
}
