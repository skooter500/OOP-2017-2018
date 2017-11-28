class AmmoPowerup extends GameObject implements Powerup
{
  AmmoPowerup(float x, float y)
  {
    super(x, y, 5, 0);
    forward.x = random(-1, 1);
    forward.y = random(-1, 1);
    forward.normalize();
  }
  
  void render()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    stroke(0, 255, 0);
    noFill();
    rectMode(CENTER);
    rect(0,0, 20, 20);
    popMatrix();
  }
  
  void update()
  {
   pos.add(forward); 
   theta += 0.1f;
  }
  
  void applyTo(Player player)
  {
    player.ammo += 10;
  }
}