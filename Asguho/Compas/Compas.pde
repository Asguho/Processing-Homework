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
            printInMiddel("W");
        break;	
        case 1 :
            printInMiddel("S");
        break;
        case 0 :
            printInMiddel("E");
        break;
        case -1 :
            printInMiddel("N");
        break;
    }
}

void printInMiddel(String s) {
    textSize(128);
    fill(0);
    // text(s,width / 2-textWidth(s)/2,height / 2+(textAscent()+textDescent())/2);
    textAlign(CENTER, CENTER);
    text(s, width / 2, height / 2);
}
