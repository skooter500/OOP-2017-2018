class PathFollower extends Player
{
  ArrayList<PVector> waypoints = new ArrayList<PVector>();
  int current = 0;
  PathFollower(float x, float y)
  {
    super(x, y, 0, color(255), 20);
    for(int i = 0 ; i < 5 ; i ++)
    {
      waypoints.add(new PVector(random(0, width), random(0, height)));
    }   
  }
  
  void update()
  {
    PVector target = waypoints.get(current);
    
    PVector toTarget = PVector.sub(target, pos);
    toTarget.normalize();
    
    force = PVector.mult(toTarget, power);
    acceleration = PVector.div(force, mass);
    velocity.limit(50);
    velocity.add(PVector.mult(acceleration, timeDelta));
    pos.add(PVector.mult(velocity, timeDelta));
    forward = velocity.get();   
    theta = atan2(velocity.y, velocity.x) + HALF_PI;
    
    force.x = force.y = 0;
    
    
    float dist = dist(pos.x, pos.y, target.x, target.y);
    if (dist < 10)
    {     
      current = (current + 1) % waypoints.size();
    }
    
    for(int i = 1 ; i <= waypoints.size() ; i ++)
    {
      PVector a = waypoints.get(i - 1);
      PVector b = waypoints.get(i % waypoints.size());
      line(a.x, a.y, b.x, b.y);
      
    }
  }
}