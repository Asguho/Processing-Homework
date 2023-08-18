void setup() {
    clear();
    size(500,500);
}

void draw() {
    noStroke();

    
    //istedet for background
    fill(0,3);
    rect(0,0,500,500);
    
    //firkant tegnes nu, og der kommer et "trace"  
    fill(255);
    rect(frameCount % width,150,4,4);
    
    fill(255);
    rect(frameCount % width,250 + (frameCount % 50 > 25 ? 30 : 0),4,4);

    fill(255);
    rect(frameCount % width,350 + (frameCount % 100 > 50 ? 30 : 0),4,4);
}