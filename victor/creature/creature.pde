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

void setup() {
    size(400, 400);
    background(255);
}

int x = 200;
int y = 200;

int xvel = 2;
int yvel = 1;


final int diameter = 50;
final int eyeDiameter = 10;
final int mouthLength = 40;
final int speechBubbleWidth = 140;
final int speechBubbleHeight = 25;
final int speechBubbleXOffset = 70;
final int speechBubbleYOffset = 70;
final String speechText = "blablabla :))";

void draw() {
    background(255);
    circle(x, y, diameter);
    // draw the eyes
    circle(x-10, y-10, eyeDiameter);
    circle(x+10, y-10, eyeDiameter);

    // draw the mouth
    line(x-mouthLength/2, y+diameter/4, x+mouthLength/2, y+diameter/4);

    // draw the speech bubble
    fill(255);
    rect(x-speechBubbleXOffset, y-speechBubbleYOffset, speechBubbleWidth, speechBubbleHeight, 10, 10, 10, 10);
    fill(0);
    text(speechText, x-speechBubbleXOffset+10, y-speechBubbleYOffset+18);
    fill(255);

    move();
}


void move() {
    x += xvel;
    y += yvel;

    //check move validity
    //if on wall, bounce

    if (x < diameter/2 || x > width-diameter/2) {
        xvel *= -1;
    }
    if (y < diameter/2 || y > height-diameter/2) {
        yvel *= -1;
    }
}
