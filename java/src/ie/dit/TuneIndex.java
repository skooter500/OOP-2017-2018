package ie.dit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TuneIndex {
	static String driver = "org.sqlite.JDBC";
	String url = "jdbc:sqlite:tunes.sqlite";
	
	static
	{
		try
		{
			Class.forName(driver);
		}
		catch (ClassNotFoundException e)
		{
			e.printStackTrace();
		}
	}
	
	public ArrayList<Tune> tunes = new ArrayList<Tune>();
	
	public void printTunes(ArrayList<Tune> tunes)
	{
		for(Tune t:tunes)
		{
			System.out.println(t);
		}
	}
	
	public Tune findClosest(String notes)
	{
		float closestEd = Float.MAX_VALUE;
		Tune closest = null;
		for(Tune t:tunes)
		{
			float ed = EditDistance.substringEditDistance(notes, t.getSearchKey());
			if (ed < closestEd)
			{
				closestEd = ed;
				closest = t;
			}
		}
		return closest;
	}
	
	void loadTunes(int source)
	{
		ResultSet rs;
		tunes.clear();
		try(Connection c = DriverManager.getConnection(url);
				PreparedStatement ps = c.prepareStatement("select * from tuneindex where source = ?"))
		{
			
			ps.setInt(1, source);
			
			rs = ps.executeQuery();
			while(rs.next())
			{
				Tune tune = new Tune(rs);
				tunes.add(tune);
				System.out.println(tune);
			}			
		}
		catch(SQLException e)
		{
			System.out.println("SQL Exception");
			e.printStackTrace();
		}
		
	}
	
	void loadTunes(String title)
	{
		ResultSet rs;
		tunes.clear();
		try(Connection c = DriverManager.getConnection(url);
				PreparedStatement ps = c.prepareStatement("select * from tuneindex where title like ?"))
		{
			
			ps.setString(1, "%" + title + "%");
			
			rs = ps.executeQuery();
			while(rs.next())
			{
				Tune tune = new Tune(rs);
				tunes.add(tune);
			}			
		}
		catch(SQLException e)
		{
			System.out.println("SQL Exception");
			e.printStackTrace();
		}		
	}
	
	void loadTunes()
	{
		Connection c = null;
		PreparedStatement ps = null;
		ResultSet rs;
		tunes.clear();
		try
		{
			Class.forName(driver);
			c = DriverManager.getConnection(url);
			ps = c.prepareStatement("select * from tuneindex");			
			rs = ps.executeQuery();
			while(rs.next())
			{
				Tune tune = new Tune(rs);
				tunes.add(tune);
			}			
		}
		catch(ClassNotFoundException e)
		{
			System.out.println("Driver not found");
			e.printStackTrace();
		}
		catch(SQLException e)
		{
			System.out.println("SQL Exception");
			e.printStackTrace();
		}
		finally
		{
			try
			{
				c.close();			
			}
			catch(SQLException e)
			{
			}
			
			try
			{
				ps.close();
			}
			catch(Exception e)
			{
			}
		}		
	}

}
