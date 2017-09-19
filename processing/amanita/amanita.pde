void setup()
{
  size(500, 500);
  noCursor();
}

void draw()
{
  background(0);
  noStroke();
  fill(255, 0, 0);
  arc(mouseX, mouseY, 100, 100, PI - 0.2f, TWO_PI + 0.2f);
  fill(200);
  rect(mouseX - 10, mouseY, 20, 30);
  fill(255);
  ellipse(mouseX -25, mouseY - 20, 10, 10);
  ellipse(mouseX -5, mouseY - 35, 10, 10);
  ellipse(mouseX +20, mouseY - 15, 10, 10);
  ellipse(mouseX +30, mouseY - 30, 10, 10);
}