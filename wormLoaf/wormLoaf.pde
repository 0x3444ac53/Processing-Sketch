Walker[] walkers = getArray(2);
PImage img;

void setup(){
  size(1500, 1500);
  background(#F7EFDE);
  colorMode(HSB);
  noStroke();
  frameRate(30);
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
  int hue = int(random(256));
  int hueRate = int(random(1, 60));
  int size = 30;
  int index;
  float prevx;
  float prevy;
  float tincrement;
   
  Walker(int index){
    this.index = index;
    tincrement = random(0, 1);
    tx = random(-2000, 2000);
    ty = random(-2000, 2000);
    x = random(0, width);
    y = random(0, height);
  }
  
  void display(){
      fill(#f7efde);
      circle(prevx, prevy, size);
      fill(hue, 100, 255);
      println(frameCount);
      circle(x, y, 20);
      if(frameCount % hueRate == 0) hue--;
      //saveFrame("/home/ellie/Videos/WormLoaf/#######.tiff");
  }
  
  void step(){
    for(int i = 0; i < walkers.length; i++){
        x = map(noise(tx), 0, 1, 0, width);
        y = map(noise(ty), 0, 1, 0, height);
       if(index != i && (walkers[i].x == x || walkers[i].y == y)){
         i--;
         tx+=tincrement;
         ty+=tincrement;
       }
     }
    tx+=0.01;
    ty+=0.01;
  }
}

Walker[] getArray(int number){
  Walker[] walkers = new Walker[number];
  for(int i = 0; i < walkers.length; i++) walkers[i] = new Walker(i);
  return walkers;
}
