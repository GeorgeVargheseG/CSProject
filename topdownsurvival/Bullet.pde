class Bullet {
    private PVector position;
    private PVector velocity;
    private PVector dir;
    private int damage;
    private boolean hasHit = false;

    float left,right,top,bottom,d;

    Bullet(PVector position, PVector velocity, PVector dir){
        this.position = position;
        this.velocity = velocity;
        this.dir = dir;
        damage = 5;

    }

    public boolean isHit(){
        return hasHit;
    }

    void setHitbox(){
        left = position.x - 10;
        right = position.x + 10;
        top = position.y - 10;
        bottom = position.y + 10;
    }

    public void render(){
        setHitbox();
        circle(position.x,position.y,20);
    }

    public void shootEnemy(Enemy enemy){
        if(top <= enemy.bottom &&
        bottom >= enemy.top &&
        left <= enemy.right && 
        right >= enemy.left){
            enemy.takeDamage(damage);
            hasHit = true;
        }
    }

    

    public void move(){
        position.add(Vector.multiply2D(velocity,dir));
    }

    public boolean isOutOfBounds(){
        if(position.x > width || position.x < 0)
            return true;
        if(position.y < 0 || position.y > height)
            return true;
        return false;
    }

}
