package ie.dit;

public class Matrix
{
	private float[][] elements;
	
	private int rows;
	private int cols;
	
	public int getRows()
	{
		return rows;
	}
	
	public int getCols()
	{
		return cols;
	}
	
	public Matrix(int rows, int cols)
	{
		this.rows = rows;
		this.cols = cols;
		elements = new float[rows][cols];
	}
	
	public void setElement(int row, int col, float value)
	{
		elements[row][col] = value;
	}
	
	public float getElement(int row, int col)
	{
		return elements[row][col];
	}
	
	public void add(Matrix b)
	{
		for (int row = 0 ; row < rows ; row ++)
		{
			for (int col = 0 ; col < cols ; col ++)
			{
				elements[row][col] += b.elements[row][col];
				
				// This will also work!
				//setElement(row, col, getElement(row, col) 
				//		+ b.getElement(row, col));
			}
		}
	}

	public static Matrix translation(float x, float y)
	{
		Matrix m = new Matrix(3, 3);
		m.identity();
		m.setElement(0, 2, x);
		m.setElement(1, 2, y);
		return m;
	}

	public static Matrix scaling(float sx, float sy)
	{
		Matrix m = new Matrix(3, 3);
		m.identity();
		m.setElement(0, 0, sx);
		m.setElement(1, 1, sy);
		return m;
	}

	public Vector transform(ie.dit.Vector v) throws MatrixException
	{
		Matrix m = new Matrix(3, 1);
		m.setElement(0, 0, v.x);
		m.setElement(1, 0, v.y);
		m.setElement(2, 0, 1);

		Matrix out = Matrix.mult(this, m);
		return new Vector(out.getElement(0, 0)
			, out.getElement(1, 0));		
	}

	
		
	
	// This method applies to the class Matrix
	// Not an instance of the class
	public static Matrix add(Matrix a, Matrix b) throws MatrixException
	{
		if (a.rows != b.rows || a.cols != b.cols)
		{
			throw new MatrixException("Cannot add these matrices");
		}
		Matrix ret = new Matrix(a.getRows(), a.getCols());
		
		for (int row = 0 ; row < a.rows; row ++)
		{
			for (int col = 0 ; col < a.cols ; col ++)
			{
				ret.elements[row][col] = 
					a.elements[row][col]
					+ b.elements[row][col];
					
			}
		}			
		return ret;		
	}
	
	
	
	public void identity()
	{
		for(int row = 0 ; row < getRows() ; row ++)
		{
			for (int col = 0 ; col < cols ; col ++)
			{
				if (row == col)
				{
					setElement(row, col, 1);
				}
				else
				{
					setElement(row, col, 0);
				}									
			}
		}
	}
	
	public static Matrix mult(Matrix a, Matrix b) throws MatrixException
	{
		if (a.getCols() != b.getRows())
		{
			throw 
				new MatrixException("Can't multiply these matrices");

		}
		Matrix c = new Matrix(a.getRows(), b.getCols());

		for (int row = 0; row < a.getRows(); row++)
		{
			for (int col = 0; col < b.getCols(); col++)
			{
				float sum = 0.0f;
				for (int i = 0; i < a.getCols(); i++)
				{
					sum += a.getElement(row, i) * b.getElement(i, col);
				}
				c.setElement(row, col, sum);
			}
		}
		return c;
	}
	
	public void mult(Matrix b)
	{
		for (int row = 0; row < getRows(); row++)
		{
			for (int col = 0; col < b.getCols(); col++)
			{
				float sum = 0.0f;
				for (int i = 0; i < getCols(); i++)
				{
					sum += getElement(row, i) * b.getElement(i, col);
				}
				setElement(row, col, sum);
			}
		}
	}
	
	
	public String toString()
	{
		StringBuffer sb = new StringBuffer();
		
		for (int row = 0 ; row < this.rows ; row ++)
		{
			for (int col = 0 ; col < this.cols ; col ++)
			{
				sb.append(elements[row][col]);
				sb.append("\t");
			}
			sb.append("\n");
		}
		return sb.toString();
	}
}