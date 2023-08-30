class Score {
    int score;

    void display() {
        fill(0);
        textSize(32);
        text(score, 10, 30);
    }
    void increment() {
        score++;
    }
}