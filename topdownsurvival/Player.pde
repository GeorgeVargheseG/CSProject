class Player{
  private PVector postion;
  private PVector velocity;
  private PVector a;


  private PVector acceleration;
  private PVector friction;

    Player(PVector initPosition, PVector acceleration, PVector friction){
        this.postion = initPosition;
        this.velocity = new PVector(0, 0);
        this.a = new PVector(0,0);
        this.acceleration = acceleration;
        this.friction = friction;
    }   

    public PVector getPosition(){
        return postion;
    }

    public void updatePlayer(){
        println("UpDating...");
        velocity.add(a);
        println(velocity.array());
        postion.add(velocity);
        velocity.x *= friction.x;
        velocity.y *= friction.y;
    }


    public void drawPlayer(){
        circle(postion.x,postion.y,40);
    }


    public void keyPressed(){
        if(key == 'w'){
            println("Pressed");
            a.y = -acceleration.y;
        }
        else if(key == 's'){
            println("Pressed");
            a.y = acceleration.y;
        }
        else if(key == 'a'){
            println("Pressed");
            a.x = -acceleration.x;
        }
        else if(key == 'd'){
            println("Pressed");
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
}
