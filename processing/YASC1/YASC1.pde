void setup()
{
  size(1000, 700);
  gameObjects.add(
    new Player(width / 2, height / 2, 0, color(255, 255, 255), 20));
  
  //gameObjects.add(new PathFollower(width / 2, height / 2));
}

boolean keys[] = new boolean[1024];

ArrayList<GameObject> gameObjects = new ArrayList<GameObject>();

void keyPressed()
{
  println("Key pressed");
  keys[keyCode] = true;
}

void keyReleased()
{
  println("Key released");
  keys[keyCode] = false;
}

boolean checkKey(int k)
{
  return keys[Character.toLowerCase(k)] || keys[Character.toUpperCase(k)]; 
}

void draw()
{
  background(0);
  for(int i = gameObjects.size() - 1 ; i >= 0  ; i --)
  {
    GameObject go = gameObjects.get(i);
    go.update();
    go.render();
  }
  
  if (frameCount % 120 == 0)
  {
    GameObject p = null;
    
    if (random(0, 1) > 0.5)
    {
      p = new HealthPowerup(random(0, width), random(0, height));
    }
    else
    {
      p = new AmmoPowerup(random(0, width), random(0, height));
    }
    gameObjects.add(p);
  }
  
  
  text("GameObjects:" + gameObjects.size(), 10, 20);
}