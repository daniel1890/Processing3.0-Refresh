int schermHoogte = 500;
int schermBreedte = 500;

// Creeër een nieuw grid wat geshuffled wordt in de setup functie
int[][] puzzleCoordinaten = {
  { 1, 2, 3, 4 }, 
  { 5, 6, 7, 8 }, 
  { 9, 10, 11, 12 }, 
  { 13, 14, 15, 0}, 
};

// Creeër een array met 2 cells wat bijhoudt welke grid rij en column geklikt worden
int[] clickedColEnRij = new int[2];
int clickedCol;
int clickedRij;

// Creeër een variabele waarin bijgehouden wordt of de muis ingeklikt is, dit is nodig zodat maar 1 keer een input gedecteerd wordt; dit voorkomt onnodige bugs
boolean mouseLock = false;

boolean winnendeStaat = false;

void settings() {
  int schermHoogte = 500;
  int schermBreedte = 500;

  size(schermBreedte, schermHoogte);
}


void setup() {
  background(0);
  puzzleCoordinaten = shufflePuzzleCoordinaten(puzzleCoordinaten);
}

void draw() {
  clickedColEnRij = klikPuzzle(puzzleCoordinaten, mouseX, mouseY);
  lockMouse();
  klikPuzzle(puzzleCoordinaten, mouseX, mouseY);
  checkCellenOmGeklikteCell(puzzleCoordinaten, clickedCol, clickedRij);
  tekenPuzzle(puzzleCoordinaten);
  
  winnendeStaat = detecteerWinnendeStaat(puzzleCoordinaten);
  if (winnendeStaat) {
    println("Je hebt gewonnen!");  
  }
}

void mouseReleased() {
  mouseLock = false;
}

// Een functie die de muis op lock zet, er wordt pas weer input gedecteerd wanneer de muisknop released is
void lockMouse() {
  if (mousePressed && !mouseLock) {
    clickedCol = clickedColEnRij[0];
    clickedRij = clickedColEnRij[1];

    println("clicked col en rij: ", clickedCol, clickedRij);
    println("clicked getal: ", puzzleCoordinaten[clickedRij][clickedCol]);
    mouseLock = true;
  }
}

// Teken de puzzlecoördinaten op een grid, met een nested loop teken je makkelijk de cellen op de x- en y- assen
void tekenPuzzle(int[][] puzzleCoordinaten) {
  for (int rijTeller = 0; rijTeller < puzzleCoordinaten.length; rijTeller++) {
    for (int colTeller = 0; colTeller < puzzleCoordinaten[rijTeller].length; colTeller++) {
      float blokjesHoogte = schermHoogte / float(puzzleCoordinaten.length);
      float blokjesBreedte = schermBreedte / float(puzzleCoordinaten[rijTeller].length);

      float textX = colTeller * blokjesBreedte + blokjesBreedte / 2;
      float textY = rijTeller * blokjesBreedte + blokjesHoogte / 2  + 10;

      fill(200);
      rect(colTeller * blokjesBreedte, rijTeller * blokjesHoogte, blokjesBreedte, blokjesHoogte);

      if (puzzleCoordinaten[rijTeller][colTeller] > 0) {
        textSize(30);
        textAlign(CENTER);
        fill(0);
        text(puzzleCoordinaten[rijTeller][colTeller], textX, textY);
      }
    }
  }
}

// Een functie die kliks op het grid detecteerd, met de coördinaten van de puzzle is makkelijk te bepalen waar de randen van elke cel liggen
int[] klikPuzzle(int[][] puzzleCoordinaten, float muisX, float muisY) {
  int[] colsRowsIndexes = { 0, 0 };

  if (mousePressed) {
    for (int rijTeller = 0; rijTeller < puzzleCoordinaten.length; rijTeller++) {
      for (int colTeller = 0; colTeller < puzzleCoordinaten[rijTeller].length; colTeller++) {
        float blokjesHoogte = schermHoogte / float(puzzleCoordinaten.length);
        float blokjesBreedte = schermBreedte / float(puzzleCoordinaten[rijTeller].length);

        int colClicked = floor(muisX / blokjesBreedte);
        int rijClicked = floor(muisY / blokjesHoogte);

        colsRowsIndexes[0] = colClicked;
        colsRowsIndexes[1] = rijClicked;

        return colsRowsIndexes;
      }
    }
  }
  return colsRowsIndexes;
}

