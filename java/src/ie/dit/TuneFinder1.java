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
	
	public void settings()
	{
		size(FRAME_SIZE, 500);
	}

	public void setup() {
		minim = new Minim(this);
		audioInput = minim.loadSample("../audio/A.wav", FRAME_SIZE);
	}

	public void draw() {
		if (keyPressed && key == ' ' && !lastPressed) {
			audioInput.trigger();
			lastPressed = true;
		} else {
			lastPressed = false;
		}
		background(0);
		stroke(255);
		float mid = height / 2.0f;
		float average = 0;
		int count = 0;
		for (int i = 1; i < audioInput.bufferSize(); i++) {
			line(i, mid, i, mid + audioInput.left.get(i) * mid);
			average += Math.abs(audioInput.left.get(i));

			if (audioInput.left.get(i - 1) > 0 && audioInput.left.get(i) <= 0) {
				count++;
			}

		}
		average /= audioInput.bufferSize();

		float frequency = count * (SAMPLE_RATE / FRAME_SIZE);

		fill(255);

		stroke(0, 255, 255);
		int maxIndex = -1;
		float maxEnergy = Float.MIN_VALUE;

		if (average > 0.001f) {
			text("Zero crossings Frequency: " + frequency, 10, 10);
		}
	}

}
