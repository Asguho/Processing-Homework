Bubble[] bubbles = new Bubble[10];

void setup() {
  size(480, 270);
    for(int i = 0; i < 10; i++) {
      bubbles[i] = new Bubble(random(5,50));
    }
}

void draw() {
  background(255);
  for(Bubble b : bubbles) {
    b.ascend();
    b.display();
  }
}