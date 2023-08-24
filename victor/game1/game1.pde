Cross cross = new Cross();
Ball ball = new Ball();
Target target = new Target();
Score score = new Score();
int points = 0;

void setup() {
    size(400, 400);
    background(0);
}

class Ball {
    PVector pos;
    PVector vel;
    int radius = 5;

    Ball() {
        pos = new PVector(100, 100);
        vel = new PVector(1, 1.2);
    }

    void update() {
        pos.add(vel);
    }

    void draw() {
        noStroke();
        fill(0);
        ellipse(pos.x, pos.y, radius * 2, radius * 2);
    }

    void bounce(Cross cross) {
        if (pos.x > width - radius || pos.x < radius) {
            vel.x *= -1;
        }
        if (pos.y > height - radius || pos.y < radius) {
            vel.y *= -1;
        }

        if (pos.x > cross.pos.x - radius && pos.x < cross.pos.x + radius) {
            vel.x *= -1;
        }
        if (pos.y > cross.pos.y - radius && pos.y < cross.pos.y + radius) {
            vel.y *= -1;
        }
    }
}

class Cross {
    PVector pos;
    
    Cross() {
        pos = new PVector(200, 200);
    }

    void draw() {
        noFill();
        stroke(0);
        strokeWeight(2);
        line(0, pos.y, width, pos.y);
        line(pos.x, 0, pos.x, height);
    }

    void update() {
        pos.x = mouseX;
        pos.y = mouseY;
    }
}

class Target {
    PVector pos;
    int radius = 10;

    Target() {
        pos = new PVector(random(width), random(height));
    }

    void draw() {
        noStroke();
        fill(255, 0, 0);
        ellipse(pos.x, pos.y, radius * 2, radius * 2);
    }

    void checkIfHit(Ball ball) {
        if (dist(ball.pos.x, ball.pos.y, pos.x, pos.y) < radius) {
            pos.x = random(width);
            pos.y = random(height);
            points++;
        }
    }
}

class Score {
    void draw() {
        textSize(32);
        fill(0);
        noStroke();
        text(points, 10, 30);
    }
}

void mouseClicked() {
    cross.update();
}

void draw() {
    background(255);
    cross.draw();

    ball.update();
    ball.draw();
    ball.bounce(cross);

    target.draw();
    target.checkIfHit(ball);

    score.draw();
}