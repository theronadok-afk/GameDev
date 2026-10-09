class PowerUp {
  // member Variable
  int x, y, size, speed;
  color c1;
  char type;
  PImage r1;

  // Constructor
  PowerUp(int x, int y) {
    this.x = x;
    this.y = y;
    size = int(random(50,500));
    speed = int(random(1, 8));
    c1 = color(#bdbdbd);
    if (size > 150) {
      if (size < 300){
      type = 's';
      // t
      }
    } if (size > 300){
      type = 's';
      // h
    }
    if (size < 150) {
      type = 's';
    }
    
  }
  // Member Methods
  void display() {
    if (size > 100) {
      if (size < 300){
      fill(0,0,255);
      }
    } if (size > 300){
      fill(0,255,0);
    }
    if (size < 150) {
      fill(255,0,0);
    }
    ellipse(x, y, size,size);
    fill(255);
    textSize(20);
    text(type,x,y);
    
  }

  void move() {
    y = y+speed;
  }

  boolean isOffScreen() {
    if (y > height+510) {
      return true;
    } else {
      return false;
    }
  }
  boolean isHit(Ship s) {
    float d = dist(x,y,s.x,s.y);
    if(d<size) {
      return true;
    } else return false;
    
  }
}
