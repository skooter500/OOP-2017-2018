void setup()
{
  println(map(2, 0, 4, 200, 300));
  println(map1(2, 0, 4, 200, 300));

  println(map(4, 0, 1, 0, 25));
  println(map1(4, 0, 1, 0, 25));
  println(map(130, 100, 200, 200, 300));
 println(map1(130, 100, 200, 200, 300));
}

float map1(float a, float b, float c, float d, float e)
{
  float range1 = c - b;
  float howFar1 = (a-b) / range1; 
  float range2 = e - d;
  float howFar2 = d + howFar1 * range2;
  return howFar2;
}