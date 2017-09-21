import processing.sound.*;


void setup()
{
  size(500, 500);
  // Load the background image
  back = loadImage("ricknmorty.jpg");
  
  // Load the soundfile
  sound = new SoundFile(this, "1.wav");
  
}

PImage back;
SoundFile sound; 

void draw()
{ 
  image(back,0,0);
}

// This function gets called when the mouse is pressed
void mousePressed()
{
  
}

// This function gets called when the mouse is released
void mouseReleased()
{
  
}