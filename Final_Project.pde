import processing.sound.*;
// declared a sound variable
SoundFile JumpSound;
SoundFile BackgroundSound;
SoundFile ApplauseSound;
SoundFile LaughingSound ;

/// declared a image variable

 PImage Backgroundpic,Homepg;
int gameLevel = 0; // 0 = Not Started, 1 = Easy, 2 = Medium, 3 = Hard
int obstacleSpeed = 4; // Default speeds for Easy
int platformSpeed = 4;
int playerSpeed = 12;
color playerColor; // Variable to store the player's random color

// sound files come from 
// Jump-https://mixkit.co/free-sound-effects/jump/
// background-https://jayuzumi.com/geometry-dash-soundboard
boolean gameWon = false; 
 boolean gameOver = false;  
 boolean gameStarted = false; // To track whether the game has started
Score score;
  Player p1;
 platform plat1, plat2, plat3, plat4, plat5,plat6,plat7,plat8, plat9,plat10,plat11,
 plat12,plat13,plat14,plat15,plat16,plat17,plat18,plat19,plat20,plat21;
 Obstacle o1, o2, o3, o4,o5,o6,o7,o8,o9,o10,o11,o12,o13,o14,o15,o16,o17,o18,o19,o20,
 o21,o22,o23,o24,o25,o26,o27,o28,o29,o30,o31,o32,o33,o34,o35,o36,o37,o38,o39,o40,o41,o42;

ArrayList<platform> platformList;

