class Laser {
  int x, y, w, h, speed;

  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 8;
    h = 12;
    speed = 5;
  }

  void display() {
    fill(255, 0, 0);
    rectMode(CENTER);
    rect(x, y, w, h);
  }
  void move() {
    y = y - speed;
  }

  boolean isOffScreen() {
    if (y < 0-100) {
      return true;
    } else {
      return false;
    }
  }
  boolean isHit(Rock r) {
    float d = dist(x, y, r.x, r.y);
    if (d<50) {

      return true;
    } else {
      return false;
    }
  }
}
