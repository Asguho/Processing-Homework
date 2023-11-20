ArrayList<Ball> balls = new ArrayList<Ball>();

void setup() {
    size(500, 500);
    for (int i = 0; i < 10; i++) {
        balls.add(new Ball(random(width), random(height), random(-5, 5), random(-5, 5), random(10, 50), color(random(255), random(255), random(255))));
    }
}

void draw() {
    background(0);
    for (Ball ball : balls) {
        ball.move();
        ball.display();
    }
}


class Ball {
    float x, y, speedX, speedY, size;
    color c;

    Ball(float x, float y, float speedX, float speedY, float size, color c) {
        this.x = x;
        this.y = y;
        this.speedX = speedX;
        this.speedY = speedY;
        this.size = size;
        this.c = c;
    }

    void move() {
        x += speedX;
        y += speedY;
        if (x < 0 || x > width) {
            speedX *= -1;
        }
        if (y < 0 || y > height) {
            speedY *= -1;
        }
    }

    void display() {
        fill(c);
        ellipse(x, y, size, size);
    }
}

void mousePressed() {
    //add a ball at the mouse position
    balls.add(new Ball(mouseX, mouseY, random(-5, 5), random(-5, 5), random(10, 50), color(random(255), random(255), random(255))));
}