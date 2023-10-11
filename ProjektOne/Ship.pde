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

        if(pos.x > width || pos.x < 0 || pos.y > height || pos.y < 0){
            vel = new PVector(0,0);
            if(pos.x > width){
                pos.x = width;
            }
            if(pos.x < 0){
                pos.x = 0;
            }
            if(pos.y > height){
                pos.y = height;
            }
            if(pos.y < 0){
                pos.y = 0;
            }
        }
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
