PVector polarToVektor(float angle, float length) {  
    float x = length * cos(radians(angle));
    float y = -(length * sin(radians(angle)));
    return new PVector(x, y);
}
float kursTilVinkel(float kurs) {
    return 90-kurs;
}