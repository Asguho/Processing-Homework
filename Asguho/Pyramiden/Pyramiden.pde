static int BOXWIDTH = 20;

void setup() {
    size(500, 500);
    rectMode(CENTER);

    for (int i = 0; i < height/BOXWIDTH; ++i) {
        for (int j = 0; j < i; ++j) {
            int x = int(width/2.0 - BOXWIDTH*i/2.0 + BOXWIDTH/2.0) + BOXWIDTH*j;
            int y = BOXWIDTH * i;
            float rotation = random(0, TWO_PI);
            color boxColor = int(-i/float(height/BOXWIDTH)*-255);

            fill(boxColor);
            translate(x, y);
            rotate(rotation);
            square(0, 0, BOXWIDTH);
            resetMatrix();
        }
    }
}


