import java.util.*;
Random generator;
float mean = 0;

class SplatterPoint{
  float x;
  float y;
  float sdx;
  float sdy;
  
  SplatterPoint(float x, float y, float sdx, float sdy){
    this.x = x;
    this.y = y;
    this.sdx = sdx;
    this.sdy = sdy;
  }
  void splat(){
    //fill(((float) generator.nextGaussian() * 100 + 200), 128, 255);
    rectMode(RADIUS);
    fill(255, 10);
    rect((float) generator.nextGaussian() * this.sdx + this.x, (float) generator.nextGaussian() * this.sdy + this.y, (float) generator.nextGaussian() * 30 + 10, (float) generator.nextGaussian() * 30 + 10);
  }
  
}

SplatterPoint[] s = {
new SplatterPoint(550, 200, 150, 25),
new SplatterPoint(200, 700, 30, 200),
new SplatterPoint(550, 700, 150, 25),
new SplatterPoint(550, 1100, 150, 25),
};

void setup() {
  size(2000, 2000);
  generator = new Random();
  noStroke();
  //colorMode(HSB);
  background(#030303);
}

void draw(){
  for(int i = 0; i < s.length; i++){
    s[i].splat();    
  }
}
