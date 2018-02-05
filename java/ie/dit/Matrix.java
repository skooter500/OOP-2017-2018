package ie.dit;

public class Matrix
{
	private int rows;
	private int cols;
	
	private float[][] elements;
	
	// Accessor
	public int getRows()
	{
		return rows;
	}
	public int getCols()
	{
		return cols;
	}
	
	public void setElement(int row, int col, float val)
	{
		elements[row][col] = val;
	}
	
	public float getElement(int row, int col)
	{
		return elements[row][col];
	}
	
	public Matrix(int rows, int cols)
	{
		this.rows = rows;
		this.cols = cols;
		elements = new float[rows][cols];
	}
	
	public void identity()
	{
		for(int row = 0 ; row < rows ; row ++)
		{
			for(int col = 0 ; col < cols ; col ++)
			{
				elements[row][col] = (row == col) ? 1 : 0;
			}
		}
	}
	
	public String toString()
	{
		String ret = "";
		for(int row = 0 ; row < rows ; row ++)
		{
			for(int col = 0 ; col < cols ; col ++)
			{
				ret += elements[row][col] + "\t";
			}
			ret += "\n";
		}
		return ret;
	}
	
	public void add(Matrix m)
	{
		for(int row = 0 ; row < rows ; row ++)
		{
			for(int col = 0 ; col < cols ; col++)
			{
				this.elements[row][col] += m.elements[row][col];
			}
		}
	}
	
	public static Matrix add(Matrix a, Matrix b)
	{
		Matrix m = new Matrix(a.rows, a.cols);

		for(int row = 0 ; row < a.rows ; row ++)
		{
			for(int col = 0 ; col < a.cols ; col++)
			{
				m.elements[row][col] = a.elements[row][col] 
					+ b.elements[row][col]; 
			}
		}
		return m;
	}

	public void mult(Matrix a)
	{
		for(int row = 0; row < this.rows ; row ++)
		{
			for(int col = 0 ; col < a.cols ; col ++)
			{
				float sum = 0;
				for(int i = 0 ; i < cols ; i ++)
				{
					sum += a.elements[row][i] * b.elements[i][col];
				}
				elements[row][col] = sum;
			}
		}
	}

	public static Matrix mult(Matrix a, Matrix b)
	{
		Matrix c = new Matrix(a.rows, b.cols);
		for(int row = 0; row < a.rows ; row ++)
		{
			for(int col = 0 ; col < b.cols ; col ++)
			{
				for(int i = 0 ; i < a.cols ; i ++)
				{
					c.elements[row][col] += a.elements[row][i] * b.elements[i][col];
				}
			}
		}
		return c;
	}
	
}