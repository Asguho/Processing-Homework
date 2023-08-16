void setup() {
  size(400, 400);
  castTypes();
}

void draw() {
  background(255);
  fill(0);
  ellipse(mouseX, mouseY, 50, 50);
}

void castTypes(){
    int data = 10;
    String dataString = str(data);
    float dataFloat = float(data);
    char dataChar = char(data);
    byte dataByte = byte(data);
    println(data);
    println(dataString);
    println(dataFloat);
    println(dataChar);
    println(dataByte);
}