class platform {
  int x;
  int y;
  int w;
  int h;
  int left;
  int right;
  int top;
  int bottom;

  platform(int startingX, int startingY, int width, int height) {
    rectMode(CENTER);
    x = startingX;
    y = startingY;
    w = width;  // Platform width
    h = height; // Platform height

    left = x - w / 2;
    right = x + w / 2;
    top = y - h / 2;
    bottom = y + h / 2;
  }

  void moveLeft(int speed) {
    x -= speed;
  }

  void render() {
    left = x - w / 2;
    right = x + w / 2;
    top = y - h / 2;
    bottom = y + h / 2;

    rectMode(CENTER);
    fill(0,0,255);
    rect(x, y, w, h);
  }

  void collide(Player aPlayer) {
    if (left < aPlayer.right &&
        right > aPlayer.left &&
        top < aPlayer.bottom &&
        bottom > aPlayer.top) {

      if (aPlayer.top < top) {
        aPlayer.isFalling = false;
        aPlayer.isJumping = false;
        aPlayer.y = y - h / 2 - aPlayer.h / 2;
      } else if (aPlayer.bottom > bottom) {
        aPlayer.isFalling = true;
        aPlayer.isJumping = false;
      }
    }
  }
}
