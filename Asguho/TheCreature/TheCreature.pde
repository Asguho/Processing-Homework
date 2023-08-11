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

int characterX = 200;
int characterY = 200;
final int characterWidth = 40;
final int characterHeight = 100;
final int characterHeadSize = 50;
final int speechBubbleWidth = 65;
final int speechBubbleHeight = 25;
final int speechBubbleRadius = 10;
final int speechBubbleOffsetX = 20;
final int speechBubbleOffsetY = -50;
final String speechText = "hello world";

void draw() {
    background(255);
    fill(255);
    rect(characterX + speechBubbleOffsetX, characterY + speechBubbleOffsetY, speechBubbleWidth, speechBubbleHeight, speechBubbleRadius, speechBubbleRadius, speechBubbleRadius, 0);
    drawCharacter();
    fill(0);
    text(speechText, characterX + speechBubbleOffsetX + 5, characterY + speechBubbleOffsetY - 20);
}

void drawCharacter() {
    rect(characterX - characterWidth / 2, characterY, characterWidth, characterHeight);
    circle(characterX, characterY, characterHeadSize);
}

void keyTyped() {
    if (key == 'w') {
        characterY -= 10;
    } else if (key == 's') {
        characterY += 10;
    } else if (key == 'a') {
        characterX -= 10;
    } else if (key == 'd') {
        characterX += 10;
    }
}