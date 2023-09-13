size(500,500);
background(0);

int i = 0;
while(i < 50) {
    int j = 0;
    while(j < i) {
        rect(j * 10, i * 10, 10, 10);
        j++;
    }
    i++;
}