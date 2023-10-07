class Ship {
    final int shipSize = 25;

    PVector pos;
    PVector vel = new PVector(1, 1.2);
    PVector wind = new PVector(0,0);
    PImage img;

    Ship(int x,int y){
        pos = new PVector(x,y);
        img = loadImage("assets/boat.png");
    }
    void update(){
        pos.add(vel);
        pos.add(wind);
    }
    void setVel(PVector vel){
        this.vel = vel;
    }
    void setWind(PVector wind){
        this.wind = wind;
    }
    void display(){
        pushMatrix();
        translate(pos.x,pos.y);
        rotate(vel.heading());
        image(img,-shipSize,-shipSize/2,shipSize*2,shipSize);
        popMatrix();
    }
}
