void setup() {
    fullScreen();
}

void draw() {
    background(255);
    /**
     * Switch statement that calculates the angle between the mouse position and the center of the screen in radians, so we divide by PI,
     * and multiply by 2 to get a value between -2 and 2. We then round the value to the nearest integer, and pass it as the switch argument.
     */
    switch(round((new PVector(mouseX - width / 2, mouseY - height / 2).heading() / PI) * 2)) {
        case -2 :
        case 2 :
            printInCenter('W');
        break;	
        case 1 :
            printInCenter('S');
        break;
        case 0 :
            printInCenter('E');
        break;
        case -1 :
            printInCenter('N');
        break;
    }
}

void printInCenter(char s) {
    textSize(128);
    fill(0);
    textAlign(CENTER, CENTER);
    text(s, width / 2, height / 2);
}
