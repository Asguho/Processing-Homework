Ship ship;
Ui ui; 

void setup() {
    size(800, 800);
    ship = new Ship(height/2,width/2);
    ui = new Ui();
}

void draw() {
    ship.update();

    ui.display();
    ship.display();
}
