PVector location = new PVector(250, 250);

PVector velocity = new PVector(0, 0);
PVector acceleration = new PVector(0, 0.1);


void setup() {
    size(500, 500);
}

void draw() {
    background(255);
    velocity.add(acceleration);
    location.add(velocity);
    if(location.y+10 > height) {
        velocity.y *= -0.9;
        location.y = height-10;
    }
    circle(location.x, location.y, 10);
}
