void setup() {
    opg1();
    opg2();
    opg4();
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
    for (int i = 10; i != 0; i--) {
        sum += i;

    }
    println("while loop");
    int i = 10;
    while(i!=0){
        sum += i;
        i--;
    }
}

void opg4(){
    println("opg 3");
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

