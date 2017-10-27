void setup()
{
  size(500, 500);
  radar1 = new Radar(width / 2, height / 2, 100, 0.5, color(0, 255, 0));
}

Radar radar1;

void draw()
{
  background(0);
  radar1.render();
  radar1.update();
}