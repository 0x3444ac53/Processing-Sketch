import java.util.*;
Random generator = new Random();
int number = 4;
Walker[] w = getArray(number);

class Walker {
  int x = int(random(2560));
  int y = int(random(1440));
  int hue = int(random(1, 255));
  int hueRate = int(random(60));
  int size;
  
  Walker(int size){
    this.size = size;
  }
  
  void display(){
      fill(hue % 256, 128, 255);
      circle(x, y, size);
      if (frameCount % hueRate == 0) hue++;
  }
  
  float[] getsteps(){
    float stepx, stepy;
    if(random(1) < 0.01) {
      stepx = random(-300, 300);
      stepy = random(-300, 300);
    } else {
      stepx = (float)generator.nextGaussian() * size/3 + random(0, 1);
      stepy = (float)generator.nextGaussian() * size/3 + random(0, 1);
    }
    float[] steps = {stepx, stepy};
    return steps;
  }
  void step(){
    float[] steps = getsteps();
    if(x + steps[0] < 0 || x + steps[0] > img.width) steps[0] = 0;
    if(y + steps[1] < 0 || y + steps[1] > img.height) steps[1] = 0;
    y += steps[1];
    x += steps[0];
}

void setup(){
  noStroke();
  colorMode(HSB);
  frameRate(120);
  size(2560, 1440);
  background(255);
}

Walker[] getArray(int number){
  Walker[] w = new Walker[number];
    for(int i = 0; i < w.length; i++){
      w[i] = new Walker(20);
    }
  return w;
}

void draw(){
  for(Walker walker : w){
    walker.step();
    walker.display();
  }
}
