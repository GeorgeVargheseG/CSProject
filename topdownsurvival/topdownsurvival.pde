Player player;
Enemy enemy;
PVector acceleration = new PVector(.9,.9);
PVector friction = new PVector(.8,.8);

void setup(){
  size(640,480);
  player = new Player(new PVector(width/2,height/2),acceleration, 
 friction);

  enemy = new Enemy(new PVector(width/2,height/2), new PVector(.2,.2));
 
  
}

void draw(){
  background(0,0,0);
  player.updatePlayer();
  enemy.follow(player.getPosition());
  enemy.drawEnemy();
player.drawPlayer();

  
}

void keyPressed(){
  player.keyPressed();
}

void keyReleased(){
  player.keyReleased();
}
