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
    
    rect(frameCount % width,(height / 6) * 1, 2,2);
    
    rect(frameCount % width,(frameCount % (width / 10)) + (height / 6) * 2, 2,2);
    
    rect(frameCount % width,(frameCount / 50 % 2) * 30 + (height / 6) * 3, 2,2);
    
    rect(frameCount % width,(height / 6) * 4, 2,frameCount % (height / 10));
    
    fill(frameCount / 2 % 255, 100, 0);
    
    rect(frameCount % width,(height / 6) * 5, 2,2);
}