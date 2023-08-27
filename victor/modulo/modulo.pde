void setup() {
    clear();
    size(500,500);
    background(0);
}

void draw() {

    stroke(frameCount / 50% 2 * 30 * 100, frameCount / 75 % 2 * 30 * 100, frameCount / 100 % 2 * 30 * 100);
    line(frameCount % width, 10, frameCount % width, 40);

    
    //istedet for background
    noStroke();
    blurCanvas();
    
    //firkant tegnes nu, og der kommer et "trace"  
    fill(255);
    rect(frameCount % width,100,4,4);
    
    fill(255);
    rect(frameCount % width,200 + (frameCount / 50 % 2 * 30),4,4);

    fill(255);
    rect(frameCount % width,300 + (frameCount / 75 % 2 * 30),4,4);

    fill(255);
    rect(frameCount % width,400 + (frameCount / 100 % 2 * 30),4,4);
}

void blurCanvas() {
    if (frameCount % 10 != 0) {
        return;
    }
    loadPixels();
    // Loop through every pixel and set the color of that pixel to the average color of the surrounding pixels.
    for (int x = 1; x < width-1; x++) {
        for (int y = 1; y < height-1; y++ ) {
            float sumRed = 0;
            float sumGreen = 0;
            float sumBlue = 0;
            for (int xoffset = -1; xoffset <= 1; xoffset++) {
                for (int yoffset = -1; yoffset <= 1; yoffset++) {
                    int xpos = x + xoffset;
                    int ypos = y + yoffset;
                    int loc = xpos + ypos * width;
                    color c = pixels[loc];
                    sumRed += red(c);
                    sumGreen += green(c);
                    sumBlue += blue(c);
                }
            }
            int loc = x + y * width;
            color c = color(sumRed/9, sumGreen/9, sumBlue/9);
            //slightly darken all pixels
            c = color(red(c) * 0.999, green(c) * 0.999, blue(c) * 0.999);
            pixels[loc] = c;
        }
    }
    updatePixels();
}