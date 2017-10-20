class Board
{
  boolean[][] current;
  boolean[][] next;
  
  int size;
  
  float cellSize;
  
  Board(int size)
  {
    this.size = size;
    current = new boolean[size][size];
    next = new boolean[size][size];
    cellSize = width / (float) size;
    randomise();
  }
  
  void render()
  {
    for(int row = 0 ; row < size ; row ++)
    {
      for (int col = 0 ; col < size ; col ++)
      {
        if (current[row][col])
        {
          fill(0, 255, 0);
        }
        else
        {
          fill(0);
        }
        float x = map(col, 0, size, 0, width);
        float y = map(row, 0, size, 0, height);
        rect(x, y, cellSize - 1, cellSize - 1);
      }
    }
  }
  
  void randomise()
  {
    for(int row = 0 ; row < size ; row ++)
    {
      for (int col = 0 ; col < size ; col ++)
      {
        int dice = (int) random(0, 2);
        /*if (dice == 1)
        {
          current[row][col] = true;
        }
        */
        current[row][col] = (dice == 1);
      }
    }
  }
  
  // Methods for you guys to implement! 
  // Return true if the cell at row and col is true
  // Do bounds checking in this method to make sure row and col
  // Have valid ranges
  boolean isAlive(int row, int col)
  {
    if (row < 0 || row >= size || col < 0 || col >= size)
    {
      return false;
    }
    else
    {
      return current[row][col];
    }
  }
  
  // Count the number of live cells around row and col
  // and return it
  // You can use the method above
  // This could be a nested loop
  int countLiveCellsAround(int row, int col)
  {
    int count = 0;
    for(int r = row - 1 ; r <= row + 1 ; r ++)
    {
      for(int c = col - 1 ; c <= col + 1 ; c ++)
      {
        if (! (r == row && c == col) && isAlive(r, c))
        {
          count ++;
        }
      }
    }
    return count;
  }
  
  // This method should apply the rules to each cell
  // Dont forget to use the current board to do the calculations
  // but update the next board
  // Then swap them
  // Also dont forget to call this method from draw() in the main sketch
  void update()
  {
    for(int row = 0 ; row < size ; row ++)
    {
      for (int col = 0 ; col < size ; col ++)
      {
        int count = countLiveCellsAround(row, col);
        if (current[row][col])
        {
          if (count == 2 || count == 3)
          {
            next[row][col] = true;
          }
          else
          {
            next[row][col] = false;
          }
        }
        else
        {
          if (count == 3)
          {
            next[row][col] = true;
          }
          else
          {
            next[row][col] = false;
          }
        }
      }
    }
    
    boolean[][] temp;
    temp = current;
    current = next;
    next = temp;
    
  }
  
}