class Player extends GameObject
{
  color c;
  
  float radius;
  float rotSpeed;
  
  PVector force;
  PVector velocity;
  PVector acceleration;
  float timeDelta;
  float mass;
  float power;
  
  Player(float x, float y, float theta, color c, float radius)
  {
    super(x, y, 10, theta);
    this.c = c;
    rotSpeed = 0.1f;
    this.radius = radius; 
    
    force = new PVector();
    velocity = new PVector();
    acceleration = new PVector();
    mass = 1;
    timeDelta = 1 / 60f;
    power = 100;
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
      force = PVector.mult(forward, power);
    }
    if (checkKey('s'))
    {
      force = PVector.mult(forward, -power);      
    }   
    
    if (checkKey(' '))
    {
      PVector bp = PVector.add(pos, PVector.mult(forward, radius + 2));
      GameObject b = new Bullet(bp.x, bp.y, theta, speed * 2);
      gameObjects.add(b);
    }
    
    acceleration = PVector.div(force, mass);
    velocity.add(PVector.mult(acceleration, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    force.x = force.y = 0;
    
    if (pos.x > width)
    {
      pos.x = 0;
    }
    
    if (pos.x < 0)
    {
      pos.x = width;
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