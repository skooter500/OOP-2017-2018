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

    private void loadSignal() throws UnsupportedAudioFileException, IOException, LineUnavailableException
    {
        audioInputStream = null;
        audioInputStream = AudioSystem.getAudioInputStream(new File(fileName));     
        
        Clip clip = AudioSystem.getClip();
        clip.open(audioInputStream);
        clip.start(); 
        
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
    public void paint(Graphics g) 
    {               
        super.paint(g);

        

        g.setColor(Color.black);        
        g.fillRect(0, 0, w, h);
        g.setColor(Color.white);
        g.drawLine(10, 10, 100, 100);
        /*
        Graphics2D g2 = (Graphics2D) g;           
        Dimension bounds = parent.getGraphPanel().getSize(); 
        */
    }

}