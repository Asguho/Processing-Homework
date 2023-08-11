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

int characterX = 200;
int characterY = 200;

final int WHITE = 255;
final int BLACK = 0;
final int CANVA_SIZE = 512;

final int CHARACTER_SIZE = 50;
final int CHARACTER_WIDTH = 40;
final int CHARACTER_HEIGHT = 100;
final int CHARACTER_SPEED = 10;
final int CHARACTER_HEAD_SIZE = 50;
final int CHARACTER_BODY_OFFSET = 20;

final int speechBubbleWidth = 65;
final int speechBubbleHeight = 25;
final int speechBubbleRadius = 10;
final int speechBubbleSharpRadius = 0;
final int speechBubbleOffsetX = 20;
final int speechBubbleOffsetY = -50;
final int speechBubbleTextOffsetX = 25;
final int speechBubbleTextOffsetY = -30;
final String speechText = "hello world";


void setup() {
    size(CANVA_SIZE, CANVA_SIZE);
    background(WHITE);
}



void draw() {
    background(WHITE);
    fill(WHITE);
    rect(characterX + speechBubbleOffsetX, characterY + speechBubbleOffsetY, speechBubbleWidth, speechBubbleHeight, speechBubbleRadius, speechBubbleRadius, speechBubbleRadius, speechBubbleSharpRadius);
    drawCharacter();
    fill(BLACK);
    text(speechText, characterX+speechBubbleTextOffsetX, characterY-speechBubbleTextOffsetY);
}

void drawCharacter() {
    rect(characterX-CHARACTER_BODY_OFFSET, characterY, CHARACTER_WIDTH,CHARACTER_HEIGHT);
    circle(characterX, characterY, CHARACTER_HEAD_SIZE);
}

void keyTyped() {
    if (key == 'w') {
        characterY -= CHARACTER_SPEED;
    } else if (key == 's') {
        characterY += CHARACTER_SPEED;
    } else if (key == 'a') {
        characterX -= CHARACTER_SPEED;
    } else if (key == 'd') {
        characterX += CHARACTER_SPEED;
    }
}