PVector pos, vel, acc;

void setup() {
    size(400, 400);
    background(255);
    // add vector for position and velocity and acceleration
    pos = new PVector(100, 100);
    vel = new PVector(2.5, 5);
    acc = new PVector(0, 0.1);
}



void draw() {
    // use the verctors to update position and velocity with acceleration (gravity)
    pos.add(vel);
    vel.add(acc);

    // add gravity to acceleration
    acc.add(0, 0.01);

    // draw the ball
    fill(255, 0, 0);
    ellipse(pos.x, pos.y, 20, 20);
    fill(0);

    //add friction
    vel.mult(0.90);

    //if near a wall, reverse velocity
    if (pos.x > width || pos.x < 0) {
        vel.x = vel.x * -1;
        //coretct accelleration
        acc.x = acc.x * -1;
    }
    if (pos.y > height || pos.y < 0) {
        vel.y = vel.y * -1;
        //coretct accelleration
        acc.y = acc.y * -1;
    }


}