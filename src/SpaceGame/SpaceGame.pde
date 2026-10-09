// Ronan Krejci | 17 Sept 2026 | SpaceGame
import processing.sound.*;
SoundFile laser1;
SoundFile explosion1;
SoundFile PowerUp1;
SoundFile GameOver1;
Ship s1;
Boss b1;
int score, rockCount, rocksOffScreen, laserSpeed, level;
boolean play;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
PImage back1;
import gifAnimation.*;
Gif s1gif;
Timer rDist;
Timer pDist;
void setup() {
  s1gif = new Gif(this, "player.gif");
  s1gif.play();
  size(1920, 950);
  b1 = new Boss(-250, 250, 1);
  s1 = new Ship();
  rDist = new Timer(1000);
  rDist.start();
  pDist = new Timer(7500);
  pDist.start();
  score = 0;
  rockCount = 0;
  rocksOffScreen = 0;
  back1 = loadImage("SpaceBackground.png");
  play = false;
  laser1 = new SoundFile(this, "laser1.mp3");
  explosion1 = new SoundFile(this, "explosion1.mp3");
  PowerUp1 = new SoundFile(this, "PowerUp1.mp3");
  GameOver1 = new SoundFile(this, "GameOver1.mp3");
  //rocks.add(new Rock(int(random(width)), -60));
  //powerups.add(new PowerUp(int(random(width)), -60));
}

void draw() {
  noCursor();
  if (play == false) {
    startScreen();
  } else {
    background(back1);
    //Add Rocks
    if (rDist.isFinished() == true) {
      rDist.start();
      rocks.add(new Rock(int(random(width)), -55));
      rockCount++;
    }
    if (pDist.isFinished() == true) {
      pDist.start();
      powerups.add(new PowerUp(int(random(width)), -55));
    }

    //display and movement and colishon
    for (int i =0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      r.display();
      r.move();
      if (r.isHit(s1)) {
        rocks.remove(r);
        s1.health = s1.health - 10;
      }
      if (r.isOffScreen() == true) {
        rocks.remove(r);
        rocksOffScreen++;
      }
      println(rocks.size());
      b1.display();
      b1.move();
    }
    for (int i =0; i < powerups.size(); i++) {
      PowerUp p = powerups.get(i);
      p.display();
      p.move();
      if (p.isHit(s1)) {
        powerups.remove(p);
        PowerUp1.play();
        if (p.type == 'h') {
          s1.health = s1.health + 20;
          if (s1.health > 100) {
            s1.health = 100;
          }
        }
        if (p.type == 't') {
          rocksOffScreen = rocksOffScreen - 2;
          if (rocksOffScreen <0) {
            rocksOffScreen = 0;
          }
        }
        if (p.type == 's') {
          s1.turretCount += 1;
        }
        if (p.isOffScreen() == true) {
          powerups.remove(p);
        }
        println(rocks.size());
      }
    }
    //display and move lasers and dectect colishon
    for (int i =0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      l.display();
      l.move();
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.isHit(r)) {
          // remove laser
          lasers.remove(l);
          //deduct rock health
          r.health -= 20;
          if (r.health < 1) {
            rocks.remove(r);
            score += 100;
            explosion1.play();
            //increment score
          }
        }
      }
      if (l.isOffScreen() == true) {
        lasers.remove(l);
      }
      println(rocks.size());
      //for (PowerUp p : powerups) {
      //  p.move();
      //  p.display();
      //}
      //for (Rock r : rocks) {
      //  r.move();
      //  r.display();
      //}
    }
    s1.display();
    s1.move(mouseX, mouseY);
    infoPanel();
    if (s1.health<1 || rocksOffScreen > 9) {
      gameOver();
      GameOver1.play();
    }
  }
}
void mousePressed() {
  if (s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
  } else if (s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
  } else if (s1.turretCount == 3) {
    lasers.add(new Laser(s1.x-30, s1.y));
    lasers.add(new Laser(s1.x+30, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
  } else if (s1.turretCount == 4) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x+40, s1.y));
    lasers.add(new Laser(s1.x-40, s1.y));
  } else if (s1.turretCount == 5) {
    lasers.add(new Laser(s1.x-30, s1.y));
    lasers.add(new Laser(s1.x+30, s1.y));
    lasers.add(new Laser(s1.x-50, s1.y));
    lasers.add(new Laser(s1.x+50, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
  } else if (s1.turretCount == 6) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x+40, s1.y));
    lasers.add(new Laser(s1.x-40, s1.y));
    lasers.add(new Laser(s1.x+60, s1.y));
    lasers.add(new Laser(s1.x-60, s1.y));
  }  else if (s1.turretCount == 7) {
    lasers.add(new Laser(s1.x-30, s1.y));
    lasers.add(new Laser(s1.x+30, s1.y));
    lasers.add(new Laser(s1.x-50, s1.y));
    lasers.add(new Laser(s1.x+50, s1.y));
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x-70, s1.y));
    lasers.add(new Laser(s1.x+70, s1.y));
  } else if (s1.turretCount == 6) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x+40, s1.y));
    lasers.add(new Laser(s1.x-40, s1.y));
    lasers.add(new Laser(s1.x+60, s1.y));
    lasers.add(new Laser(s1.x-60, s1.y));
  }
  laser1.play();
}


void infoPanel() {
  fill(127, 127);
  rectMode(CORNER);
  rect(0, 20, width, 40);
  fill(255);
  textMode(CENTER);
  text("Score: " + score, 20, 35);
  if (s1.health<51) {
    fill(255, 255, 0);
  }
  if (s1.health<21) {
    fill(255, 0, 0);
  }
  text("Health: " + s1.health, 220, 35);
  fill(255);
  text("Rock Count: " + rockCount, 440, 35);
  if (rocksOffScreen>4) {
    fill(255, 255, 0);
  }
  if (rocksOffScreen>7) {
    fill(255, 0, 0);
  }
  text("Rocks Passed: " +  rocksOffScreen, 660, 35);
}

void startScreen() {
  // Add start screen grafic
  background(0);
  fill(255);
  text("Press any key to start", width/2, height/2);
  text("By Ronan", width/2, height/2 + 20);
  if (keyPressed) {
    play = true;
  }
}

void gameOver() {
  // Add Game over grafic
  background(0);
  fill(255);
  text("Game Over", width/2, height/2);
  text("Score: " + score, width/2, height/2-20);
  text("Press any key to restart", width/2, height/2 + 20);
  if (keyPressed) {
    loop();
    score = 0;
    rockCount = -1;
    rocksOffScreen = 0;
    s1.health = 100;
    play = false;
    startScreen();
  }
  //noLoop();
}
