package ie.dit;

import ddf.minim.AudioInput;
import ddf.minim.AudioSample;
import ddf.minim.Minim;
import ddf.minim.analysis.FFT;
import ddf.minim.analysis.WindowFunction;
import processing.core.PApplet;

public class TuneFinder1 extends PApplet {
	Minim minim;
	AudioSample audioInput;
	boolean lastPressed = false;

	static final int FRAME_SIZE = 2048;
	static final int SAMPLE_RATE = 44100;
	
	FFT fft;
	String transcription = "";
	public void settings()
	{
		size(FRAME_SIZE, 500);
	}

	public void setup() {
		minim = new Minim(this);
		fft = new FFT(FRAME_SIZE, SAMPLE_RATE);
		audioInput = minim.loadSample("../audio/scale.wav", FRAME_SIZE);
	}
	
	public void keyPressed()
	{
		audioInput.trigger();		
	}

	public void draw() {
		
		background(0);
		stroke(255);
		float mid = height / 2.0f;
		float average = 0;
		int count = 0;
		colorMode(HSB);
		fft.window(FFT.HAMMING);
		fft.forward(audioInput.left);
		int highestIndex = -1;
		float highest = Float.MIN_VALUE;
		for(int i = 0 ; i < fft.specSize() ; i ++)
		{
			stroke(
					map(i, 0, audioInput.bufferSize(), 0, 255)
					, 255
					, 255);
			line(i, 0, i, fft.getBand(i) * mid);
			if (fft.getBand(i) > highest)
			{
				highest = fft.getBand(i);
				highestIndex = i;
			}
		}
		
		float freq = fft.indexToFreq(highestIndex);
		
		for (int i = 1; i < audioInput.bufferSize(); i++) {
			stroke(
					map(i, 0, audioInput.bufferSize(), 0, 255)
					, 255
					, 255);
			line(i, mid, i, mid + audioInput.left.get(i) * mid);
			average += Math.abs(audioInput.left.get(i));

			if (audioInput.left.get(i - 1) > 0 && audioInput.left.get(i) <= 0) {
				count++;
			}

		}
		average /= audioInput.bufferSize();
		fill(200, 255, 255);
		noStroke();
		ellipse(width / 2, height / 2, average * mid, average * mid);
		float frequency = count * (SAMPLE_RATE / FRAME_SIZE);

		fill(255);
		PitchSpeller ps = new PitchSpeller();
		stroke(0, 255, 255);
		
		if (average > 0.001f) {
			text("Zero crossings Frequency: " + frequency + " " + ps.spell(frequency), 10, 10);
			text("FFT Frequency: " + freq + " " + ps.spell(freq), 10, 50);
			String note = ps.spell(freq);
			transcription += note;
		}
		text("Transcription: " + transcription, 10, 100);

	}

}
