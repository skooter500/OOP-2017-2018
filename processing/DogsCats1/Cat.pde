class Cat extends Animal
{
  PImage catImage;
  AudioPlayer meow;
  int lives;
  
  Cat(float x, float y)
  {
    super(true, x, y);
    catImage = loadImage("cat.jpg");
    meow = minim.loadFile("meow.wav");
    lives = 9;
  }
  
  void display()
  {
    image(catImage, x, y);    
  }
  
  void speak()
  {
    meow.rewind();
    meow.play();
  }
  
  void kill()
  {
    if (isAlive)
    {
      speak();
      lives --;
      println("Lives left: " + lives);
      if (lives == 0)
      {
        isAlive = false;
      }
    }
  }
}