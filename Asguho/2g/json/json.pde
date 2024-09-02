JSONObject json = new JSONObject();

void setup() {
    manipulererData();
    print();
    exit();
}
void createJSON(){
    json.setString("fornavn", "Lucas");
    json.setString("efternavn", "Hansen");
    json.setInt("alder", 18);
    json.setBoolean("erStudent", false);
    JSONArray array = new JSONArray();
    array.append("Matematik");
    array.append("Fysik");
    json.setJSONArray("fag",array);
    JSONObject adresse = new JSONObject();
    adresse.setString("gade", "Bredgade 12");
    adresse.setString("by", "Odense");
    adresse.setInt("postnummer", 5000);
    json.setJSONObject("adresse", adresse);
    JSONArray telefonnumre = new JSONArray();
    JSONObject telefon1 = new JSONObject();
    telefon1.setString("type", "hjem");
    telefon1.setString("nummer", "12345678");
    telefonnumre.append(telefon1);
    JSONObject telefon2 = new JSONObject();
    telefon2.setString("type", "mobil");
    telefon2.setString("nummer", "87654321");
    telefonnumre.append(telefon2);
    json.setJSONArray("telefonnumre", telefonnumre);
}

void saveFile(){
    saveJSONObject(json, "data.json");
}

void loadFile(){
   json = loadJSONObject("data.json");
}

void manipulererData(){
    loadFile();
    // ændre int
    int alder = json.getInt("alder");
    alder++;
    json.setInt("alder", alder);

    // ændre boolean
    json.setBoolean("erStudent", !json.getBoolean("erStudent"));

    // ændre JSONArray
    JSONArray telefonnumre = json.getJSONArray("telefonnumre");
    JSONObject telefon3 = new JSONObject();
    telefon3.setString("type", "arbejde");
    telefon3.setString("nummer", "87654321");
    telefonnumre.append(telefon3);
    json.setJSONArray("telefonnumre", telefonnumre);

    saveFile();
}
void print(){
    loadFile();
    JSONArray telefoner = json.getJSONArray("telefonnumre");
    
    for(int i=0; i<telefoner.size();i++){
        JSONObject telefon = telefoner.getJSONObject(i);
        println(telefon.getString("type") + " " + telefon.getString("nummer"));
    }
}
