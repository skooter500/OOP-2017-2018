class Bullet extends GameObject
{
  Bullet(float x, float y, float theta, float speed)
  {
    super(x, y, speed, theta); 
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    line(0, -5, 0, 5);
    popMatrix();
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    pos.add(PVector.mult(forward, speed));
    
    if (pos.x < 0 || pos.x > width || pos.y < 0 || pos.y > height)
    {
      gameObjects.remove(this);
    }
    
  }
}