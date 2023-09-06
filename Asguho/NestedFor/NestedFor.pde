
// void setup(){
//     size(500, 500);
//     for (int i = 0; i < 10; i++) {
//         for (int j = 0; j < 10; j++) {
//             circle(width/10*i+20, height/10*j+20, width/20);
//         }
//     }
// }

// void setup(){
//     size(500, 500);
//     for (int i = 0; i < 10*10; i++) {
//         fill((i+(width/10*i)/width)%2*255);
//         square((width/10*i)%width, ((width/10*i)/width)*width/10, width/10);
//     }
// }

void setup() {
    size(500, 500);
    for (int i = 0; i < 50; ++i) {
        for (int j = 0; j < i; ++j) {
            fill(i/50.0*255);
            rect(j*10, i*10, 10, 10);
        }
    }
}


