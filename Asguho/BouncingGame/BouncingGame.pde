Ball ball;
Lines lines;
Target target;
Score score;

void setup() {
    fullScreen();
    ball = new Ball();
    lines = new Lines();
    target = new Target();
    score = new Score();
}

void mousePressed() {
    lines.update();
}

void draw() {
    background(255);
    ball.update();
    target.checkCollision(ball, score);
    ball.checkCollisionWithLines(lines);

    ball.display();
    lines.display();
    target.display();
    score.display();
}
