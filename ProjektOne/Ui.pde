class Ui{
    final float metersPrPixel = 200.0/108.0;
    final float metersPrKnob = 0.514;
    TextInputFloat vink = new TextInputFloat("Skib kurs", 20, 60, 0);
    TextInputFloat hast = new TextInputFloat("Skib Hast", 20, 90, 0);
    TextInputFloat vindretning = new TextInputFloat("Vindretning", 20, 170, 0);
    TextInputFloat vindstyrke = new TextInputFloat("Vindstyrke", 20, 200, 0);
    Button startButton = new Button("Start", 20, 250, 100, 50, "start");

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
        text("Skibets egenskaber", 20, 30);

        vink.draw();

        hast.draw();

        textSize(30);
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

boolean isHovering(int x1,int y1,int x2,int y2) {
    if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {
        return true;
    } else {
        return false;
    }   
}
class Button {
    String label;
    int x;
    int y;
    int w;
    int h;
    String onButtonPressMessage;
    Button(String label, int x, int y, int w, int h, String onButtonPressMessage) {
        this.label = label;
        this.x = x;
        this.y = y;
        this.w = w;
        this.h = h;
        this.onButtonPressMessage = onButtonPressMessage;
    }
    void draw(){
        textSize(20);
        noStroke();
        fill(255);
        text(label, x, y);

        noFill();
        strokeWeight(5);
        stroke(255,0,0);
        rect(x,y,x+w, y+h);
    }
    // onButtonPress(onButtonPressMessage);
}

class TextInputFloat {
    String label;
    int x;
    int y;
    float value;
    int state;

    TextInputFloat(
        String mlabel,
        int mx,
        int my,
        float mvalue
    ) {
        label = mlabel;
        x = mx;
        y = my;
        value = mvalue;
        state = 1;
    }

    float getValue() {
        return value;
    }
    
    void draw() {
        textSize(20);
        noStroke();

        text(label, x, y);
        if (state == 1) {
            fill(255);
        } else if (state == -1) {
            fill(255,0,0);
        }
        text(value, x + 100, y);

        fill(255);
        stroke(255);
        strokeWeight(5);
        noFill();

        if (isHovering(x, y-15, int(x + 150 + textWidth(str(value))), y + 15)) {
            //make a red box around the text and the label
            stroke(255,0,0);
            rect(x -20, y - 20, int(200 + textWidth(str(value))), 30);
            stroke(255);
            if (mousePressed) {
                println("pressed");
                if (state == 1) {
                    state = -1;
                }
            }
        }
        type();
    }

    void type() {
        if (state == 1) return;
        //get the number pressed and update the value
        if (keyPressed) {
            
            println(key);
            delay(100);

            if(key == ENTER) {
                state = 1;
                return;
            }
            if (key == BACKSPACE) {
                value = 0;
            }
            if (key == '-') {
                value = -value;
            }
            if (key >= '0' && key <= '9') {
                //add the number to the value
                value = value * 10 + (key - '0');
            }
        }
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
        //draw an N at the top of the compass
        textSize(20);

        text("N", x - 5, y - size/2 - 5);
        circle(x, y, size);
        line(x, y, x + vektor.x, y + vektor.y);
    }

    void update(PVector mvektor) {
        vektor = mvektor;
    }
}