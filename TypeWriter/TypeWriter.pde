class TypeWriter{
  String s;
  int mod;
  int index = 0;
  int x, y;
  int size = 25;
  
  TypeWriter(String s, int x, int y, int mod){
    this.x = x;
    this.y = y;
    this.s = s;
    this.mod = mod;
  }
  
  void display() {
    
    if(index < s.length() && frameCount % mod == 0){
    if(s.charAt(index) == '\n') y += size;
    fill(#030303);
    textSize(size);
    text(s.charAt(index), x + index*this.size, y);
    index++;
    }
  }
}

TypeWriter t = new TypeWriter("ArtARTARTARTARTARTART", 0, 30, 5);

void setup(){
  frameRate(30);
  size(1280, 720);
  background(#F4F4F4);
}

void draw(){
  t.display();
}
