Walker[] walkers = getArray(56);

void setup(){
  size(1500, 1500);
  background(#F7EFDE);
  colorMode(HSB);
  noStroke();
}

void draw(){
  for( Walker walker : walkers){
    walker.step();
    walker.display();
  }
}

class Walker {
  float x, y;
  float tx, ty;
  int hue = 65;
  int hueRate = int(random(0, 60));
  int size = 20;
   
  Walker(){
    tx = random(0, 1);
    ty = random(0, 3);
    x = random(0, width);
    y = random(0, height);
  }
  
  void display(){
      fill(hue % 256, 128, 255);
      circle(x, y, size);
      if (frameCount % hueRate == 0) hue++;
      //saveFrame("/home/ellie/Videos/WormLoaf/#######.tiff");
  }
  
  void step(){
  x = map(noise(tx), 0, 1, 0, width);
  y = map(noise(ty), 0, 1, 0, height);
  circle(x, y, 30);
  tx+=0.01;
  ty+=0.01;
  }
}

Walker[] getArray(int number){
  Walker[] walkers = new Walker[number];
  for(int i = 0; i < walkers.length; i++) walkers[i] = new Walker();
  return walkers;
}
