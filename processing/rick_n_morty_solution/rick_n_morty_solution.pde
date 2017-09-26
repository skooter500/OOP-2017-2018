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
float buttonWidth = 200;
float buttonHeight = 50;
boolean clicked = false;

void draw()
{ 
  image(back,0,0);
  
  rectMode(CENTER);
  noStroke();
  
  if (clicked)
  {
    fill(0);
  }
  else
  {
    fill(255, 0, 0);
  }
  rect(width / 2, height / 2, buttonWidth, buttonHeight);
}

// This function gets called when the mouse is pressed
void mousePressed()
{
  float tlx = width / 2 - buttonWidth / 2;
  float tly = height / 2 - buttonHeight / 2;
  if (mouseX > tlx && mouseX < tlx + buttonWidth
    && mouseY > tly && mouseY < tly + buttonHeight
    )
    {
      clicked = true;
      sound.play();
    }
}

void mouseReleased()
{
  clicked = false;
}