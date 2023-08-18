//Opgave beskrivelse
// Afleveringen:
// 
// Opgaven skal laves af højest to personer.
// I skal aflevere “koden” og en “video” hvor forklarer koden, og anvender rigtige fagord
// Krav:
//  Tegn et “væsen” vha. de indbyggede 2D tegnefunktioner
//  Lav en talebobbel på skærmen, ligesom i en tegneserie.
//  Anvend variabler istedet for direkte skrevne tal eller ord
//  Flyt “væsnet” rundt på skærmen. Det må gerne forsvinde ud af billedet, hvis opgaven er lidt svær
//
// Frivilligt:
//  Prøv at få “væsnet” til f.eks at “bounce” eller bevæge sig længere væk så der simuleres en rummelig dimension

class Creature {
  float x;
  float y;
  float xvel;
  float yvel;
    
  final int diameter = 50;
  final int eyeDiameter = 10;
  final int mouthLength = 40;
  final int speechBubbleWidth = 140;
  final int speechBubbleHeight = 25;
  final int speechBubbleXOffset = 70;
  final int speechBubbleYOffset = 70;
  final String speechText = "blablabla :))";
   
  Creature(float x, float y, float xvel, float yvel) {
    this.x = x;
    this.y = y;
    this.xvel = xvel;
    this.yvel = yvel;
  }
    
  void draw() {
    circle(x, y, diameter);
    // draw the eyes
    circle(x - 10, y - 10, eyeDiameter);
    circle(x + 10, y - 10, eyeDiameter);
    
    // draw the mouth
    line(x - mouthLength / 2, y + diameter / 4, x + mouthLength / 2, y + diameter / 4);
    
    // draw the speech bubble
    fill(255, 150); // set alpha value to 150 (translucent)
    rect(x - speechBubbleXOffset, y - speechBubbleYOffset, speechBubbleWidth, speechBubbleHeight, 10, 10, 10, 10);
    fill(0);
    text(speechText, x - speechBubbleXOffset + 10, y - speechBubbleYOffset + 18);
    fill(255);
  }
    
  void move() {
    x += xvel;
    y += yvel;
    
    //if on wall, bounce (reverse velocity)
    if (x < diameter / 2 || x > width - diameter / 2) {
        xvel *= -1;
    }
    if (y < diameter / 2 || y > height - diameter / 2) {
        yvel *= -1;
    }

    // if inside wall, move away from wall
    if (x < diameter / 2) {
        x += 5;
    }
    if (x > width - diameter / 2) {
        x -= 5;
    }
    if (y < diameter / 2) {
        y += 5;
    }
    if (y > height - diameter / 2) {
        y -= 5;
    }
  }
}


Creature[] creatures = new Creature[50];

void setup() {
  size(600, 600);
  fullScreen();
  for (int i = 0; i < creatures.length; i++) {
    creatures[i] = new Creature(random(width), random(height), random(-5, 5), random(-5, 5));
  }
}

void draw() {
  background(50);
    
  for (int i = 0; i < creatures.length; i++) {
    creatures[i].draw();
    creatures[i].move();
  }
}