//Opgave beskrivelse
// Afleveringen:
// 
// Opgaven skal laves af højest to personer.
// I skal aflevere “koden” og en “video” hvor forklarer koden, og anvender rigtige fagord
//
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

int diameter = 50;
int eyeDiameter = 10;
int mouthLength = 20;
int speechBubbleWidth = 140;
int speechBubbleHeight = 25;
int speechBubbleXOffset = 70;
int speechBubbleYOffset = 70;

String speechText = "Mit navn er Bob";

void draw() {
    background(255);
    
    drawCreature();
    moveCreature();
}

void drawCreature() {
    // tegn cirklen
    fill(255);
    circle(x, y, diameter);

    // tegn øjnene
    circle(x - 10, y - 10, eyeDiameter);
    circle(x + 10, y - 10, eyeDiameter);
    
    // tegn munden
    line(x - mouthLength / 2, y + 10, x + mouthLength / 2, y + 10);
    
    // tegn taleboblen
    rect(x - speechBubbleXOffset, y - speechBubbleYOffset, speechBubbleWidth, speechBubbleHeight, 10);
    fill(0);
    text(speechText, x - speechBubbleXOffset + 10, y - speechBubbleYOffset + 18);
    fill(255);
}


void moveCreature() {
    // flyt cirklen
    x += xvel;
    y += yvel;
    
    // bounce, hvis den rammer kanten
    
    if (x < diameter / 2 || x > width - diameter / 2) {
        xvel *= -1;
    }
    if (y < diameter / 2 || y > height - diameter / 2) {
        yvel *= -1;
    }
}