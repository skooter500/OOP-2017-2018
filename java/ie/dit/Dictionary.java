package ie.dit;

import java.io.IOException;
import java.io.FileReader;
import java.util.ArrayList;
import java.io.BufferedReader;


public class Dictionary
{
    ArrayList<String> words = new ArrayList<String>();

    public Dictionary()
    {
        loadDictionary();
    }

    public String toString()
    {
        StringBuffer sb = new StringBuffer();
        for(String word:words)
        {
            sb.append(word + ", ");
        }

        return sb.toString();

        /*
        String s = "";
        for(String word:words)
        {
            s += word + ", ";
        }

        return s;
        */
    }

    public String findClosest(String word)
    {
        int closestEd = Integer.MAX_VALUE;
        String closestWord = ""; 
        for(String w:words)
        {
            int ed = EditDistance.MinimumEditDistance(word, w);
            if (ed == 0)
            {
                return word;
            }
            if (ed < closestEd)
            {
                closestEd = ed;
                closestWord = w;
            }
        }
        return closestWord;
    }

    public void loadDictionary()
    {
        BufferedReader inputStream = null;

        try {
            inputStream = new BufferedReader(new FileReader("words.txt"));
            
            String l;
            while ((l = inputStream.readLine()) != null) {
                words.add(l);
            }
        }
        catch (IOException e)
        {
            e.printStackTrace();
        } 
        finally 
        {
            if (inputStream != null) {
                try
                {
                    inputStream.close();
                }
                catch(Exception e)
                {
                    e.printStackTrace();
                }
            }
        }
    }
}
