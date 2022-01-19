import java.util.*;
int number = 2;
Random generator = new Random();
PImage img;

class Walker {
  int x = int(random(2000));
  int y = int(random(2000));
  int counter = 0;
  int size = 200;
  int index;
  
  Walker(int index){
    this.index = index;
  }
  
  void display(){
      fill(color(img.get(this.x, this.y)));
      circle(x, y, size);
  }
  
  float[] getsteps(){
    float stepx, stepy;
    counter--;
    if(counter < 0 && size > 1 && frameCount % 2000 == 0){
      size--;
    }
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
    if(size > 5){
      float[][] pos = new float[w.length][2];
      for(int i = 0; i < pos.length ; i++){
        pos[i][0] = w[i].x;
        pos[i][1] = w[i].y;
      }
      float[] steps = getsteps();
      for(float[] otherPos : pos){
        if(otherPos[0] == steps[0] || otherPos[1] == steps[1]) steps = getsteps();
      }
      if(x + steps[0] < 0 || x + steps[0] > img.width) steps[0] = 0;
      if(y + steps[1] < 0 || y + steps[1] > img.height) steps[1] = 0;
      y += steps[1];
      x += steps[0];
    } else {
      x = (x + 1+index) % img.width;
      y = (y + 1+index) % img.height;
      if(size > 1 && frameCount % 1000 == 0){
        size--;
      }
    }
  }
}

void setup(){
  size(2000, 2000);
  img = loadImage("/home/ellie/Videos/jj.jpg");
  img.resize(2000, 2000);
  imageMode(CENTER);
  noStroke();
  background(255);
  noStroke();
  colorMode(HSB);
  frameRate(30);
}

Walker[] getArray(int number){
  Walker[] w = new Walker[number];
    for(int i = 0; i < w.length; i++){
      w[i] = new Walker(i);
    }
  return w;
}

void draw(){
  for(int walker = 0; walker<w.length; walker++){
    w[walker].step();
    w[walker].display();
    println(frameCount);
  }
  //saveFrame("/home/ellie/Videos/wetWindow2/#########.tif");
}

Walker[] w = getArray(number);