void setup() {
  // Load the homepage image
  Homepg = loadImage("Homepg.png");
  Homepg.resize(1200, 800); // Resize to fit the screen
  // resize the image (if needed) 
  // Dash.resize();  
  size(1200, 800);
  imageMode(CENTER);
  Backgroundpic=loadImage("Backgroundpic.jpg");
  Backgroundpic.resize(1200,800);
    randomSeed(millis()); 

  playerColor = color(random(0, 255), random(0, 255), random(0, 255));

  p1 = new Player(width / 4, height - 25, 50, 50); 
//    o1 = new Obstacle(760, height - 25, 40, 50=hight); 

  // Hard-coded obstacles  
     o1 = new Obstacle(760, height - 25, 40, 70); 
     o2 = new Obstacle(1165, height - 25, 40, 30); 
     o3 = new Obstacle(1200, height - 25, 40, 60);  
     o4 = new Obstacle(1665, height - 25, 40, 40); 
     o5 = new Obstacle(1700, height - 25, 40, 40); 
     o6 = new Obstacle(1850, height - 25, 40, 30); 
     o7 = new Obstacle(1870, height - 25, 20, 30); 
     o8 = new Obstacle(2410, height - 25, 50,50); 
     o9 = new Obstacle(2430, height - 25, 40, 50); 
     o10 =new Obstacle(2770, height - 25, 40,90); 
     o11= new Obstacle(2870, height -  25, 40, 90); 
     o12= new Obstacle(3110, height-40, 40, 100); 
     o13 =new Obstacle(3500, height - 25,40,60); 
     o14= new Obstacle(3700, height -25, 40,80); 
     o15= new Obstacle(3900, height-40, 40, 60); 
     o16 =new Obstacle(4520,height - 25, 40,40); 
     o17= new Obstacle(4580, height - 25,40,40); 
     o18= new Obstacle(4640, height-40, 40, 40); 
     o19= new Obstacle(4700, height-40, 40, 40); 
     o20= new Obstacle(5200, height-40, 40, 50); 
     o21= new Obstacle(5320, height-40, 40, 60); 
     o22= new Obstacle(5370, height-40, 40, 30); 
     o23= new Obstacle(5560, height-40, 40, 50);
     o24= new Obstacle(5600, height-40, 40, 40); 
     o25= new Obstacle(5880, height-40, 40, 70);
     o26= new Obstacle(5950, height-40, 40, 40); 
     o27= new Obstacle(6050, height-40, 40, 70);  
     o28= new Obstacle(6150, height-40, 40, 40); 
     o29= new Obstacle(6250, height-40, 40, 70);  
     o30= new Obstacle(6350, height-40, 40, 40); 
     o31= new Obstacle(6450, height-40, 40, 70);  
     o32= new Obstacle(6550, height-40, 40, 40); 
     o33= new Obstacle(6650, height-40, 40, 40);   
     o34= new Obstacle(6900, height-40, 40, 70);   
     o35= new Obstacle(7000, height-40, 40, 60);   
     o36= new Obstacle(7200, height-40, 40, 80);   
     o37= new Obstacle(7350, height-40, 40, 70);   
     o38= new Obstacle(7550, height-40, 40, 80);   
     o39= new Obstacle(7650, height-40, 40, 60);  
     o40= new Obstacle(7750, height-40, 40, 70);  
     o41= new Obstacle(7850, height-40, 40, 60);  
     o42= new Obstacle(8550, height-40, 40, 100);  

  // Platforms with different sizes
  //plat3 = new platform(width / 2 + 400, 300=hight , 100=width, 10=big);

  plat1 = new platform(width/2+1150, 800, 60, 120);  
  plat2 = new platform(width / 2 + 1390, 650, 120, 15);  
  plat3 = new platform(width / 2 + 2000, 800, 300, 120);  
  plat4 = new platform(width / 2 + 2500, 800, 450, 120);  
  plat5 = new platform(width / 2 + 2900, 650,100, 10);  
  plat6 = new platform(width / 2 + 3100, 550,100, 10);  
  plat7 = new platform(width / 2 + 3300, 400,100, 10);  
  plat8 = new platform(width / 2 + 4000, 730,50, 10); 
  plat9 = new platform(width / 2+4660, 800,50, 160);
  plat10 = new platform(width / 2 + 4900, 720,60, 10);  
  plat11 = new platform(width / 2+5140, 760,100, 10);
  plat12 = new platform(width / 2+5400, 650,100, 10);
  plat13= new platform(width / 2+5700, 570,100, 10);
  plat14= new platform(width / 2+6000, 640,100, 10);
  plat15= new platform(width / 2+6200, 800,100, 150);
  plat16= new platform(width / 2+6430, 610,100, 10);
  plat17= new platform(width / 2+6650, 500,100, 10);
  plat18= new platform(width / 2+6800, 310,100, 10);
  plat19= new platform(width / 2+7000, 500,100, 10);
  plat20= new platform(width / 2+7200, 700,100, 10);
  plat21= new platform(width / 2+7900, 800,100, 80);
 
  platformList = new ArrayList<platform>();
  platformList.add(plat1);
  platformList.add(plat2);
  platformList.add(plat3);
  platformList.add(plat4); 
  platformList.add(plat5);
  platformList.add(plat6);
  platformList.add(plat7);
  platformList.add(plat8);
  platformList.add(plat9);
  platformList.add(plat10);
  platformList.add(plat11);
  platformList.add(plat12);
  platformList.add(plat13);
  platformList.add(plat14);
  platformList.add(plat15);
  platformList.add(plat16);
  platformList.add(plat17);
  platformList.add(plat18);
  platformList.add(plat19);
  platformList.add(plat20);
  platformList.add(plat21);
  
  //score stuff
  score=new Score(width-100,50);

    // intialize my sound 
JumpSound= new SoundFile(this,"Jump.wav");
JumpSound.rate(.7);
BackgroundSound=new SoundFile(this,"Background.wav");
BackgroundSound.rate(.9);
ApplauseSound = new SoundFile(this, "Applause.wav");
  LaughingSound = new SoundFile(this, "Laughing.wav");

}

int lastColorChangeTime = 0; 

