class HealthPowerup extends GameObject implements Powerup
{
  HealthPowerup(float x, float y)
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
    stroke(255, 255, 0);
    noFill();
    ellipse(0, 0, 20, 20);
    popMatrix();
  }
  
  void update()
  {
   pos.add(forward); 
  }
  
  void applyTo(Player player)
  {
    player.health += 10;
  }
}