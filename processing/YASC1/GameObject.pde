abstract class GameObject
{
  float speed;
  PVector pos;
  PVector forward;
  float theta;
  
  GameObject(float x, float y, float speed, float theta)
  {
    pos = new PVector(x, y);
    this.speed = speed;
    this.theta = theta;
    forward = new PVector(0, -1);
  }
  
  abstract void render();
  abstract void update();
  
}