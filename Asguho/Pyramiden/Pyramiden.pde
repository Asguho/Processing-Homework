
void setup() {
    size(500, 500);
    rectMode(CENTER);
}

void draw(){
    background(255);
    drawPyramid((frameCount/2)%(height/4)+1);
}

void drawPyramid(int boxWidth) {
    for (int i = 0; i < height/boxWidth; ++i) {
        for (int j = 0; j < i; ++j) {
            int x = int(width/2.0 - boxWidth*i/2.0 + boxWidth/2.0) + boxWidth*j;
            int y = boxWidth * i;
            float rotation = random(0, TWO_PI);
            color boxColor = int(-i/float(height/boxWidth)*-255);

            fill(boxColor);
            translate(x, y);
            rotate(rotation);
            square(0, 0, boxWidth);
            resetMatrix();
        }
    }
}