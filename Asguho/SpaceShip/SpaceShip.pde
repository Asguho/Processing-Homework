Controlpad controlpad = new Controlpad();
Ship[] ships = {new Ship(), new Ship()};

void setup() {
    size(512, 512);
}

void draw() {
    
}

class Controlpad { 
    Button buttonUp = new Button(25, 512-25, "Up");
}

class Ship extends Button {
  
}

class Button{
  String action;
  boolean clicked;
  int x, y, w=50, h=50;
  
  Button(int x,int y,String a){
    action = a;
    this.x = x;
    this.y = y;
  }
  
  void mouseDown(){
    if(mouseX > x && mouseX < x + w && mouseY > y  && mousePressed){
      clicked = true;
      method(action);
    }
  }
  
  void mouseUp(){
    clicked = false;    
  }
  
  void display(){
    if(!clicked) fill(255); else fill(0);
    rect(x,y,w,h);  
  }
}