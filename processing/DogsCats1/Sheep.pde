class Sheep extends Animal
{
  PImage sheepImage;
  AudioPlayer baaa;
  
  Sheep(float x, float y)
  {
    super(true, x, y);
    sheepImage = loadImage("sheep.jpg");
    baaa = minim.loadFile("bleet.wav");
  }
  
  void display()
  {
    image(sheepImage, x, y);
    
  }
  
  void speak()
  {
    baaa.rewind();
    baaa.play();
  }
}