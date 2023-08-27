class Ball {
    PVector location, velocity;
    float radius;

    Ball() {
        location = new PVector(random(width), random(height));
        velocity = new PVector(5, 5);
        radius = 20;
    }

    void update() {
        location.add(velocity);

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

    void display() {
        stroke(0);
        fill(175);
        circle(location.x, location.y, radius*2);
    }

    void checkCollisionWithLines(Lines lines) {
        if (dist(location.x,0, lines.position.x,0) < radius) {
            velocity.x *= -1;
        } 
        if (dist(location.y,0, lines.position.y,0) < radius) {
            velocity.y *= -1;
        }
    }
}