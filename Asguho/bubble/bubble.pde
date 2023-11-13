class Bubble {

  float x;
  float y;
  float diameter;

  Bubble(float _diameter) {
    x = width/2;
    y = height;
    diameter = _diameter;
  }

  void ascend() {
    y--;
    x = x + random(-2,2);
    top();
  }

  void display() {
    stroke(0);
    fill(127);
    ellipse(x, y, diameter, diameter);
  }

  void top() {
    if (y < diameter/2) {
      y = diameter/2;
    }
  }
}