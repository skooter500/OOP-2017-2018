package ie.dit;

public class EditDistance
{

    private static float min3(float a, float b, float c)
    {
        //return Math.min(Math.min(a, b), c);
        if ((a < b) && (a < c))
        {
            return a;
        }
        else if ((b < a) && (b < c)) 
        {
            return b;
        }
        else
        {
            return c;
        }
    }

    public static int minimumEditDistance(String a, String b)
    {
        int rows = a.length() + 1;
        int cols = b.length() + 1;
        Matrix m = new Matrix(rows, cols);

        for (int row = 0 ; row < rows ; row ++)
        {
            m.setElement(row, 0, row);
        }

        for (int col = 0 ; col < cols ; col ++)
        {
            m.setElement(0, col, col);
        }

        for(int row = 1; row < rows ; row ++)
        {
            for (int col = 1 ; col < cols; col++)
            {
                if (a.charAt(row - 1) == b.charAt(col - 1))
                {
                    m.setElement(row, col
                        , m.getElement(row - 1, col -1));
                }
                else
                {
                    float min = min3(
                        m.getElement(row - 1, col)
                        , m.getElement(row - 1, col -1)
                        , m.getElement(row, col - 1)
                    );
                    m.setElement(row, col, min + 1);
                }
            }
        }
        System.out.println(m);
        return (int) m.getElement(rows - 1, cols - 1);
    }
    
    public static int substringEditDistance(String a, String b)
    {
        int rows = a.length() + 1;
        int cols = b.length() + 1;
        Matrix m = new Matrix(rows, cols);

        for (int row = 0 ; row < rows ; row ++)
        {
            m.setElement(row, 0, row);
        }

        for (int col = 0 ; col < cols ; col ++)
        {
            m.setElement(0, col, 0);
        }

        for(int row = 1; row < rows ; row ++)
        {
            for (int col = 1 ; col < cols; col++)
            {
                if (a.charAt(row - 1) == b.charAt(col - 1))
                {
                    m.setElement(row, col
                        , m.getElement(row - 1, col -1));
                }
                else
                {
                    float min = min3(
                        m.getElement(row - 1, col)
                        , m.getElement(row - 1, col -1)
                        , m.getElement(row, col - 1)
                    );
                    m.setElement(row, col, min + 1);
                }
            }
        }
        float min = Float.MAX_VALUE;
        for(int col = 0 ; col < cols ; col ++)
        {
        	float element = m.getElement(rows - 1, col);
        	if (element < min)
        	{
        		min = element;
        	}
        }
        return (int)min;
    }

}