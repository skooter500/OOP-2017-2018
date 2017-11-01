class Dog extends Animal
{
  PImage dogImage;
  AudioPlayer bark;
  
  Dog(float x, float y)
  {
    super(true, x, y);
    dogImage = loadImage("dog.jpg");
    bark = minim.loadFile("bark.wav");
  }
  
  void fetch()
  {
    speak();
    println("Im a happy doggie because I have something to fetch!");
  }
  
  void display()
  {
    image(dogImage, x, y);
  }
  
  void speak()
  {
    bark.rewind();
    bark.play();
  }
}