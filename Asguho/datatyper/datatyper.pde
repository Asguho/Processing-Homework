void setup() {
    // Arbejde med Primitiver: Opret to variabler af typen int og tildel dem samme værdi. Prøv at ændre værdien af den ene variabel og se, hvordan det påvirker den anden.
    {
        int a = 1;
        int b = a;
        a = 2;
        println(b);
    }
    // Arbejde med Primitiv Arrays: Opret et primitivt array, f.eks. int[], og tildel det til en anden reference. Prøv at ændre værdierne i det originale array og se, om det påvirker den anden reference.
    {
        int[] a = {1, 2, 3};
        int[] b = a;
        a[0] = 4;
        println(b[0]);
    }
    // Arbejde med Arrays: Opret et array af strenge og tildel det til en anden reference. Fjern eller tilføj elementer til det originale array og se, hvordan det påvirker den anden reference.
    {
        String[] a = {"a", "b", "c"};
        String[] b = a;
        a[0] = "d";
        println(b[0]);
    }
}

