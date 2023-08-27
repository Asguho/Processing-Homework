ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(800, 800, P2D);
  background(0);
  smooth();
  for (int i = 0; i < 10; i++) {
    particles.add(new Particle(random(width), random(height)));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < particles.size(); i++) {
    Particle p = particles.get(i);
    p.update();
    p.display();
  }
}

class Particle {
    float x, y, vx, vy, ax, ay, r, g, b, a, size;
    PVector location, velocity, acceleration;
    Particle(float mx, float my) {
        x = mx;
        y = my;
        vx = random(0, 0);
        vy = random(0, 0);
        ax = 0;
        ay = 0;
        r = random(100, 255);
        g = random(100, 255);
        b = random(100, 255);
        size = 40;
        location = new PVector(x, y);
        velocity = new PVector(vx, vy);
        acceleration = new PVector(ax, ay);
    }
    void update() {
        collideWithContainer();
        collideWithParticles();
        
        //add gravity
        acceleration.add(new PVector(0, 0.1));


        velocity.add(acceleration);
        location.add(velocity);
        acceleration.mult(0);
    }
    void display() {
        fill(r, g, b);
        ellipse(location.x, location.y, size, size);
        drawLinesBetweenParticles();
    }
    void applyForce(PVector force) {
        acceleration.add(force);
    }

    void collideWithContainer() {
        //if edge is hit then bounce back
        if (location.x < size/2 || location.x > width - size/2) {
            velocity.x *= -0.7;
        }
        if (location.y < size/2 || location.y > height - size/2) {
            velocity.y *= -0.7;
        }

        //if the particle is outside the container then move it back inside the container
        if (location.x < size/2) {
            location.x = size/2;
        }
        if (location.x > width - size/2) {
            location.x = width - size/2;
        }
        if (location.y < size/2) {
            location.y = size/2;
        }
        if (location.y > height - size/2) {
            location.y = height - size/2;
        }
    }

    void drawLinesBetweenParticles() {
        for (int i = 0; i < particles.size(); i++) {
            Particle p = particles.get(i);
            float distance = dist(location.x, location.y, p.location.x, p.location.y);
            if (distance < p.size/2 + size/2) {
                stroke(255, 0,0);
                strokeWeight(2);
                line(location.x, location.y, p.location.x, p.location.y);
                noStroke();
            }
        }
    }

    void collideWithParticles() {
        for (int i = 0; i < particles.size(); i++) {
            Particle p = particles.get(i);
            float distance = dist(location.x, location.y, p.location.x, p.location.y);
            if (distance < p.size/2 + size/2) {
                float angle = atan2(location.y - p.location.y, location.x - p.location.x);
                float targetX = p.location.x + cos(angle) * (p.size/2 + size/2);
                float targetY = p.location.y + sin(angle) * (p.size/2 + size/2);
                float ax = (targetX - location.x);
                float ay = (targetY - location.y);

                PVector PVectorForce = new PVector(ax, ay);
                PVectorForce.mult(0.5);
                applyForce(PVectorForce);
                p.applyForce(PVectorForce.mult(-1));
            }
        }
    }
}

void mousePressed() {
    particles.add(new Particle(mouseX, mouseY));
}