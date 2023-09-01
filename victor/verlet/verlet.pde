ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<Stick> sticks = new ArrayList<Stick>();
float prevTime;
int supsteps = 10;
float ease = 0;

void setup() {
    size(900, 700, P2D);
    fullScreen(P2D);

    for (int i = 0; i * 10 + 100 < width - 100; i++) {
        for (int j = 0; j < 60; j++) {
            // first row fixed
            particles.add(new Particle(100 + i * 10, 100 + j * 10, 10000, j == 0));
        }
    }

    // add sticks in vertical direction
    for (int i = 0; i < particles.size() - 60; i++) {
        sticks.add(new Stick(particles.get(i), particles.get(i + 60), 10));
    }

    // add sticks in horizontal direction
    for (int i = 0; i < particles.size() - 1; i++) {
        if ((i + 1) % 60 != 0) {
            sticks.add(new Stick(particles.get(i), particles.get(i + 1), 10));
        }
    }
}

void draw() {
    float dt = deltaTime();
    background(0);

    for (int i = 0; i < supsteps; i++) {
        updateParticles(dt);
    }
    
    for (int i = 0; i < particles.size(); i++) {
        //ellipse(particles.get(i).x, particles.get(i).y, 1, 1);
    }
    
    stroke(255);
    for (int i = 0; i < sticks.size(); i++) {
        line(sticks.get(i).p1.x, sticks.get(i).p1.y, sticks.get(i).p2.x, sticks.get(i).p2.y);
    }

    if(ease < 1) {
        ease += 0.01;
    }
}

void updateParticles(float deltaTime) {
    for (int i = 0; i < particles.size(); i++) {
        Particle particle = particles.get(i);
        
        if (particle.fixed) {
            particle.x = particle.prevx;
            particle.y = particle.prevy;
            continue;
        }

        PVector force = new PVector(0, 0.2 * ease);
        
        PVector acceleration = new PVector(force.x / particle.mass, force.y / particle.mass);
        
        PVector prevPosition = new PVector(particle.x, particle.y);
        
        particle.x = 2 * particle.x - particle.prevx + acceleration.x * (deltaTime * deltaTime);
        particle.y = 2 * particle.y - particle.prevy + acceleration.y * (deltaTime * deltaTime);
        
        particle.prevx = prevPosition.x;
        particle.prevy = prevPosition.y;
        
        keepInsideView(particle);
    }
    
    for (int i = 0; i < sticks.size(); i++) {
        Stick stick = sticks.get(i);
        
        PVector diff = getDifference(stick.p1, stick.p2);
        float diffFactor = (stick.length - getLength(diff)) / getLength(diff) * 0.5;
        PVector offset = new PVector(diff.x * diffFactor, diff.y * diffFactor);
        
        stick.p1.x += offset.x;
        stick.p1.y += offset.y;
        stick.p2.x -= offset.x;
        stick.p2.y -= offset.y;
    }
}

class Particle {
    float x, y, prevx, prevy;
    float mass;
    boolean fixed;
    
    Particle(float x, float y, float mass, boolean fixed) {
        this.x = x;
        this.y = y;
        this.prevx = x;
        this.prevy = y;
        this.mass = mass;
        this.fixed = fixed;
    }
}

class Stick {
    Particle p1, p2;
    float length;
    
    Stick(Particle p1, Particle p2, float length) {
        this.p1 = p1;
        this.p2 = p2;
        this.length = length;
    }
}

float getDistance(Particle p1, Particle p2) {
    float dx = p1.x - p2.x;
    float dy = p1.y - p2.y;
    return sqrt(dx * dx + dy * dy);
}

float getLength(PVector v) {
    return v.mag();
}

PVector getDifference(Particle p1, Particle p2) {
    return new PVector(p1.x - p2.x, p1.y - p2.y);
}

void keepInsideView(Particle particle) {
    if (particle.y >= height)
        particle.y = height;
    if (particle.x >= width)
        particle.x = width;
    if (particle.y < 0)
        particle.y = 0;
    if (particle.x < 0)
        particle.x = 0;
}

void addForce(Particle particle, PVector force) {
    particle.x += force.x;
    particle.y += force.y;
}

float deltaTime() {
    float now = millis();
    float dt = now - prevTime;
    prevTime = now;
    return dt/supsteps*3;
}

void mouseDragged() {
    if (mouseButton == LEFT) {
        //calculate distance and direction of mouse drag and put it into a vector
        PVector mouseDrag = new PVector(mouseX - pmouseX, mouseY - pmouseY);
        mouseDrag.mult(0.1 / supsteps);
        for (int i = 0; i < particles.size(); i++) {
            //find the distance between the mouse and the particle
            float distance = dist(mouseX, mouseY, particles.get(i).x, particles.get(i).y);
            //if the distance is less than 50 pixels, add the mouse drag vector to the particle
            if (distance < 50) {
                addForce(particles.get(i), mouseDrag);
            }
        }
    }

    if (mouseButton == RIGHT) {
        for (int i = 0; i < sticks.size(); i++) {
            float distance1 = dist(mouseX, mouseY, sticks.get(i).p1.x, sticks.get(i).p1.y);
            float distance2 = dist(mouseX, mouseY, sticks.get(i).p2.x, sticks.get(i).p2.y);

            //if the distance is less than 10 pixels, remove the stick
            if (distance1 < 10 || distance2 < 10) {
                sticks.remove(i);
            }
        }
    }
}


//if r is pressed reset the particles to their original positions
void keyPressed() {
    if (key == 'r' || key == 'R') {
        //remove all the sticks
        sticks.clear();
        //remove all the particles
        particles.clear();


        //rerun the setup function to create the particles and sticks again
        setup(); 
    }
}