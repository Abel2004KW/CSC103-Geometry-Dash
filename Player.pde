// Player Class
class Player {
  int x;
  int y;
  int w;
  int h;
  boolean isJumping;
  boolean isFalling;
  int speed;
  int jumpHeight;
  int highestY;
  
  int left;
  int right;
  int top;
  int bottom;

  Player(int startingX, int startingY, int startingW, int startingH) {
    x = startingX;
    y = startingY;
    w = startingW;
    h = startingH;

    isJumping = false;
    isFalling = false;
    speed = 15;
    jumpHeight = 300;
    highestY = y - jumpHeight;

    left = x - w / 2;
    right = x + w / 2;
    top = y - h / 2;
    bottom = y + h / 2;
  }

  void render() {
    rectMode(CENTER);
    rect(x, y, w, h);

    left = x - w / 2;
    right = x + w / 2;
    top = y - h / 2;
    bottom = y + h / 2;
  }

  void jumping() {
    if (isJumping == true) {
      y -= speed;
    }
    left = x - w / 2;
    right = x + w / 2;
    top = y - h / 2;
    bottom = y + h / 2;
  }

  void falling() {
    if (isFalling == true) {
      y += speed;
    }
    left = x - w / 2;
    right = x + w / 2;
    top = y - h / 2;
    bottom = y + h / 2;
  }

  void topOfJump() {
    if (y <= highestY) {
      isJumping = false;
      isFalling = true;
    }
  }

  void land() {
    if (y >= height - h / 2) {
      isFalling = false;
      y = height - h / 2;
    }
  }

  void fallOfOplatform(ArrayList<platform> aPlatformList) {
    if (isJumping == false && y < height - h / 2) {
      boolean onPlatform = false;

      for (platform aPlatform : aPlatformList) {
        if (top <= aPlatform.bottom &&
            bottom >= aPlatform.top &&
            left <= aPlatform.right &&
            right >= aPlatform.left) {
          onPlatform = true;
        }
      }

      if (onPlatform == false) {
        isFalling = true;
      }
    }
  }
}
