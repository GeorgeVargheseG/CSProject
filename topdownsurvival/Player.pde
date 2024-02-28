class Player{
  private PVector position;
  private PVector velocity;
  private PVector a;


  private PVector acceleration;
  private PVector friction;

  public boolean isAttacked = false;

  public int lastAttacked;

    private int health;

    Player(PVector initPosition, PVector acceleration, PVector friction, int intialHealth){
        this.position = initPosition;
        this.velocity = new PVector(0, 0);
        this.a = new PVector(0,0);
        this.acceleration = acceleration;
        this.friction = friction;
        this.health = intialHealth;
    }   


    public int getHealth(){
        return health;
    }

    public void takeDamage(int damage){
        if(health > 0)
            health -= damage;
    }

    public boolean isDead(){
        if(health <= 0){
            return true;
        }
        return false;
    }


    public PVector getPosition(){
        return position.copy();
    }

    public PVector getDirection(){
        return velocity.normalize().copy();
    }

    public void update(){
        velocity.add(a);
        position.add(velocity);
        velocity.x *= friction.x;
        velocity.y *= friction.y;
    }

    public void draw(){
        float heading = PVector.sub(new PVector(mouseX,mouseY),position).heading();

        pushMatrix();
        translate(position.x,position.y);
        rotate(heading);
        fill(80);
        fill(255);
        circle(0,0,40);
        rect(0,0,90,30);
        popMatrix();
        
    }



    public void keyPressed(){
        if(key == 'w'){
            print("Pressed");
            a.y = -acceleration.y;
        }
        else if(key == 's'){
            print("Pressed");
            a.y = acceleration.y;
        }
        else if(key == 'a'){
            print("pressed");
            a.x = -acceleration.x;
        }
        else if(key == 'd'){
            print("pressed");
            a.x = acceleration.x;
        }
    }
    
    public void keyReleased(){
       if(key == 'w')
            a.y = 0;
        else if(key == 's')
            a.y = 0;
        else if(key == 'a')
            a.x = 0;
        else if(key == 'd')
            a.x = 0;
    }

    public void checkPlayerPosition(){
        if(position.x > width){
            position.x = 1;
        }
        else if(position.x < 0){
            position.x = width-1;
        }

        if(position.y > height){
            position.y = 1;
        }
        else if(position.y < 0){
            position.y = height -1;
        }
    }
}
