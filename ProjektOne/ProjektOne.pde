import processing.sound.*;
SoundFile bg;

Ship ship;
Ui ui; 

void setup() {
    //bg = new SoundFile(this, "battle.mp3");
    //bg.loop();
    frameRate(60);

    size(900, 700);
    ship = new Ship(515,430);
    ui = new Ui();
}

void draw() {
    background(0);
    ship.setVel(ui.getValue("skib"));
    ship.setWind(ui.getValue("vind"));

    if(ui.getState("start")){
        ship.update();
    }

    if(ui.getState("reset")){
        ship = new Ship(515,430);
        ui.resetProperties();
    }

    ui.display();
    ship.display();
}