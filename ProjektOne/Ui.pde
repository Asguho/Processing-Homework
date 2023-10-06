TextInputFloat vink = new TextInputFloat("Skib Vinkel", 20, 60, 0);
TextInputFloat hast = new TextInputFloat("Skib Hast", 20, 90, 0);
TextInputFloat vindretning = new TextInputFloat("Vindretning", 20, 170, 0);
TextInputFloat vindstyrke = new TextInputFloat("Vindstyrke", 20, 200, 0);

PVector skib = new PVector(0,0);
PVector vind = new PVector(0,0);

class Ui{
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
        image(img, width*1/3, 0);
        textSize(30);
        text("Skibets egenskaber", 20, 30);

        vink.draw();

        hast.draw();

        textSize(30);
        text("Vind egenskaber", 20, 140);

        vindretning.draw();

        vindstyrke.draw();
    }
}

boolean isHovering(int x1,int y1,int x2,int y2) {
    if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {
        return true;
    } else {
        return false;
    }   
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

        if (isHovering(x -20, y - 20, int(x + 100 + textWidth(str(value))), y + 20)) {
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
            //if the key is a number
            if (key >= '0' && key <= '9') {
                //add the number to the value
                value = value * 10 + (key - '0');
            }
        }
    }
}
