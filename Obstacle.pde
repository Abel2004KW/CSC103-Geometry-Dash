class Obstacle {
  int x;
  int y;
  int w;
  int h;
  int speed;
  int left;
  int right;
  int top;
  int bottom;
  boolean ispassed;

  Obstacle(int startingX, int startingY, int startingW, int startingH) {
    x = startingX;
    y = height - startingH / 2;
    w = startingW;
    h = startingH;
    ispassed = false;

    left = x - w / 2;
    right = x + w / 2;
    top = y - h / 2;
    bottom = y + h / 2;
  }

  void render() {
    if (ispassed == false) {
      fill(255, 0, 0);
      triangle(x - w / 2, y + h / 2, x + w / 2, y + h / 2, x, y - h / 2);
    }

    left = x - w / 2;
    right = x + w / 2;
    top = y - h / 2;
    bottom = y + h / 2;
  }

  void moveLeft(int speed) {
    if (ispassed == false) {
      x -= speed;

      if (x + w / 2 < 0) {
        ispassed = false;
      }
    }
  }

  void playerCollide(Player aPlayer) {
    if (ispassed==false &&
        aPlayer.bottom >= top &&
        aPlayer.top <= bottom &&
        aPlayer.right >= left &&
        aPlayer.left <= right) {
      gameOver = true;
    }
  }
  
  
}
