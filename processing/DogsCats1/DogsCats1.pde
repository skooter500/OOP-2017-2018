import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

void setup()
{
  size(800, 800);
  minim = new Minim(this);
  setupAnimals();  
}

Minim minim;

void setupAnimals()
{
  animals.clear();
  for(int i = 0 ; i < 3 ; i ++)
  {
    int dice = (int) random(0, 3);
    switch(dice)
    {
      case 0:
        animals.add(new Dog(i * 200, 100));
        break;
      case 1:
        animals.add(new Cat(i * 200, 100));
        break;
       case 2:
        animals.add(new Sheep(i * 200, 100));
        break;
    }
  }
}

ArrayList<Animal> animals = new ArrayList();

void draw()
{
  background(0);
  for(Animal a:animals)
  {
    a.display();
  }
  if (keyPressed)
  {
    if (key == ' ')
    {
      setupAnimals();
    }
    
    int numKey = key - '0';
    if (numKey >= 0 && numKey <= 3)
    {
      animals.get(numKey).speak();
    }
  }
  
}