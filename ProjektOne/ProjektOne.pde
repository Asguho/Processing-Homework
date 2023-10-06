Ship ship;
Ui ui; 

void setup() {
    //fullScreen();
    size(900, 500);
    ship = new Ship(height/2,width/2);
    ui = new Ui();
}

void draw() {
    background(0);
    PVector skib = ui.getValue("skib");
    ship.setVel(skib);

    PVector vind = ui.getValue("vind");
    ship.setWind(vind);

    ship.update();

    ui.display();
    ship.display();
}
