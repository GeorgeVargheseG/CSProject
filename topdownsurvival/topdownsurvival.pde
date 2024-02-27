Player player;
Enemy enemy;
ArrayList<Enemy> enemies;
PVector acceleration = new PVector(.9,.9);
PVector friction = new PVector(.8,.8);

void setup(){
  size(640,480);
  player = new Player(new PVector(width/2,height/2),acceleration, 
 friction);
  enemies = new ArrayList<Enemy>();  
}

void draw(){
  background(0,0,0);
  player.updatePlayer();
  player.drawPlayer();
  player.checkPlayerPosition();


  for(int i = 0; i < enemies.size(); i++){
    enemies.get(i).follow(player.getPosition());
    enemies.get(i).draw();
    enemies.get(i).attack(player.getPosition());
  }

  
}

void mouseClicked(){
  enemies.add(new Enemy(new PVector(mouseX,mouseY), new PVector(.2,.2)));
}

void keyPressed(){
  player.keyPressed();
}

void keyReleased(){
  player.keyReleased();
}
