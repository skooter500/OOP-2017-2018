package ie.dit;

public class Match implements Comparable<Match>
{
    String word;
    int ed;

    public String getWord()
    {
        return word;
    }

    public int getED()
    {
        return ed;
    }

    public Match(String word, int ed)
    {
        this.word = word;
        this.ed = ed;
    }

    public int compareTo(Match other)
    {
        return this.ed - other.ed;
    }


}