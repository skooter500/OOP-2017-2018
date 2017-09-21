void setup()
{
  size(500, 500);
  noCursor();
  y = height / 2;
}

float x = 0;
float y = 0;

void draw()
{
  background(0);
  noStroke();
  fill(255, 0, 0);
  arc(x, y, 100, 100, PI - 0.2f, TWO_PI + 0.2f);
  fill(200);
  rect(x - 10, y, 20, 30);
  fill(255);
  ellipse(x -25, y - 20, 10, 10);
  ellipse(x -5, y - 35, 10, 10);
  ellipse(x +20, y - 15, 10, 10);
  ellipse(x +30, y - 30, 10, 10);
  x ++;
}