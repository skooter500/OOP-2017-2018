void setup()
{
  size(800, 800);
  
  loadData();
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
  
}