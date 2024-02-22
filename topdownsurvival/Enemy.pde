class Enemy {

    private PVector enemyPos;
    private PVector velocity;

    public Enemy(PVector initPos, PVector velocity) {
        enemyPos = initPos;
        this.velocity = velocity;
    }

    public PVector getPosition(){
        return enemyPos;
    }

    public void follow(PVector pos){
        
        PVector direction = pos.copy().sub(enemyPos).normalize();

        enemyPos.add(Vector.multiply2D(direction,velocity));
    }


    public void drawEnemy(){
        fill(255,0,0);
        circle(enemyPos.x,enemyPos.y,20);
    }
}
