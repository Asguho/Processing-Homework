class Ui{
    final float metersPrPixel = 200.0/108.0;
    final float metersPrKnob = 0.514;
    TextInputFloat vink = new TextInputFloat("Skib kurs", 20, 60, 0);
    TextInputFloat hast = new TextInputFloat("Skib Hast", 20, 90, 0);
    TextInputFloat vindretning = new TextInputFloat("Vindretning", 20, 170, 0);
    TextInputFloat vindstyrke = new TextInputFloat("Vindstyrke", 20, 200, 0);

    BoolInputFloat startButton = new BoolInputFloat("Start", 20, 650, false);

    Compass skibKompas = new Compass(175, 300, 75);
    Compass vindKompas = new Compass(75, 300, 75);

    PVector skib = new PVector(0,0);
    PVector vind = new PVector(0,0);
    
    PImage img;
    Ui(){
        img = loadImage("assets/background.png");
    }

    PVector getValue(String name){
        if(name == "skib"){
            return skib;
        }else if(name == "vind"){
            return vind;
        }
        return new PVector(0,0);
    }

    void display() {
        image(img, width-height*img.width/img.height, 0, height*img.width/img.height, height);
        textSize(30);
        fill(255);
        noStroke();
        text("Skibets egenskaber", 20, 30);

        vink.draw();

        hast.draw();

        textSize(30);
        fill(255);
        noStroke();
        text("Vind egenskaber", 20, 140);

        vindretning.draw();

        vindstyrke.draw();

        skib = polarToVektor(kursTilVinkel(vink.getValue()), hast.getValue()*metersPrKnob*metersPrPixel);
        vind = polarToVektor(vindretning.getValue(), vindstyrke.getValue()*metersPrPixel);

        skibKompas.update(polarToVektor(kursTilVinkel(vink.getValue()), hast.getValue()*metersPrKnob*metersPrPixel));
        vindKompas.update(polarToVektor(vindretning.getValue(), vindstyrke.getValue()*metersPrPixel));

        skibKompas.draw();
        vindKompas.draw();


        startButton.draw();

    }
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

    void draw() {
        textSize(20);
        text("N", x - 5, y - size/2 - 5);
        noFill();
        stroke(255);
        strokeWeight(2);
        circle(x, y, size);
        line(x, y, x + vektor.x, y + vektor.y);
    }

    void update(PVector mvektor) {
        vektor = mvektor;
    }
}