class Shape {
    float x;
    float y;
    float r;
    
    Shape(float x_, float y_, float r_) {
        x = x_;
        y = y_;
        r = r_;
    }
    
    void jiggle() {
        x += random(-1,1);
        y += random(-1,1);
    }
    
    void display() {
        point(x,y); 
    }
}

class Line extends Shape {
    float x2, y2;
    
    Line(float x_, float y_, float r_, float x2_, float y2_) {
        super(x_, y_, r_);
        x2 = x2_;
        y2 = y2_;
    }
    
    void jiggle() {
        super.jiggle();
        x2 += random(-1,1);
        y2 += random(-1,1);
    }
    
    void display() {
        strokeWeight(r);
        stroke(255);
        line(x, y, x2, y2);
    }
}

Line l = new Line(10, 10, 10, 100, 100);
void setup() {
    size(200,200);
}

void draw() {
    background(0);
    l.jiggle();
    l.display();
}

