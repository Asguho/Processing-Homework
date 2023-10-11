import processing.sound.*;
SoundFile bg;

Ship ship;
Ui ui; 

void setup() {
    bg = new SoundFile(this, "battle.mp3");
    bg.loop();

    size(900, 700);
    ship = new Ship(515,430);
    ui = new Ui();
}

void draw() {
    background(0);
    ship.setVel(ui.getValue("ship"));
    ship.setWind(ui.getValue("wind"));

    ship.update();

    ui.display();
    ship.display();
}
