void setup()
{
  size(500, 500);
  
  for (int i = 0 ; i < rainFall.length ; i ++)
  {
    println(months[i] + "\t" + rainFall[i]); 
  }
  
  // For each
  // Cant modify the array and no access to i
  for(String m:months)
  {
    println(m);
  }
  
  println(maxIndex(rainFall));
  drawGraph(rainFall);
}

void drawGraph(float[] arr)
{
  float barWidth = width / (float) arr.length;
  float maxValue = arr[maxIndex(arr)];
  float scaleFactor = height / maxValue;
  
  for (int i = 0 ; i < arr.length ; i ++)
  {
    noStroke();
    fill(random(0, 255), random(0, 255), random(0, 255));
    float x = i * barWidth;
    rect(x, height, barWidth, - arr[i] * scaleFactor);
  }
}

float average(float[] arr)
{
   float sum = sum(arr);
   
   return sum / (float) arr.length;
}

float sum(float[] arr)
{
  float sum = 0;
  for(float f:arr)
  {
    sum += f;
  }
  
  return sum;
}

int minIndex(float[] arr)
{
  float minValue = Float.MAX_VALUE;
  int minIndex = -1;
  for(int i = 0 ; i < arr.length ; i ++)
  {
    if (arr[i] < minValue)
    {
      minIndex = i;
      minValue = arr[i];
    }
  }
  return minIndex;
}

int maxIndex(float[] arr)
{
  float maxValue = Float.MIN_VALUE;
  int maxIndex = -1;
  for (int i = 0 ; i < arr.length ; i ++)
  {
    if (arr[i] > maxValue)
    {
      maxValue = arr[i];
      maxIndex = i;
    }
  }
  
  
  maxValue = arr[0];
  for (int i = 1 ; i < arr.length ; i ++)
  {
    if (arr[i] > maxValue)
    {
      maxValue = arr[i];
      maxIndex = i;
    }
  }
  
  return maxIndex;
  
}


float[] rainFall = {45, 37, 55, 27, 38, 50, 79, 48, 104, 31, 100, 58};
String[] months = {"Jan", "Feb", "March", "April", "May"
  , "June", "July", "August", "Sept", "Oct", "Nov", "Dec" };

void draw()
{
  
}