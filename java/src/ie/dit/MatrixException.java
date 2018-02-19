package ie.dit;

public class MatrixException extends Exception
{
    private String message;
    public MatrixException(String message)
    {
        this.message = message;
    }

    public String toString()
    {
        return message;
    }
}