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

void draw() {
    background(255);
    fill(255);
    rect(characterX+20,characterY-50, 65, 25, 10,10,10,0);
    drawCharacter();
    fill(0);
    text("hello world", characterX+25, characterY-30);

}

void drawCharacter() {
    rect(characterX-20, characterY, 40,100);
    circle(characterX, characterY, 50);
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