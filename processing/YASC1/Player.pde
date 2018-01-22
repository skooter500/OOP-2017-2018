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
  
  int ammo;
  int health;
  
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
    ammo = 10;
    health = 10;
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
    
    if (checkKey(' ') && ammo > 0)
    {
      PVector bp = PVector.add(pos, PVector.mult(forward, radius + 2));
      GameObject b = new Bullet(bp.x, bp.y, theta, speed * 2);
      gameObjects.add(b);
      ammo --;
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
    
    if (pos.y < 0)
    {
      pos.y = height;
    }
    
    if (pos.y > height)
    {
      pos.y = 0;
    }
    
    checkCollisions();
  }
  
  void checkCollisions()
  {
    for(int i = gameObjects.size() - 1 ; i >= 0  ; i --)
    {
      GameObject go = gameObjects.get(i);
      if (go instanceof Powerup)
      {
        if (dist(this.pos.x, this.pos.y, go.pos.x, go.pos.y) < 40)
        {
          ((Powerup) go).applyTo(this);
          gameObjects.remove(go);
        }        
      }
    }
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(0, 255, 255);
    text("Health: " + health, 30, 0);
    text("Ammo: " + ammo, 30, 20);
    rotate(theta);
    stroke(c);
    line(-radius,  radius, 0 ,  - radius);
    line(0 ,  - radius,  radius,  radius);
    line( radius,  radius, 0 , 0);
    line(0, 0,  - radius,  radius);  
    popMatrix();
  }
}