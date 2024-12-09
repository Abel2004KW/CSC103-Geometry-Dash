class Score {
  int score;
  int x, y;
  int winningScore = 42;

  Score(int startX, int startY) {
    x = startX;
    y = startY;
    score = 0;
  }

  void increaseScore() {
    score++;
  }

  void render() {
    textSize(32);
    fill(255);
    text("Score: " + score, x, y);
  }
}
