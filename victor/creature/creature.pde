




// TODO: få klasse til at virke!!!




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
    float classx;
    float classy;
    float classxvel;
    float classyvel;

    int colorOffset = 0;

    final int diameter = 50;
    final int eyeDiameter = 10;
    final int mouthLength = 40;
    final int speechBubbleWidth = 140;
    final int speechBubbleHeight = 25;
    final int speechBubbleXOffset = 70;
    final int speechBubbleYOffset = 70;
    final String speechText = "blablabla :))";

    Creature(float x, float y, float xvel, float yvel) {
        classx = x;
        classy = y;
        classxvel = xvel;
        classyvel = yvel;
    }

    void draw() {
        background(255);
        circle(classx, classy, diameter);
        // draw the eyes
        circle(classx-10, classy-10, eyeDiameter);
        circle(classx+10, classy-10, eyeDiameter);

        // draw the mouth
        line(classx-mouthLength/2, classy+diameter/4, classx+mouthLength/2, classy+diameter/4);

        // draw the speech bubble
        fill(255);
        rect(classx-speechBubbleXOffset, classy-speechBubbleYOffset, speechBubbleWidth, speechBubbleHeight, 10, 10, 10, 10);
        fill(0);
        text(speechText, classx-speechBubbleXOffset+10, classy-speechBubbleYOffset+18);
        fill(255);
    }

    void move() {
        classx += classxvel;
        classy += classyvel;

        //check move validity
        //if on wall, bounce

        if (classx < diameter/2 || classx > width-diameter/2) {
                classxvel *= -1;
        }
        if (classy < diameter/2 || classy > height-diameter/2) {
                classyvel *= -1;
        }
    }
}


Creature[] creature = new Creature[2];

void setup() {
    size(400, 400);
    background(255);
    creature[0] = new Creature(width/2, height/2, 1, 1);

    //make another creature
    creature[1] = new Creature(width/2, height/2, 2, 1);
}

void draw() {
    creature[0].draw();
    creature[0].move();

    creature[1].draw();
    creature[1].move();
}

