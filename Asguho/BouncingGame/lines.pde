class Lines {
    PVector position;
    Lines() {
        position =  new PVector(width/2, height/2);
    }
    void display() {
        stroke(0);
        fill(0);
        line(position.x, 0, position.x, height);
        line(0, position.y, width, position.y);
    }
    void update() {
        position.x = mouseX;
        position.y = mouseY;
    }
}