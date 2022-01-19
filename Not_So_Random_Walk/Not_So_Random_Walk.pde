int number = 1;

class Walker {
  int x = int(random(2560));
  int y = int(random(1440));
  int hue = int(random(255) + 1);
  int hueRate = int(random(60) + 1);
  void display(){
      fill(hue % 256, 128, 255);
      circle(x, y, 20);
      if (frameCount % hueRate == 0) hue++;
  }
  
  void step(){
    float r = random(1);
    if (r < 0.4){
      x++;
    } else if (r < 0.6){
      x--;
    } else if (r < 0.8){
      y++;
    } else {
      y--;
    }
  }
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
      w[i] = new Walker();
    }
  return w;
}

void draw(){
  for(Walker walker : w){
    walker.step();
    walker.display();
  }
}

Walker[] w = getArray(number);
