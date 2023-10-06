class Ui{
    PImage img;
    Ui(){
        img = loadImage("assets/background.png");
    }

    void display() {
        image(img, 0, 0);
    }
}