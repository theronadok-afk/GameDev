class Boss {
  int x, y, size, duration, health, speed, lvl;
  boolean isHit;
  PImage b1;

  Boss(int x, int y, int lvl) {
    this.x = x;
    this.y = y;
    this.lvl = lvl;
    size = 250;
    duration = 20000;
    health = 10000;
    speed = 5;
    isHit = false;
    if (lvl == 1) {
      b1 = loadImage("");
    } else if (lvl == 2) {
      b1 = loadImage("");
    }
  }
  void display() {
    // replace with image
    // image(b1,x,y);
    fill(255);
    ellipse(x, y, size, size);
    fill(255, 0, 0);
    text(health, x, y);
  }

  void move() {
    x += speed;
    if (x > 1920 + size) {
      x = 0 - size;
    }
  }
  boolean isHit(Ship s) {
    float d = dist(x, y, s.x, s.y);
    if (d<250) {
      return true;
    } else return false;
  }
}
