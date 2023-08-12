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

final int CHARACTER_SIZE = 50;
final int CHARACTER_WIDTH = 40;
final int CHARACTER_HEIGHT = 100;
final int CHARACTER_SPEED = 10;
final int CHARACTER_HEAD_SIZE = 50;
final int CHARACTER_BODY_OFFSET = 20;

final int SPEECH_BUBBLE_WIDTH = 65;
final int SPEECH_BUBBLE_HEIGHT = 25;
final int SPEECH_BUBBLE_RADIUS = 10;
final int SPEECH_BUBBLE_SHARP_RADIUS = 0;
final int SPEECH_BUBBLE_OFFSET_X = 20;
final int SPEECH_BUBBLE_OFFSET_Y = -50;
final int SPEECH_BUBBLE_TEXT_OFFSET_X = 25;
final int SPEECH_BUBBLE_TEXT_OFFSET_Y = -30;
final String SPEECH_TEXT = "hello world";

void drawCharacter() {
    fill(WHITE);
    rect(characterX - CHARACTER_BODY_OFFSET, characterY, CHARACTER_WIDTH, CHARACTER_HEIGHT);
    circle(characterX, characterY, CHARACTER_HEAD_SIZE);
}

void drawSpeechBubble() {
    fill(WHITE);
    rect(characterX + SPEECH_BUBBLE_OFFSET_X, characterY + SPEECH_BUBBLE_OFFSET_Y, SPEECH_BUBBLE_WIDTH, SPEECH_BUBBLE_HEIGHT, SPEECH_BUBBLE_RADIUS, SPEECH_BUBBLE_RADIUS, SPEECH_BUBBLE_RADIUS, SPEECH_BUBBLE_SHARP_RADIUS);
    fill(BLACK);
    text(SPEECH_TEXT, characterX + SPEECH_BUBBLE_TEXT_OFFSET_X, characterY + SPEECH_BUBBLE_TEXT_OFFSET_Y);
}

void setup() {
    size(512, 512);
    background(WHITE);
}

void draw() {
    background(WHITE);
    drawCharacter();
    drawSpeechBubble();
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

    if(characterX > width) {
        characterX = 0;
    } else if(characterX < 0) {
        characterX = width;
    }

    if(characterY > height) {
        characterY = 0;
    } else if(characterY < 0) {
        characterY = height;
    }
}

