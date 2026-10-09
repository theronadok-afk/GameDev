class Ship {
  // Member variable
  int x, y, w, health, turretCount;
  // constructor
  Ship() {
    x = width/2;
    y = height/2;
    w = 50;
    health = 100;
    turretCount = 1;
    
  }
  // member methods
  void display() {
    fill(127);
    imageMode(CENTER);
    
    s1gif.play();
    image(s1gif, x,y);
  }


  void move(int tempX, int tempY) {
    x = tempX;
    y = tempY;
  }
}
