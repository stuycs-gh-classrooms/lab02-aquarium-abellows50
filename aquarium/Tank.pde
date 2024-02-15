import java.util.*;
import java.util.Iterator;
class Tank {
  int x, y, w, h, floor_height;
  ArrayList<Animal> animals;
  //Iterator<Animal> animalIterator;
  color WATER = #00FFFF;
  color SAND = #000000;
  
  Tank(int x, int y, int w, int h, int floor_height){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.floor_height = floor_height;
    animals = new ArrayList<Animal>();
  }
  
  void display(){
    fill(WATER);
    rect(x,y,w,h);
    fill(SAND);
    rect(x,y+h-floor_height, w, floor_height);
    for (Animal a: animals){
      a.display();
    }
  }
  
 
  
  void populate(int n){
    for (int i = 0; i<n; i++){
      int species = (int) random(3);
      if(species == 0){
        animals.add(new Fish((int) random(x,x+w), (int) random(y + h), this,fishImg));
      }
      if(species == 1){
        animals.add(new Animal((int) random(x,x+w), (int) random(y + h),this));
      }
      if(species==2){
        animals.add(new Octopus((int) random(x,x+w), (int) random(y + h - floor_height),this,octopusImg));
      }
    }
  }
  
  void moveAnimals(){
    for (Animal a: animals){
      a.move();
    }
  }
  
  void clean(){
    Iterator<Animal> animalIterator = animals.iterator();
    while(animalIterator.hasNext()){
      Animal a = animalIterator.next();
      if(a.remove){
        animalIterator.remove();
      }
    }
  }
  
  void interactions(){
    ArrayList<Egg> eggs = new ArrayList<Egg>();
    for (Animal a: animals){
      Egg babs = (Egg) a.interaction(animals);
      if(babs!=null){
        eggs.add(babs);
        println("layed an egg");
      }
    }
    for(Egg e: eggs){
      animals.add(e);
    }
  }
  
  void hatch(){
    ArrayList<Animal> babys = new ArrayList<Animal>();
    ArrayList<Animal> hatchedEggs = new ArrayList<Animal>();
    for (Animal a: animals){
      if(a instanceof Egg){
        Egg egg = (Egg) a;
        Animal baby = egg.hatch();
        if (baby != null){
          babys.add(baby);
          hatchedEggs.add(a);
        }
      }
    }
    for (Animal a: babys){
      animals.add(a);
    }
    for (Animal e: hatchedEggs){
      animals.remove(e);
    }
  }
  PVector bottomCorner(){
    return new PVector(x+w,y+h);
  }
  
  PVector topCorner(){
    return new PVector(x,y);
  }
  
  void addAniaml(Animal a){
    animals.add(a);
  }
  
  void addAnimal(int x, int y){
    animals.add(new Fish(x,y,this,fishImg));
  }
  
  void addAnimal(char i){
    switch(i){
      case '0':
        animals.add(new Starfish(mouseX,mouseY,20,this));
        break;
      case '1':
        animals.add(new Crab(mouseX,mouseY,this));
        break;
      case '2':
        animals.add(new Fish(mouseX,mouseY,20,this,fishImg));
        break;
      case '3':
        animals.add(new Octopus(mouseX,mouseY,20,this,octopusImg));
        break;
    }
  }
}
