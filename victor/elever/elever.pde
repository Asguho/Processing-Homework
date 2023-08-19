void setup() {
    size(400,400);
    textSize(30);
}

void draw() {
    clear();
    text(random_elev,50,200);
}

void mousePressed() {
    random_elev = navne[(int)random(0,navne.length)]; 
}

String random_elev = "tryk med musen";

String[] navne = {"Alexander Carlmann",
    "Anton Snabe Engelhart",
    "Asger Munk",
    "Aske",
    "August Karoli Nørby",
    "Bunyakorn War",
    "Callum Finn",
    "Elliot Roland",
    "Elmer Steen",
    "Emilie Asta",
    "Gustav Emil Kaad",
    "Gustav Westenberg Bjørn",
    "Kathrine Lolle",
    "Kritik",
    "Lukas Wai Lok Chan",
    "Mads Christian Scheel",
    "Marcus Modest",
    "Maria",
    "Marina Frederikke Hald",
    "Mattias Krusell",
    "Mikkel Agergaard",
    "Mikkel Cetti",
    "Mikkel Lassenius Kaarup",
    "Neel Smidt",
    "Nojus",
    "Oliver",
    "Paris Xuetong",
    "Poul Gustav Berenthz",
    "Sofie",
    "Victor Østergaard",
    "Viggo Gringer",
    "William Brogaard"};