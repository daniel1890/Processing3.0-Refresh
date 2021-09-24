final int GRIDSIZE = 10;
final int SCREENSIZE = 600;

final int KLEUR_SPELER1 = #0000FF;
final int KLEUR_SPELER2 = #FF0000;
final int BLOCKSIZE = SCREENSIZE / GRIDSIZE;

final int WAARDE_SPELER1 = 1;
final int WAARDE_SPELER2 = 2;

// Maak 2 waardes aan waarin de geklikte Rij en Kolom bewaart worden, wanneer de gebruiker klikt
// worden deze waardes gevult met de laatste waardes.
int[] geklikteRijEnCol = new int[2];

int geklikteRij;
int geklikteCol;
int geklikteRijOud;
int geklikteColOud;

boolean speler1AanDeBeurt = false;
boolean steenVastAanMuis = false;
boolean muisBovenJuisteSpeler;

// Speler 1 steentjes BLAUW worden getekend wanneer waarde van bord 1 is
// Speler 2 steentjes ROOD worden getekend wanneer waarde van bord 2 is
// wanneer de waarde 0 is teken niks
int[][] bord = new int[GRIDSIZE][GRIDSIZE];

void settings() {
  size(SCREENSIZE, SCREENSIZE);
}

void setup() {
  ellipseMode(CORNER);
  bord = beginStaatBord(bord);
}

void draw() {  
  spelLoop();
}

void mousePressed() {
  geklikteRijEnCol = klikBord(bord);

  if (steenVastAanMuis) {
    geklikteRij = geklikteRijEnCol[0];
    geklikteCol = geklikteRijEnCol[1];
  } else if (!steenVastAanMuis) {
    geklikteRijOud = geklikteRijEnCol[0];
    geklikteColOud = geklikteRijEnCol[1];
  }
  println(geklikteRij, geklikteCol);

  bord = beweegSteen(bord);
  steenVastAanMuis = !steenVastAanMuis;


  // for loop om staat van bord te tekenen in console
  for (int i = 0; i < bord.length; i++ ) {
    println();
    for (int j = 0; j < bord[0].length; j++ ) {
      print(bord[i][j]);
    }
  }

  println(steenVastAanMuis);
}

void spelLoop() {
  klikBord(bord);
  tekenBord(bord);
}
