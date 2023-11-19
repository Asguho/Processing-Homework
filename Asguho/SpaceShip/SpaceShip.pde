Controlpad controlpad = new Controlpad();
Ship ship1 = new Ship(200,256, "ship1");
Ship ship2 = new Ship(256,200, "ship2");
String currentShip = "ship1";

void setup() {
    fill(150);
    size(512, 512);
}

void draw() {
    background(50);
    controlpad.display();
    ship1.draw();
    ship2.draw();
}

void mousePressed(){
  controlpad.mouseDown();
  ship1.mouseDown();
  ship2.mouseDown();
}

void mouseReleased(){
  controlpad.mouseUp();
  ship1.mouseUp();
  ship2.mouseUp();
}


void method(String action){
  if(action == "Up"){
    if(currentShip == "ship1"){
      ship1.y -= 10;
    }else{
      ship2.y -= 10;
    }
  }else if(action == "Down"){
    if(currentShip == "ship1"){
      ship1.y += 10;
    }else{
      ship2.y += 10;
    }
  }else if(action == "Left"){
    if(currentShip == "ship1"){
      ship1.x -= 10;
    }else{
      ship2.x -= 10;
    }
  }else if(action == "Right"){
    if(currentShip == "ship1"){
      ship1.x += 10;
    }else{
      ship2.x += 10;
    }
  }else if(action == "ship1"){
    currentShip = "ship1";
  }else if(action == "ship2"){
    currentShip = "ship2";
  }
}

class Controlpad { 
  ControlKey[] buttons = {new ControlKey(50, 512-150, "Up"), new ControlKey(50, 512-50, "Down"), new ControlKey(0, 512-100, "Left"), new ControlKey(100, 512-100, "Right")}; 

  void display() {
    for(int i = 0; i < buttons.length; i++){
      buttons[i].draw();
    }
  }

  void mouseDown() {
    for(int i = 0; i < buttons.length; i++){
      buttons[i].mouseDown();
    }
  }

  void mouseUp() {
    for(int i = 0; i < buttons.length; i++){
      buttons[i].mouseUp();
    }
  }
}

class Ship extends Button {
  Ship(int x,int y,String a){
    super(x, y, a);
  }

  void draw (){
    display();
    textAlign(CENTER);
    fill(0);
    text(action, x+25, y+25);
  }
}

class ControlKey extends Button{
  ControlKey(int x,int y,String a){
    super(x, y, a);
  }
  void draw (){
    display();
    textAlign(CENTER);
    fill(0);
    text(action, x+25, y+25);
  }
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
    if(mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h && mousePressed){
      clicked = true;
      method(action);
    }
  }
  
  void mouseUp(){
    clicked = false;    
  }
  
  void display(){
    if(!clicked) fill(255); else fill(100);
    rect(x,y,w,h);  
  }
}