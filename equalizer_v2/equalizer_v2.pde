import processing.sound.*;
import java.util.Arrays;

//CONFIG
final int bands = 1024;

FFT fft;
Sound sound;
AudioIn in;
float[] spectrum = new float[bands];

void setup() {
  size(1024, 512);
  frameRate(-1);
  //fullScreen();
  
  sound = new Sound(this);
  sound.inputDevice(4);
  
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  in.start();
  fft.input(in);
}

void draw() {
  background(255);
  rectMode(CENTER);
  fft.analyze(spectrum);
  float amplitude = 10e5;
  float[] visualSpectrum = Arrays.copyOfRange(spectrum, 0, 256);
  println(visualSpectrum[7]);
  for(int i = 0; i < visualSpectrum.length; i++) {
    rect(i*4, /*height/2-(visualSpectrum[i])*amplitude*/height/2, 3, sqrt(visualSpectrum[i])*0.02*amplitude);
  } 
}
