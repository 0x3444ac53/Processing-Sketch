import java.util.*;
int[] randomCounts;
int size = 200;

void setup() {
  size(2000,1000);
  frameRate(300);
  randomCounts = new int[size];
}

float monteCarlo(){
  while(true){
    float r1 = random(1);
    float probability = r1;
    float r2 = random(1);
    if( r2 < probability) return r1;
  }
}

float gaussian(int mean, int sd){
  Random generator = new Random();
  return (float)(generator.nextGaussian() * sd + mean);
}

void draw() {
  background(255);
  int index = int(noise(gaussian(4, 1))*size); //random function goes here
  randomCounts[index]++;
  stroke(0);
  fill(175);
  int w = width/randomCounts.length;
  for (int x = 0; x < randomCounts.length; x++) {
    rect(x*w,height-randomCounts[x],w-1,randomCounts[x]);
  }
}
