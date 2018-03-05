package ie.dit;

import javax.swing.*;
import java.awt.*;
import javax.sound.sampled.*;
import java.io.*;

public class TuneFinder extends JFrame
{

    int w = 500, h = 500;

    String fileName = "../audio/scale.wav";

    AudioInputStream audioInputStream;

    private void log(String message)
    {
        System.out.println(message);
    }

    byte[] audioData;
    float[] signal;
    int sampleRate;
    int numSamples;

    float min = 0, max = 0;

    private void loadSignal() throws UnsupportedAudioFileException, IOException, LineUnavailableException
    {
        audioInputStream = null;
        audioInputStream = AudioSystem.getAudioInputStream(new File(fileName));     
        
        //Clip clip = AudioSystem.getClip();
        //clip.open(audioInputStream);
        //clip.start(); 
        
        AudioFormat	format = audioInputStream.getFormat();
        numSamples = (int) audioInputStream.getFrameLength();
        log("Length of the stream in samples: " + numSamples);            
        log("Loading the signal...");
        
        audioData = new byte[(int) numSamples * 2];    
        signal = new float[numSamples];
        audioInputStream.read(audioData, 0, (int) numSamples * 2);
        sampleRate = (int) format.getSampleRate();

        boolean bigEndian = format.isBigEndian();                                 
        for (int signalIndex = 0 ; signalIndex < numSamples; signalIndex ++)
        {
            signal[signalIndex] = ((audioData[(signalIndex * 2) + 1] << 8) + audioData[signalIndex * 2]);            
            //System.out.println(signal[signalIndex]);
            if (signal[signalIndex] < min)
            {
                min = signal[signalIndex];
            }
            if (signal[signalIndex] > max)
            {
                max = signal[signalIndex];
            }            
        }
    }

    public TuneFinder()
    {
        super();
        setSize(500, 500);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        try
        {
            loadSignal();
        }
        catch (UnsupportedAudioFileException e)
        {
            e.printStackTrace();
        }
        catch(IOException e)
        {
            e.printStackTrace();
        }
        catch(LineUnavailableException e)
        {
            e.printStackTrace();
        }
    }
    
    float map(float a, float b, float c, float d, float e)
    {
      float range1 = c - b;
      float howFar1 = (a-b) / range1; 
      float range2 = e - d;
      float howFar2 = d + howFar1 * range2;
      return howFar2;
    }
    
    public void paint(Graphics g) 
    {               
        super.paint(g);
      
        g.setColor(Color.black);        
        g.fillRect(0, 0, w, h);
        g.setColor(Color.white);
        for(int i = 0 ; i < 500 ; i ++)
        {
            g.drawLine(i, 250, i, (int) (250 + (signal[i])));
        }
        /*
        Graphics2D g2 = (Graphics2D) g;           
        Dimension bounds = parent.getGraphPanel().getSize(); 
        */
    }

}