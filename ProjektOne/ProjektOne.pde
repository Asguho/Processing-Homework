Ship ship;
Ui ui; 

void setup() {
    size(900, 700);
    ship = new Ship(515,430);
    ui = new Ui();
}

void draw() {
    background(0);
    ship.setVel(ui.getValue("skib"));
    ship.setWind(ui.getValue("vind"));

    ship.update();

    ui.display();
    ship.display();
}

void onButtonPress(String message){
    if(message == "reset"){
        ship = new Ship(515,430);
    }
    // if(message == "start"){
    //     ship.start();
    // }
}