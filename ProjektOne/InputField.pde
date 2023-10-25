class InputField {
    String label;
    int x;
    int y;
    boolean pressed = false;
    boolean mousePressedLastFrame = false;
    boolean keyPressedLastFrame = false;
    int margin = 20;

    InputField(String _label, int _x, int _y){
        label = _label;
        x = _x;
        y = _y;
    }

    boolean isHovering(int x1,int y1,int x2,int y2) {
        if (mouseX > x1 && mouseX < x2 && mouseY > y1 && mouseY < y2) {
            return true;
        } else {
            return false;
        }   
    }

    void drawLabelAndValue(String value){
        textSize(20);
        noStroke();
        if (pressed == false) {
            fill(255);
        } else if (pressed == true) {
            fill(255,0,0);
        }
        text(label + " " + value, x, y);    
    }

    int getWidth(String value) {
        return int(textWidth(label+" "+value));
    }

    void checkpressed(String value){
        if (isHovering(x-margin, y-margin, x + getWidth(value)+margin, y+margin/2)) {
            stroke(255,0,0);
            strokeWeight(5);
            noFill();
            rect(x - margin, y - margin, getWidth(value) + margin*2, margin*1.5);
            if (mousePressed && (mousePressedLastFrame != mousePressed)) {
                pressed = !pressed;
            }
            mousePressedLastFrame = mousePressed;
        } else {
            if(mousePressed){
                pressed = false;
            }
        }
    }
}

class BoolInputFloat extends InputField{
    boolean value;

    BoolInputFloat(String _label, int _x, int _y, boolean _value) {
        super(_label, _x, _y);
        value = _value;
    }

    boolean getValue() {
        return value;
    }

    void draw() {
        drawLabelAndValue(str(value));
        checkpressed(str(value));
        checkInput();
    }

    void checkInput() {
        if(pressed == true) {
            value = !value;
            pressed = false;
        }
    }
}

class TextInputFloat extends InputField {
    float value;

    TextInputFloat(String _label, int _x, int _y, float _value) {
        super(_label, _x, _y);
        value = _value;
    }

    float getValue() {
        return value;
    }

    void reset() {
        value = 0;
    }
    
    void draw() {
        drawLabelAndValue(str(value));
        checkpressed(str(value));
        checkInput();
    }

    void checkInput() {
        if (pressed == false) return;
        if (keyPressed) {
            if(keyPressed != keyPressedLastFrame) {
                if(key == ENTER) {
                    pressed = false;
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
            keyPressed = keyPressedLastFrame;
        }
    }
}