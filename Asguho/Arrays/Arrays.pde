
void setup() {
    {    
        //Opret et array af heltal med 5 elementer og tildel det værdierne 1, 2, 3, 4 og 5. Udskriv arrayet.
        int[] listeHeltal = {1,2,3,4,5};
        for (int tal : listeHeltal) {
            println(tal);
        }
    }
    {
        //Lav et array af strenge, der indeholder navnene på dine yndlingsfarver. Udskriv alle farverne i arrayet.
        String[] yndlingsfarver = {"rød", "blå", "grøn", "gul", "lilla"};
        for (String farve : yndlingsfarver) {
            println(farve);
        }
    }
    {    
        //Lav et array af strenge, der indeholder navnene på dine yndlingsfarver. Udskriv alle farverne i arrayet.
        float[] temperaturer = {10.2, 15.3, 20.5, 25.9, 30.6};
        float sum = 0;
        for (float temp : temperaturer) {
            sum += temp;
        }
        println("Gennemsnitstemperaturen er " + sum/temperaturer.length);
    }
    {
        //Lav et array af boolean-værdier, der repræsenterer tilstanden af ​​10 lamper (tændt/slukket). Skriv en løkke, der tænder alle lamperne. (prøv at se om du kan gøre det grafisk)
        boolean[] lamper = new boolean[10];
        for (int i = 0; i < lamper.length; i++) {
            lamper[i] = true;
        }
        for (boolean lampe : lamper) {
            println(lampe);
        }
    }
    {
        //Byt om på det første og sidste element i et array. (uanset indhold)
        int[] listeHeltal = {1,2,3,4,5};
        int temp = listeHeltal[0];
        listeHeltal[0] = listeHeltal[listeHeltal.length-1];
        listeHeltal[listeHeltal.length-1] = temp;
        for (int tal : listeHeltal) {
            println(tal);
        }
    }
    {
        //Opret et array af strenge med navnene på forskellige frugter. Brug en for-løkke til at finde og udskrive indekset (positionen) for den første forekomst af “æble” i arrayet.
        String[] frugter = { "pære", "banan", "æble", "kiwi", "æble"};
        for (int i = 0; i < frugter.length; i++) {
            if (frugter[i].equals("æble")) {
                println("Første forekomst af æble er på position " + i);
                break;
            }
        }
    }
    {
        //Opret et array af strenge med navnene på månederne i den korrekte rækkefølge (januar, februar, marts, osv.). Skriv en for-løkke, der bytter om på rækkefølgen, så arrayet nu indeholder månederne i omvendt rækkefølge (december, november, oktober, osv.).
        String[] måneder = { "januar", "februar", "marts", "april", "maj", "juni", "juli", "august",
            "september", "oktober", "november", "december"};
        for (int i = 0; i < måneder.length/2; i++) {
            String temp = måneder[i];
            måneder[i] = måneder[måneder.length-1-i];
            måneder[måneder.length-1-i] = temp;
        }
        for (String måned : måneder) {
            println(måned);
        }
    }
}



