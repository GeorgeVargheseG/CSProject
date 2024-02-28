import ddf.minim.*;
//By George Varghese and Jeremy Francis
Minim minim;

Player player;
ArrayList<Enemy> enemies;
ArrayList<Bullet> bullets;
int wave = 0;
PVector acceleration = new PVector(3, 3);
PVector friction = new PVector(.3, .3);

void setup() {
  size(640, 480);
  enemies = new ArrayList<Enemy>();
  bullets = new ArrayList<Bullet>();
  smooth(4);

  minim = new Minim(this);
  AudioPlayer audioPlayer = minim.loadFile("KatanaZero.mp3");
  audioPlayer.play();

  player = new Player(new PVector(width/2, height/2), acceleration,
    friction, 1);
}

void draw() {



  int seconds =  second();

  if (seconds - player.lastAttacked >= 3) {
    player.isAttacked = false;
  }

  background(0, 0, 0);

  if (!player.isDead()) {
    fill(255);
    textSize(20);
    text("Life: " + player.getHealth(), 40, 60);


    player.update();
    player.draw();
    player.checkPlayerPosition();




    for (int i = 0; i<bullets.size()-1; i++) {
      //move bullet
      bullets.get(i).move();
      bullets.get(i).render();

      for (Enemy enemy : enemies) {
        bullets.get(i).shootEnemy(enemy);
      }
      if (bullets.get(i).isOutOfBounds() || bullets.get(i).isHit())
        bullets.remove(i);
    }

    for (int i = 0; i < enemies.size()-1; i++) {
      enemies.get(i).follow(player.getPosition());
      enemies.get(i).draw(player.getPosition());
      enemies.get(i).attack(seconds, player);
      if (enemies.get(i).isDead()) {
        enemies.remove(i);
      }
    }

    println(enemies.size());
    if (enemies.size() <= 2) {
      enemies.clear();
      wave++;
      println("New Wave");
      for (int i = 0; i < wave + 2; i++) {
        float randX = random(0, width);
        float randY = random(0, height);
        enemies.add(new Enemy(new PVector((int)randX, (int)randY), new PVector(1, 1), 5));
      }
    }
  } else {
    fill(255);
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER HAHAHAH FAILURE", width/2, height/2);
  }
}


void keyPressed() {


  if (key == ' ') {
    PVector playerPosition = player.getPosition();
    PVector dir = player.getDirection();
    PVector spawnPoint = PVector.add(playerPosition, Vector.multiply2D(dir, new PVector(50, 50)));

    bullets.add(new Bullet(spawnPoint, new PVector(20, 20), PVector.sub(new PVector(mouseX, mouseY), player.getPosition()).normalize()));
  }


  player.keyPressed();
}

void keyReleased() {
  player.keyReleased();
}

// Death,
//Sprites Come After
