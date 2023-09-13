//Opret et array af strenge med navnene på månederne i den korrekte rækkefølge (januar, februar, marts, osv.). Skriv en for-løkke, der bytter om på rækkefølgen, så arrayet nu indeholder månederne i omvendt rækkefølge (december, november, oktober, osv.).
String[] months = {"januar", "februar", "marts", "april", "maj", "juni", "juli", "august", "september", "oktober", "november", "december"};
for (int i = 0; i < 12; i++) {
  String temp = months[i];
  months[i] = months[11-i];
  months[11-i] = temp;
}
for (int i = 0; i < 12; i++) {
  println(months[i]);
}