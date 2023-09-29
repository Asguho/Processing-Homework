//Lav en rekursiv funktion “int fib(int t)” der kan retunere et bestemt tal i fibonacci-talrækken. F.eks. fib(6) = 5 og fib(8) = 13.
int fib(int t) {
    if (t == 1 || t <= 0) {
        return 0;
    }
    if (t == 2) {
        return 1;
    }
    
    return fib(t - 1) + fib(t - 2);
}

void setup(){
    size(500, 500);
    int size = 0;
    translate(width/2, height/2);
    for (int i = 2; i < 15; i++) {
        size = fib(i)*10;
        println("size: "+size, i, fib(i-1));
        rect(0, 0, size, size);
        rotate(HALF_PI);
        translate(-fib(i-1)*10, 0);
    }
}

//Lav en anden funktion, som vha. “fib” tegner følgende mønster: https://da.wikipedia.org/wiki/Fibonacci-tal#/media/Fil:FibonacciBlocks.svg