// Check de buurman van elke cell dus: boven, rechts, onder en links; wanneer de buurman van de geklikte cell een 0 (dus een leeg getekende cell) is dan wordt de waarde tussen beide cellen geswitched
void checkCellenOmGeklikteCell(int[][] puzzleCoordinaten, int clickedCol, int clickedRij) {
  int restGetal;
  if (clickedCol > 0) {
    if (puzzleCoordinaten[clickedRij][clickedCol - 1] == 0) {
      restGetal = puzzleCoordinaten[clickedRij][clickedCol];
      puzzleCoordinaten[clickedRij][clickedCol] = 0;
      puzzleCoordinaten[clickedRij][clickedCol - 1] = restGetal;
    }
  }
  if (clickedCol < puzzleCoordinaten[0].length - 1) {
    if (puzzleCoordinaten[clickedRij][clickedCol + 1] == 0) {
      restGetal = puzzleCoordinaten[clickedRij][clickedCol];
      puzzleCoordinaten[clickedRij][clickedCol] = 0;
      puzzleCoordinaten[clickedRij][clickedCol + 1] = restGetal;
    }
  }
  if (clickedRij > 0) {
    if (puzzleCoordinaten[clickedRij - 1][clickedCol] == 0) {
      restGetal = puzzleCoordinaten[clickedRij][clickedCol];
      puzzleCoordinaten[clickedRij][clickedCol] = 0;
      puzzleCoordinaten[clickedRij - 1][clickedCol] = restGetal;
    }
  }
  if (clickedRij < puzzleCoordinaten.length - 1) {
    if (puzzleCoordinaten[clickedRij + 1][clickedCol] == 0) {
      restGetal = puzzleCoordinaten[clickedRij][clickedCol];
      puzzleCoordinaten[clickedRij][clickedCol] = 0;
      puzzleCoordinaten[clickedRij + 1][clickedCol] = restGetal;
    }
  }
}

// Een functie die de puzzlecoördinaten ontvangt en deze shuffled, met de ontvangen array wordt bepaalt hoeveel rijen en columns er zijn, hierna wordt elke cell 1 voor 1 gevult met de shuffled lijst
int[][] shufflePuzzleCoordinaten(int[][] puzzleCoordinaten) {
  int aantalGetallen = puzzleCoordinaten[0].length * puzzleCoordinaten.length;
  int[] getallenLijst = new int[aantalGetallen];

  for (int getallenTeller = 0; getallenTeller < aantalGetallen; getallenTeller++) {
    getallenLijst[getallenTeller] = getallenTeller;
  }

  getallenLijst = shuffleGetallenLijst(getallenLijst, aantalGetallen);

  int aantalRijen = puzzleCoordinaten.length;
  int aantalCols = puzzleCoordinaten[0].length;

  int counter = 0;
  
  for (int rijenTeller = 0; rijenTeller < aantalRijen; rijenTeller++) {
    for (int colTeller = 0; colTeller < aantalCols; colTeller++) {
      puzzleCoordinaten[rijenTeller][colTeller] = getallenLijst[counter];
      counter++;
    }
  }
  
  counter = 0;

  return puzzleCoordinaten;
}


// Deze functie shuffled een ontvangen array met getallen uit de array die op een andere plek staan, zie Fisher–Yates shuffle algoritme
int[] shuffleGetallenLijst( int getallenLijst[], int nGetallen) {         
  for (int i = nGetallen-1; i > 0; i--) {
    int randomIndex = int(random(i+1));

    int temp = getallenLijst[i];
    getallenLijst[i] = getallenLijst[randomIndex];
    getallenLijst[randomIndex] = temp;
  }

  println(15 % 15);
  return getallenLijst;
}

// Een functie die detecteert of de gebruiker het spel gewonnen heeft, met de modulo operator kan je een makkelijke "hack" toepassen om van de lengte van de getallenlijst tot 0 te tellen
boolean detecteerWinnendeStaat(int[][] puzzleCoordinaten) {
  int counter = 1;
  int counterMax = 16;
  boolean winnendeStaat = true;
  for (int rijTeller = 0; rijTeller < puzzleCoordinaten.length; rijTeller++) {
    for (int colTeller = 0; colTeller < puzzleCoordinaten[rijTeller].length; colTeller++) {
      if (puzzleCoordinaten[rijTeller][colTeller] != counter % counterMax) {
       winnendeStaat = false;
      }
      
      counter++;
    }
  }
  
  counter = 1;
  
  return winnendeStaat;
}
