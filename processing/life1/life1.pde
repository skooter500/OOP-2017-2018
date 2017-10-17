void setup()
{
  size(500, 500);
  
  board = new Board(50);
}

Board board;
void draw()
{
  background(0);
  board.render();
}