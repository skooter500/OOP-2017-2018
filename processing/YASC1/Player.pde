class Player extends GameObject
{
  color c;
  
  float radius;
  float rotSpeed;
  
  Player(float x, float y, float theta, color c, float radius)
  {
    super(x, y, 10, theta);
    this.c = c;
    rotSpeed = 0.1f;
    this.radius = radius; 
  }
  
  void update()
  {
    forward.x = sin(theta);
    forward.y = - cos(theta);
    if (checkKey('a'))
    {
      theta -= rotSpeed;
    }
    if (checkKey('d'))
    {
      theta += rotSpeed;
    }
    
    if (checkKey('w'))
    {
      pos.add(PVector.mult(forward, speed));
    }
    if (checkKey('s'))
    {
      pos.sub(PVector.mult(forward, speed));
    }   
    
    if (checkKey(' '))
    {
      PVector bp = PVector.add(pos, PVector.mult(forward, radius + 2));
      GameObject b = new Bullet(bp.x, bp.y, theta, speed * 2);
      gameObjects.add(b);
    }
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    stroke(c);
    line(-radius,  radius, 0 ,  - radius);
    line(0 ,  - radius,  radius,  radius);
    line( radius,  radius, 0 , 0);
    line(0, 0,  - radius,  radius);  
    popMatrix();
  }
}