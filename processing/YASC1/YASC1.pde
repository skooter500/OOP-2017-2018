void setup()
{
  size(500, 500);
  gameObjects.add(
    new Player(width / 2, height / 2, 0, color(255, 255, 255), 50));
  gameObjects.add(new Player(50, 50, 0, color(0, 255, 0), 40));
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
  
  text("GameObjects:" + gameObjects.size(), 10, 20);
}