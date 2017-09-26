void setup()
{
  size(500, 500);
  cx = width / 2;
  cy = height / 2;
}

float cx, cy;

void draw()
{
  background(0);
  stroke(255);
  for(int x = 0 ; x <= width ; x += 20)
  {
    line(x, height, cx, cy);
  }
  
  float y = cy;
  float gap = 1;
  while(y <= height)
  {
    line(0, y, width, y);
    y += gap;
    gap += 2;
  }
}