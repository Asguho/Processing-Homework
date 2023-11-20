class InputField {
    String label;
    int x;
    int y;
    String unit;
    boolean pressed = false;
    boolean mousePressedLastFrame = false;
    boolean keyPressedLastFrame = false;
    boolean showValue = true;
    int margin = 20;

    InputField(String _label, int _x, int _y, String _unit, boolean _showValue){
        label = _label;
        x = _x;
        y = _y;
        unit = _unit;
        showValue = _showValue;
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
        text(label + " " + (showValue ? value : "") + " " + unit, x, y);    
    }

    int getWidth(String value) {
        return int(textWidth(label + " " + (showValue ? value : "") + " " + unit));
    }

    void checkpressed(String value){
        if (isHovering(x-margin, y-margin, x + getWidth(value)+margin, y+margin/2)) {
            stroke(255,0,0);
            strokeWeight(5);
            noFill();
            rect(x - margin, y - margin, getWidth(value) + margin*2, margin*1.5);
            pressed = mousePressed;
        } else {
            if(mousePressed){
                pressed = false;
            }
        }
    }
}

class BoolInputFloat extends InputField{
    boolean value;

    BoolInputFloat(String _label, int _x, int _y, boolean _value, String _unit, boolean _showValue) {
        super(_label, _x, _y, _unit, _showValue);
        value = _value;
    }

    boolean getValue() {
        return value;
    }

    void reset() {
        value = false;
    }

    void draw() {
        checkpressed(str(value));
        drawLabelAndValue(str(value));
        checkInput();
    }

    void checkInput() {
        value = pressed;
    }
}

class ButtonSet{
    int x,y,value;
    BoolInputFloat plus,minus,reset;

    ButtonSet(int _x,int _y){
        x = _x;
        y = _y;
        plus = new BoolInputFloat("plus", x+100, y+100, false, "", false);
        minus = new BoolInputFloat("minus", x+100, y+150, false, "", false);
        reset = new BoolInputFloat("reset", x+100, y+200, false, "", false);
    }

    void draw(){
        plus.draw();
        minus.draw();
        reset.draw();

        if (plus.getValue()) {
            value++;
        }
        if (minus.getValue()) {
            value--;
        }
        if (reset.getValue()) {
            value = 0;
        }
        rect(x+200,y+125,value,25);
    }
}

ButtonSet first,second,third;
void setup(){
    size(1000,1000);
    first = new ButtonSet(0,0);
    second = new ButtonSet(0,200);
    third = new ButtonSet(0,400);
}

void draw(){
    background(0);
    first.draw();
    second.draw();
    third.draw();
}
