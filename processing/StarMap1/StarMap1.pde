void setup()
{
  size(500, 500);
  
  loadData();
}

void drawGrid()
{
  
  /*
  // A solution that doesnt use map
  float border = width * 0.1f;
  float drawable = width * 0.8f;
  float gap = drawable / 10.0f;
  textAlign(CENTER, CENTER);
  fill(0);
  float pos = border;
  for(int xg = -5 ; xg <= 5 ; xg ++)
  {
    text(xg, pos, border * 0.5);
    text(xg, border * 0.5, pos);
    
    line(pos, border, pos, height - border);
    line(border, pos, width - border, pos);   
    pos += gap;
  }
  */
  
  
  // A better solution that uses map!
  // https://processing.org/reference/map_.html
  float border = width * 0.1f;
  textAlign(CENTER, CENTER);
  for(int xg = -5 ; xg <= 5 ; xg ++)
  {
    float pos = map(xg, -5, 5, border, width - border); 
    text(xg, pos, border * 0.5);
    text(xg, border * 0.5, pos);
    
    line(pos, border, pos, height - border);
    line(border, pos, width - border, pos);   
  }  
}

void loadData()
{
  // Check out 
  // https://processing.org/reference/loadTable_.html
  // Make sure the file is in the data folder of the sketch
  Table table = loadTable("HabHYG15ly.csv", "header");
  
  // Table.rows() returns all the table rows
  // We can iterate over all the rows using a for each loop
  for(TableRow r:table.rows())
  {
    // Create a new star object from each of the rows
    // By passing the TableRow into the Star constructor
    Star star = new Star(r);
    // Add the new Star object to the stars ArrayList
    stars.add(star);
  }
  
  // Iterate over the stars ArrayList
  for(Star s:stars)
  {
    println(s.displayName);
  }
  
  // Iterate over the stars arraylist using a standard for loop
  // stars.size() returns the number of elements in the ArrayList
  for(int i = 0 ; i < stars.size() ; i ++)
  {
    Star s = stars.get(i);
    println(s.displayName);
  }
}

// An ArrayList is similar to an array, but it can grow and shrink in size
// as you add and remove elements
// The <Star> means the ArrayList is for holding objects of type Star
ArrayList<Star> stars = new ArrayList<Star>(); 

void draw()
{
  background(0);
  stroke(0, 255, 0);
  fill(255);
  drawGrid();
}