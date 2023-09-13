class Target {
    PVector location;
    float radius;

    Target() {
        location = new PVector(random(width), random(height));
        radius = 20;
    }

    void display() {
        stroke(0);
        fill(255, 0, 0);
        circle(location.x, location.y, radius*2);
    }

    void checkCollision(Ball ball, Score score) {
        float distance = dist(location.x, location.y, ball.location.x, ball.location.y);
        if (distance < radius + ball.radius) {
            location = new PVector(random(0, width), random(0, height));
            score.increment();
        }
    }
}
