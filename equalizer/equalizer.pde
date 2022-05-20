import processing.sound.*;
//CONFIG
int bands = 4096;

//VAR INIT
FFT fft;
Sound sound;
AudioIn in;
int displayCount;
int dHeight;
int divider = 4;
int channels;
int channelOffset;
float amp;
float bgCurrentColor = 0;
float[] spectrum = new float[bands];
float[] visual;

void setup() {
  //size(2340, 1080);
  fullScreen();
  displayCount = width/divider;
  visual = new float[displayCount];
  dHeight = height;
  background(0);  
  
  sound = new Sound(this);
  sound.inputDevice(4);
  
  fft = new FFT(this, bands);
  in = new AudioIn(this, 0);
  in.start();
  fft.input(in);
}
    
void draw() {
  
  fft.analyze(spectrum);
  colorMode(HSB);
  fill(0);
  visual = smooth(rootSmooth(cut(spectrum, displayCount)), 0.3, 10);
  
  background(bgCurrentColor, 100, 40+3*getMaxValue(visual));
  bgCurrentColor = (bgCurrentColor+getMaxValue(visual)*0.2)%360;
  
  amp = (1/getMaxValue(visual))*0.9;
  for(int i = 0; i < displayCount; i++){
    rect(i*divider,0,divider,30+((dHeight/2))*visual[i]*amp);
    rect(i*divider,dHeight-30-(dHeight/2-30)*visual[i]*amp,divider,(dHeight/2)*visual[i]*amp+60);
  } 
}

float getMaxValue(float[] f) {
  float r = 0;
  for(int i = 1; i < f.length; i++){
    if (f[i] > r) {
      r = f[i];
    }
  }
  return r;
}

float[] cut(float[] F, int cut) {
  float[] f = new float[cut];
  for(int i = 0; i < f.length; i++) {
    f[i] = F[i];
  }
  return f;
}

float[] rootSmooth(float[] F) {
  float[] f = new float[F.length];
  for(int i = 0; i < F.length; i++) {
    f[i] = sqrt(F[i])*100;
  }
  return f;
}

float[] smooth(float[] F, float blur, int runs) {
  float[] f = new float[F.length];
  for(int j = 0; j < runs; j++) {
      f[0] = F[0]*(1-blur)+F[1]*(blur/2);
      f[f.length-1] = F[f.length-1]*(1-blur)+F[f.length-1]*(blur/2);
      for (int i = 1; i < f.length-1; i++) {
        f[i] = F[i]*(1-blur)+F[i+1]*(blur/2)+F[i-1]*(blur/2);
      }
    F = f;
  }
  return f;
}
