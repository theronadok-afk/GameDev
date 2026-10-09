class Rock {
  // member Variable
  int x, y, w, h, health, hitPoints, speed;
  color c1, c2, c3;
  PImage r1;

  // Constructor
  Rock(int x, int y) {
    this.x = x;
    this.y = y;
    w = int(random(30, 100));
    h = int(random(30, 100));
    health = 100;
    speed = int(random(1, 15));
    if(random(2)>1) {
      r1 = loadImage("Rock1.png");
    }else {
      r1 = loadImage("Rock2.png");
    }
    // make proportional to player health
    hitPoints = 100;
    c1 = color(#bdbdbd);
    c2 = color(#98a398);
    c3 = color(#586958);
    
  }
  // Member Methods
  void display() {
    if (health > 50) {
      fill(c2);
    } else {
      fill(c1);
    }
   r1.resize(w,w);
   image(r1,x,y);
  }

  void move() {
    y = y+speed;
  }
  

  boolean isOffScreen() {
    if (y > height+110) {
      return true;
    } else {
      return false;
    }
  }
  
  boolean isHit(Ship s) {
    float d = dist(x,y,s.x,s.y);
    if(d<w) {
      return true;
    } else return false;
    
  }
}
