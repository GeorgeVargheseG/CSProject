class Enemy {
//
    private PVector position;
    private PVector velocity;
    private float left,right,top,bottom,health,d,attackDist, damage;
    
    public Enemy(PVector pos, PVector velocity,int startingHealth) {
        this.position = pos;
        this.velocity = velocity;
        this.health = startingHealth;
        this.damage = 1;
        this.attackDist = 30;
        this.d=60;
    }

    public void follow(PVector target){
        PVector direction = target.copy().sub(position).normalize();

        position.add(Vector.multiply2D(direction,velocity));
    }

    public PVector getFollowVector(PVector target){
        return PVector.sub(target,position);
    }

    public void draw(PVector target){

        left = position.x - d/2;
        right = position.x + d/2;
        top = position.y - d/2;
        bottom = position.y + d/2;

        
        pushMatrix();
        translate(position.x,position.y);
        rotate(getFollowVector(target).heading());
        fill(255);
        circle(0,0,d);
        popMatrix();
    }

    public boolean isDead(){
        if(health <= 0){
            return true;
        }
        return false;
    }

    public void takeDamage(int damage){
        if(health > 0)
            health -= damage;
    }

    public void attack( int time, Player player){
        if(PVector.dist(player.getPosition(),position) < attackDist && !player.isAttacked){
            println("attacked");
            player.takeDamage((int)damage);
            player.isAttacked = true;
            player.lastAttacked = time;
        }   
    }
}
