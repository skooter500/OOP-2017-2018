void setup()
{
  println(i);  // i is a global variable  
}

void draw()
{
  i = 100; // integer assignment
  f = 100.0f; // float assignment
  f = 100.0;
  f = i;
  i = (int)f; // To convert a float to an int, you have to use a cast
  
  b = true; // Assignment to a boolean
  if (b)
  {
    println("true");
  }
  
  b = (f == 100); // Assignment to a boolean from a conditional expression
  i = 10;
  int j; // A local variable
  j = i ++; // post increment
  println(j);
  i += 1;
  i = i + 1;
  i = 10;
  j = ++ i; // pre increment
  println(j);
  
}
// The Java primitive types
// These variables are global and can be used throughout the sketch
int i = 0; // i is an integer
float f; // f is a real number
char c = 'a'; // A character
String s = "Hello!"; // A sequence of characters
double d; // Like a float but takes up twice as much memory
boolean b; // Can hold the value true or false