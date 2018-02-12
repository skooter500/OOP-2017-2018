package ie.dit;

public class Main
{
	void matrixMultiplication()
	{
		Matrix a = new Matrix(4, 4);
		a.identity();
		a.setElement(2, 3, 7);
		a.setElement(3, 1, 2);
		a.setElement(3, 0, 4);

		Matrix b = new Matrix(4, 4);
		b.identity();
		b.setElement(2, 3, 1);
		b.setElement(3, 1, 9);
		b.setElement(3, 0, -7);

		a.mult(b); // Add b to a. This is like a+= b;

		Matrix c;
		// Add b to a, without changing a. Instead create a new matrix and return it
		// This is like c = a + b
		c = Matrix.mult(a, b); // How to call a static method

		System.out.println(a);
		System.out.println(b);
		System.out.println(c);
	}

	public void editDistance()
	{
		String sa = "I love DIT";
		String sb = "I love Tunepal";
		System.out.println("Edit distance between: " + sa + " and: " + sb + " is " + EditDistance.MinimumEditDistance(sa, sb));

		sa = "Games Fleadh";
		sb = "Imagine Cup";
		System.out.println("Edit distance between: " + sa + " and: " + sb + " is " + EditDistance.MinimumEditDistance(sa, sb));

	}

	public static void main(String[] args)
	{
		Main main = new Main();
		main.matrixMultiplication();
		main.editDistance();
	}
}