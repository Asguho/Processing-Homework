
PVector polarToVektor(float angle, float length) {
    float x = length * cos(angle);
    float y = length * sin(angle);
    return new PVector(x, y);
}