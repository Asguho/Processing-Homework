// Opgaver i funktions terminologi
// Opgave 1: Forklar begrebet funktion i programmering, herunder betydningen af et funktionskald. Giv et eksempel.

// En function er en kodeblok som kan bruges flere gange. Når man køre koden i en function, så kaldes det et funktionskald.

// Opgave 2: Definér parametre, argumenter og metode-krop i programmering. Giv et eksempel

// Parametre er varabler man kan parse til functionen. Argumenter er værdierne som bliver sendt til functionen. Metode-krop er koden som bliver kørt i functionen.

// Opgave 3: Forklar begrebet variabel-scope i programmering. Og forskellen på lokale variable og globale variable. Giv et eksempel

// Variabel-scope er hvor en variabel kan bruges. Lokale variable kan kun bruges i den function de er defineret i. Globale variable kan bruges i hele programmet.

// Opgave 4: Definér returtype og returværdi i programmering.

// Returtype er typen af værdi som bliver returneret. Returværdi er værdien som bliver returneret.


// Opgaver i programmering af funktioner
// Opgave 5: Skab “givHilsen”, en funktion med to inputparametre: en liste af hilsner og et tal, der bestemmer hvilken hilsen der skal returneres.
String givHilsen(String[] hilsner, int tal) {
    return hilsner[tal];
}
// Opgave 6: Implementer “beregnAreal”, en funktion til at beregne og returnere arealet af en vilkårlig cirkel.
double beregnAreal(double radius) {
    return Math.PI * Math.pow(radius, 2);
}
// Opgave 7: Skriv en funktion, der kan håndtere et vilkårligt antal punkter og skabe en tegning, der forbinder dem.
void tegnLinje(PVector[] punkter) {
    for (int i = 0; i < punkter.length-1; i++) {
            line(punkter[i].x, punkter[i].y, punkter[i + 1].x, punkter[i + 1].y);
    }
}
// Opgave 8: Frivillig: Udvikl en funktion, der kan tegne en vilkårlig N-kant med et valgfrit centrum.
void tegnPolygon(PVector[] punkter, float x, float y) {
    for (int i = 0; i < punkter.length; i++) {
            line(punkter[i].x+x, punkter[i].y+y, punkter[(i + 1)%punkter.length].x+x, punkter[(i + 1)%punkter.length].y+y);
    }
}

void setup() {
    size(500, 500);
    background(255);
    stroke(0);
    strokeWeight(2);
    PVector[] punkter = new PVector[4];
    punkter[0] = new PVector(100, 100);
    punkter[1] = new PVector(200, 100);
    punkter[2] = new PVector(200, 200);
    punkter[3] = new PVector(100, 200);

    tegnPolygon(punkter, 100, 100);

}

void draw() {
    
}
