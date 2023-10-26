class Ui{
    final float metersPrPixel = 200.0/108.0;
    final float metersPrKnob = 0.514;
    TextInputFloat shipKursInput = new TextInputFloat("Skib kurs", 20, 60, 0, "°");
    TextInputFloat shipKnobInput = new TextInputFloat("Skib Hast", 20, 90, 0, "knob");
    TextInputFloat windKursInput = new TextInputFloat("Vindretning", 20, 170, 0, "°");
    TextInputFloat windLenInput = new TextInputFloat("Vindstyrke", 20, 200, 0, "m/s");
    BoolInputFloat startButton = new BoolInputFloat("Start", 20, 650, false, "");
    BoolInputFloat resetButton = new BoolInputFloat("Reset", 20, 680, false, "");

    Compass skibKompas = new Compass(175, 300, 75);
    Compass vindKompas = new Compass(75, 300, 75);

    PVector ship = new PVector(0,0);
    PVector wind = new PVector(0,0);
    PImage img;

    Ui(){
        img = loadImage("assets/background.png");
    }

    PVector getValue(String name){
        if(name == "ship"){
            return ship;
        }else if(name == "wind"){
            return wind;
        }
        return new PVector(0,0);
    }

    boolean getState(String name){
        if(name == "start"){
            return startButton.getValue();
        } else if(name == "reset"){
            return resetButton.getValue();
        }
        return false;
    }

    void display() {
        ship = polarToVektor(kursTilVinkel(shipKursInput.getValue()), shipKnobInput.getValue()*metersPrKnob*metersPrPixel);
        wind = polarToVektor(kursTilVinkel(windKursInput.getValue()), windLenInput.getValue()*metersPrPixel);

        image(img, width-height*img.width/img.height, 0, height*img.width/img.height, height);

        drawHeadline("Skibets egenskaber", 20, 30);
        shipKursInput.draw();
        shipKnobInput.draw();

        drawHeadline("Vindens egenskaber", 20, 140);
        windKursInput.draw();
        windLenInput.draw();

        skibKompas.drawCompass(kursTilVinkel(shipKursInput.getValue()), 175, 300);
        vindKompas.drawCompass(kursTilVinkel(windKursInput.getValue()), 75, 300);

        startButton.draw();
        resetButton.draw();

    }

    void resetProperties(){
        shipKursInput.reset();
        shipKnobInput.reset();
        windKursInput.reset();
        windLenInput.reset();
    }
}

void drawHeadline(String text, float x, float y){
    textSize(30);
    fill(255);
    noStroke();
    text(text, x, y);
}



class Compass {
    PVector vektor = new PVector(0,0);
    float x;
    float y;
    float size;

    Compass(float mx, float my, float msize) {
        x = mx;
        y = my;
        size = msize;
    }

    void drawCompass(float angle, int x, int y){
        textSize(20);
        fill(255);
        text("N", x - 5, y - 32.5);
        noFill();
        stroke(255);
        strokeWeight(2);
        circle(x, y, 75);
        PVector v = polarToVektor(angle, 30);
        line(x, y, x + v.x, y + v.y);
    }
}
