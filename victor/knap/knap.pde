PImage img;

Knap upKnap;
Knap downKnap;
Knap rightKnap;
Knap leftKnap;

Ship ship;
Ship ship2;

void setup() {
    size(400, 400);
    background(0);
    
    upKnap = new Knap(50, 100, "up");
    downKnap = new Knap(50, 160, "down");
    rightKnap = new Knap(90, 130, "right");
    leftKnap = new Knap(10, 130, "left");

    img = loadImage("rocket.png");
    
    ship = new Ship(200, 200);
    ship2 = new Ship(100, 100);
}

void draw() {
    background(0);
    upKnap.display();
    downKnap.display();
    rightKnap.display();
    leftKnap.display();
    upKnap.mouseDown();
    downKnap.mouseDown();
    rightKnap.mouseDown();
    leftKnap.mouseDown();
    ship.draw();
    ship2.draw();
    ship.select();
    ship2.select();
}

void mouseReleased() {
    upKnap.mouseUp();
    downKnap.mouseUp();
    rightKnap.mouseUp();
    leftKnap.mouseUp();
}

void up() {
    ship.move(0, -1);
    ship2.move(0, -1);
}

void down() {
    ship.move(0, 1);
    ship2.move(0, 1);
}

void right() {
    ship.move(1, 0);
    ship2.move(1, 0);
}

void left() {
    ship.move(-1, 0);
    ship2.move(-1, 0);
}

class Knap {
    String action;
    boolean clicked;
    int x, y, w = 30, h = 30;

    Knap(int x, int y, String a) {
        action = a;
        this.x = x;
        this.y = y;
    }

    void mouseDown() {
        if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h && mousePressed) {
            clicked = true;
            method(action);
        }
    }

    void mouseUp() {
        clicked = false;
    }

    void display() {
        if (!clicked) {
            fill(255);
        } else {
            fill(0);
        }
        rect(x, y, w, h);
    }
    
    void method(String action) {
        if (action.equals("up")) {
            up();
        } else if (action.equals("down")) {
            down();
        } else if (action.equals("right")) {
            right();
        } else if (action.equals("left")) {
            left();
        }
    }
}

class Ship {
    float x;
    float y;
    boolean isSelected = false;

    Ship(float _x, float _y) {
        x = _x;
        y = _y;
    }

    void draw() {
        fill(255);
        image(img, x, y, 50, 73);
    }

    void move(int xc, int yc) {
        if (isSelected) {
            x += xc;
            y += yc;
        }
    }

    void select() {
        if (mouseX > x && mouseX < x + 50 && mouseY > y && mouseY < y + 73 && mousePressed) {
            // Deselect the previously selected ship
            ship.deselect();
            ship2.deselect();
            
            // Select the current ship
            isSelected = true;
        }
    }

    void deselect() {
        isSelected = false;
    }
}