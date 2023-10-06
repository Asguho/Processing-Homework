class Ship {
    PVector pos;
    PVector vel;
    Ship(int x,int y){
        pos = new PVector(x,y);
        vel = new PVector(0,-1);
    }
    void update(){
        pos.add(vel);
        // vel.mult(0.99);
    }
    void display(){
        pushMatrix();
        translate(pos.x,pos.y);
        rotate(vel.heading());
        fill(0);
        triangle(10,-10,0,0,10,10);
        popMatrix();
    }
}
