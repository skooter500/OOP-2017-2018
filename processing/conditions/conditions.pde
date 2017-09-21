
void setup()
{
  size(500, 500);
  halfW = width / 2;
  halfH = height / 2;
  x = halfW;
}

boolean isTopLeft(float x, float y)
{
  return x < halfW && x < halfH;
}

float x ;

void draw()
{
  background(0);
  /*fill(255, 0, 0);
  if (isTopLeft(mouseX, mouseY)) 
  {
    rect(0, 0, width / 2, height / 2);
  }
  else if (mouseX >= halfW && mouseY < halfH)
  {
    rect(halfW, 0, halfW, halfH);
  }
  else if (mouseX < halfW && mouseY >= halfH)
  {
    rect(0, halfH, halfW, halfH);
  }
  else
  {
    rect(halfW, halfH, halfW, halfH);
  }
  */
  /*
  float radius = 50;
  if (dist(halfW, halfH, mouseX, mouseY) < radius)
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(0, 0, 255);
  }
  */
  //ellipse(halfW, halfH, 100, 100);
  if (keyPressed)
  {
    if (key == 'n')
    {
      x ++;
    }
  }
  ellipse(x, halfH, 20, 20);
}

float halfW, halfH;