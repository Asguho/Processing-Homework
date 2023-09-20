int[][] liste = new int[3][4];

for (int i = 0; i < liste.length; i++) {
    for (int j = 0; j < liste[i].length; j++) {
        liste[i][j] = (int) (Math.random() * 100);
    }
}

//sum
for (int i = 0; i < liste.length; i++) {
    int sum = 0;
    for (int j = 0; j < liste[i].length; j++) {
        sum += liste[i][j];
    }
    println("Summen af række " + i + " er " + sum);
}