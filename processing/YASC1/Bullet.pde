class Bullet
{
  PVector pos;
  PVector forward;
  float theta;
  float speed;
  
  Bullet(float x, float y, float theta, float speed)
  {
    pos = new PVector(x, y);
    forward = new PVector(0, -1);
    this.theta = theta;
    this.speed = speed;
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
  }
}