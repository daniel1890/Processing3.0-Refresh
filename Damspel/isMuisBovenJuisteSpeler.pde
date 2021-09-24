boolean isMuisBovenJuisteSpeler(int[][] bord) {
  boolean juisteSpelerIsGeklikt = false;

  if (speler1AanDeBeurt && (bord[geklikteRij][geklikteCol] == WAARDE_SPELER1 || bord[geklikteRijOud][geklikteColOud] == WAARDE_SPELER1)) {
    juisteSpelerIsGeklikt = true;
  } else if (speler1AanDeBeurt == false && (bord[geklikteRij][geklikteCol] == WAARDE_SPELER2 || bord[geklikteRijOud][geklikteColOud] == WAARDE_SPELER2)) {
    juisteSpelerIsGeklikt = true;
  }


  return juisteSpelerIsGeklikt;
}
