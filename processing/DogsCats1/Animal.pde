class Animal
{
  boolean isAlive;
  float x, y;
  
  Animal(boolean isAlive, float x, float y)
  {
    this.isAlive = isAlive;
    this.x = x;
    this.y = y;
  }
  
  Animal()
  {
    // Constructor chaining
    this(true, 0, 0);
  }
  
  void display()
  {
  }
  
  void speak()
  {
    println("I cant speak!");
  }
}