void draw() {
  if (gameLevel == 0) {
    // Display the homepage with level selection
    background(0); // Solid background color
    image(Homepg, width / 2, height / 2); // Display the homepage image
    textAlign(CENTER);
    textSize(50);
    fill(110,0,220); 
    text("Welcome!", width / 2, height - 350);
    textSize(50);
    fill(200,200,130);
    text("Select your level:", width / 2, height - 250);
    textSize(32);
    fill(0, 255, 0); 
    text("Press 'E' for Easy", width / 2, height - 150);
    fill(255, 255, 0); 
    text("Press 'M' for Medium", width / 2, height - 100);
    fill(255, 0, 100); 
    text("Press 'H' for Hard", width / 2, height - 45);
  } else if (gameOver == false && gameWon == false) { 
    // Adjust speeds based on the selected level
    if (gameLevel == 1) {
      obstacleSpeed = 4;  // Easy
      platformSpeed = 4;
      playerSpeed = 10;
    } else if (gameLevel == 2) {
      obstacleSpeed = 6;  // Medium
      platformSpeed = 6;
      playerSpeed = 15;
    } else if (gameLevel == 3) {
      obstacleSpeed = 7;  // Hard
      platformSpeed = 7;
      playerSpeed = 18;
    }

    // Main game logic
    background(42);

    // Play background sound if not already playing
    if (!BackgroundSound.isPlaying()) {
      BackgroundSound.play();
    }

    // Draw game background
    image(Backgroundpic, width / 2, height / 2);

    // Change player color every 3 seconds (3000 milliseconds)
    if (millis() - lastColorChangeTime >= 3000) {
      playerColor = color(random(0, 255), random(0, 255), random(0, 255));
      lastColorChangeTime = millis();
    }

    fill(playerColor);

    // Update and render player
    p1.render();
    p1.jumping();
    p1.falling();
    p1.topOfJump();
    p1.land();
    p1.fallOfOplatform(platformList);

    // Render and move platforms
    for (platform aPlatform : platformList) {
      aPlatform.render();
      aPlatform.collide(p1);
      aPlatform.moveLeft(platformSpeed);
    }

    // Store all obstacles in an array and render them
    Obstacle[] obstacles = {o1, o2, o3, o4, o5, o6, o7, o8, o9, o10, o11, o12, o13, o14, o15, o16, o17, o18, 
                            o19, o20, o21, o22, o23, o24, o25, o26, o27, o28, o29, o30, o31, o32, o33, o34, 
                            o35, o36, o37, o38, o39, o40, o41, o42};
    for (Obstacle obstacle : obstacles) {
      obstacle.render();
      obstacle.moveLeft(obstacleSpeed);
      obstacle.playerCollide(p1);
      
      if (obstacle.x < 0 && !obstacle.ispassed) {
        score.increaseScore();
        obstacle.ispassed = true;
      }
    }

    // Check collision with the final obstacle o42
    if (p1.x < o42.x + o42.w &&
        p1.x + p1.w > o42.x && 
        p1.y < o42.y + o42.h && 
        p1.y + p1.h > o42.y) {
      gameWon = true; 
    }

  } else if (gameOver) {
    // Game over screen
    if (BackgroundSound.isPlaying()) {
      BackgroundSound.stop(); // Stop the background sound
    }
    if (LaughingSound.isPlaying() == false) {
  LaughingSound.play(); // Play laughing sound
}

    
    textAlign(CENTER);
    textSize(32);
    fill(255, 0, 0);
    text("Game Over!", width / 2, height / 2 - 10);
    textSize(30);
   fill(204, 102, 0);
    text("Press 'R' to Restart", width / 2+10, height / 2 + 30);
  } else if (gameWon) {
    // Winning screen
    if (BackgroundSound.isPlaying()) {
      BackgroundSound.stop(); // Stop the background sound
    }
    if (ApplauseSound.isPlaying() == false) {
  ApplauseSound.play(); // Play applause sound
}

    
    textAlign(CENTER);
    textSize(50);
    fill(0, 255, 0);
    text("You Win!", width / 2, height / 2);
    textSize(35);
   fill(204, 102, 0);
    text("Press 'R' to Restart", width / 2+10, height / 2 + 50);
  }
  
  // Render score
  score.render();
}

void keyPressed() {
  if (key == 'e') {
    gameLevel = 1; // Easy level
    gameStarted = true;
  }
  if (key == 'm') {
    gameLevel = 2; // Medium level
    gameStarted = true;
  }
  if (key == 'h') {
    gameLevel = 3; // Hard level
    gameStarted = true;
  }
  if (gameStarted == true && key == ' ' &&
                  p1.isJumping == false && 
                  p1.isFalling == false &&
                  gameOver == false) {
    // Allow jumping during the game
    p1.isJumping = true;
    p1.highestY = p1.y - p1.jumpHeight;
    JumpSound.play();
  }
  if (key == 'r') { // Reset game
    gameLevel = 0;
    gameWon = false;
    gameOver = false;
    gameStarted = false;
    setup(); // Restart the setup
  }
}
