class Ball {
    PVector location, velocity;
    float radius;

    Ball() {
        location = new PVector(random(0, width), random(0, height));
        velocity = new PVector(2, 2);
        radius = 20;
    }

    void update() {
        location.add(velocity);
    }

    void display() {
        stroke(0);
        fill(175);
        circle(location.x, location.y, radius*2);
    }

    void checkEdges() {
        if (location.x > width - radius) {
            velocity.x *= -1;
        } else if (location.x < radius) {
            velocity.x *= -1;
        }

        if (location.y > height - radius) {
            velocity.y *= -1;
        } else if (location.y < radius) {
            velocity.y *= -1;
        }
    }
    void checkCollisionWithLines(Lines lines) {
        if (dist(location.x,0, lines.position.x,0) < radius) {
            velocity.x *= -1;
        } else if (location.x < radius) {
            velocity.x *= -1;
        }

        if (dist(location.y,0, lines.position.y,0) < radius) {
            velocity.y *= -1;
        } else if (location.y < radius) {
            velocity.y *= -1;
        }
    }
    void checkCollision(Lines lines){
        
    }
}


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

class Target {
    PVector location;
    float radius;

    Target() {
        location = new PVector(random(0, width), random(0, height));
        radius = 20;
    }

    void display() {
        stroke(0);
        fill(255, 0, 0);
        circle(location.x, location.y, radius*2);
    }

    boolean checkCollision(Ball other) {
        float distance = dist(location.x, location.y, other.location.x, other.location.y);
        if (distance < radius + other.radius) {
             location = new PVector(random(0, width), random(0, height));
            return true;
        } else {
            return false;
        }
    }
}
class Score {
    int score;

    void display() {
        text(score, 10, 10);
    }
    void update() {
        score++;
    }
}




Ball ball = new Ball();
Lines lines = new Lines();
Target target = new Target();
Score score = new Score();

void setup() {
    fullScreen();
}
void mousePressed() {
    lines.update();
}

void draw() {
    background(255);
    ball.update();
    ball.checkEdges();
    if(target.checkCollision(ball)){
        score.update();
    }
ball.checkCollisionWithLines(lines);
    //display
    ball.display();
    lines.display();
    target.display();
    score.display();
}
