void setup() {
    size(500, 500);
    opg1();
    opg2();
    opg3();
    opg4();
    opg5();
    opg6();
    opg9();
    opg7();
    opg8();
    opg10();
    ekstraoOpgave();
}

void opg1() {
    println("opg 1");
    for (int i = 0; i <= 10; i++) {
        println("i: "+i);
    }

    int i = 0;
    while(i<=10){
        println("i: "+i);
        i++;
    }
}

void opg2() {
    println("opg 2");
    for (int i = 0; i < 10; i+=2) {
            println("i: "+i);
    }

    int i = 0;
    while(i<10){
        println("i: "+i);
        i+=2;
    }
}
void opg3(){
    println("opg 3");
    int sum = 0;
    for (int i = 0; i < 100; i++) {
        sum += i;
    }
    println("sum: "+sum);

    sum = 0;
    int i = 0;
    while(i < 100){
        sum += i;
        i++;
    }
    println("sum: "+sum);
}

void opg4(){
    println("opg 4");
    for (int i = 10; i != 0; i--) {
        println("i: "+i);

    }
    println("while loop");
    int i = 10;
    while(i!=0){
        println("i: "+i);
        i--;
    }
}

// fra nu af laver jeg kun for loops, da det mest er "syntaktisk sukker"

void opg5(){
    //Lav en for og while-løkke, der udskriver gangetabellen for tallet 5 (5, 10, 15, osv. op til 50).
    println("opg 5");
    for (int i = 5; i <= 50; i+=5) {
        println("i: "+i);
    }
}

void opg6(){
    //Lav en for og while-løkke, der udskriver de første 5 potenser af 2 (2^1, 2^2, 2^3, osv.).
    println("opg 6");
    for (int i = 1; i <= 5; i++) {
        println("i: "+pow(2,i));
    }
}

void opg7(){
    //Tegn en for og serie af lodrette linjer ved hjælp af en while-løkke, der ændrer deres x-koordinat for hver gentagelse.
    println("opg 7");
    stroke(0);
    for(int x = 0; x < width; x+=10){
        line(x,0,x,height);
    }
}

void opg8(){
    //Skriv en for og while-løkke, der tegner en spiral ved at ændre både x- og y-koordinaterne for hver gentagelse.
    println("opg 8");
    stroke(255);
    float distance = 0;
    for (float angle = 0; angle < 360*100; angle += .1) {
        float x = width/2 + cos(radians(angle))*distance;
        float y = height/2 + sin(radians(angle))*distance;
        point(x,y);
        distance += .01;
    }
}

void opg9(){
    //Lav en for og while-løkke, der tegner en regnbue af farverige linjer ved at ændre farverne gradvist for hver gentagelse
    println("opg 9");
    for (int i = 0; i < height; i++) {
        colorMode(HSB, 255, 100, 100);
        stroke(round((float(i)/float(height))*255), 100, 100);
        line(0,i,width,i);
    }
}

void opg10(){
    println("opg 10");
    int width = 10;
    int x = 0;
    for (int i = 0; i < 10; i++) {
        rect(x, height-i*10, width, 5);
        x+=width;
        rect(x, height-i*10+5, 5, -10);
        width+=10;
    }
}

void ekstraoOpgave(){
    //lav 10x10 små firkanter i midten af skærmen hvor firkanterne bliver gradvist mere røde nedad og gradvist mere grønne mod højre
    println("ekstra opgave");
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < 10; j++) {
            colorMode(RGB, 255, 255, 255);
            noStroke();
            fill(j*25, i*25, 0);
            rect(width/10*i, height/10*j, width/10, height/10);
        }
    }
}