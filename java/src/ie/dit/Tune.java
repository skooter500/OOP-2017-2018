package ie.dit;

import java.sql.ResultSet;
import java.sql.SQLException;

public class Tune implements Comparable<Tune> {
	private String title;
	private int x;
	private int source;
	private String keySig;
	private String searchKey;
	
	private int ed;
	
	private float confidence;
	
	
	public float getConfidence() {
		return confidence;
	}

	public void setConfidence(float confidence) {
		this.confidence = confidence;
	}

	public int getEd() {
		return ed;
	}

	public void setEd(int ed) {
		this.ed = ed;
	}

	public Tune(ResultSet rs) throws SQLException
	{
		title = rs.getString("title");
		source = rs.getInt("source");
		keySig = rs.getString("key_sig");
		searchKey = rs.getString("search_key");
		x = rs.getInt("x");
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getX() {
		return x;
	}
	public void setX(int x) {
		this.x = x;
	}
	public int getSource() {
		return source;
	}
	public void setSource(int source) {
		this.source = source;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getKeySig() {
		return keySig;
	}
	public void setKeySig(String keySig) {
		this.keySig = keySig;
	}
	
	public String toString()
	{
		
		return confidence
				+ ", " + x 
				+ ", " + title 
				+ ", " + source
				+ ", " + keySig
				+ ", " + searchKey;
	}

	@Override
	public int compareTo(Tune o) {
		return ed - o.ed;
	}	
}
