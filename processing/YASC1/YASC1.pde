void setup()
{
  size(500, 500);
  p = new Player(width / 2, height / 2, 0, color(255, 255, 255), 50);
  p1 = new Player(50, 50, 0, color(0, 255, 0), 40);
}

boolean keys[] = new boolean[1024];

Player p;
Player p1;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(int k)
{
  return keys[Character.toLowerCase(k)] || keys[Character.toUpperCase(k)]; 
}

void draw()
{
  background(0);
  p.update();
  p.render();
  
  p1.update();
  p1.render();
  
  for(Bullet b:bullets)
  {
    b.update();
    b.render();
  }
}