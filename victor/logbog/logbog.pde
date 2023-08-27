//#### Krav til opgaven
//- tegn firkanter
//- find kvadrant musen befinder sig i
//- skriv kvadranten musen befinder sig i


void setup() {
    size(500, 500);
}

void draw() {
    background(255);
    drawQuadrants();
    fill(0);
    noStroke();
    textSize(100);
    text(determineQuadrant(), 10, 70);
}

void drawQuadrants() {
    stroke(0);
    strokeWeight(2);
    line(0, height / 2, width, height / 2);
    line(width / 2, 0, width / 2, height);
}

int determineQuadrant() {
    int q = 0;
    q = mouseX < width / 2 ? mouseY < height / 2 ? q + 1 : q + 2 : mouseY < height / 2 ? q : q + 3;
    return q + 1;
}
