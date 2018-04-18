package ie.dit;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;

public class TuneIndex {
	static String driver = "org.sqlite.JDBC";
	String url = "jdbc:sqlite:tunes.sqlite";
	
	// static initialiser
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

	ArrayList<Tune> tunes = new ArrayList<Tune>();
	
	public Tune findClosest(String notes)
	{
		int minEd = Integer.MAX_VALUE;
		Tune closest = null;
		for(Tune t:tunes)
		{
			int ed = EditDistance.substringEditDistance(notes, t.getSearchKey());
			if (ed < minEd)
			{
				minEd = ed;
				closest = t;
			}
		}
		return closest;
	}
	
	public Tune[] findClosest(String transcription, int howMany)
	{
		ArrayList<Tune> matches = new ArrayList<Tune>();
		for(Tune t:tunes)
		{
			int ed = EditDistance.substringEditDistance(transcription, t.getSearchKey());
			t.setEd(ed);
			t.setConfidence(1.0f - (ed / (float) transcription.length()));
			matches.add(t);
		}
		Collections.sort(matches);
		Tune[] ret = new Tune[howMany];
		for(int i = 0 ; i < howMany ; i ++)
		{
			ret[i] = matches.get(i);
		}
		return ret;
	}
	
	public void loadTunes()
	{
		// ResultSet encapsulates the results of an sql query
		ResultSet rs;
		
		// Try with resources
		// Connetion encapsulates the database connection
		// PreparedStatement encapsulates the sqlk statement
		try(Connection c = DriverManager.getConnection(url);
				PreparedStatement ps = c.prepareStatement(
						"select * from tuneindex where source = ?"))
		{
			ps.setInt(1, 2); // Sets the ? parameter. Indexed from 1
			rs = ps.executeQuery(); // Executes the query
			while(rs.next()) // Iterates over the results
			{
				tunes.add(new Tune(rs));
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
	}
}
