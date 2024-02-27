class Enemy {

    private PVector position;
    private PVector velocity;
    private PVector acceleration;

    private PVector accelerationVal;


    public Enemy(PVector pos, PVector velocity) {
        this.position = pos;
        this.velocity = velocity;
    }

    public void follow(PVector target){
        PVector direction = target.copy().sub(position).normalize();

        position.add(Vector.multiply2D(direction,velocity);
    }

    public void draw(){
        fill(255);
        circle(position.x,position.y,20);
    }


   
}
