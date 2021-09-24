int[][] beweegSteen(int[][] bord) {
  muisBovenJuisteSpeler = isMuisBovenJuisteSpeler(bord);
  
  if (steenVastAanMuis == true && muisBovenJuisteSpeler) {
    if (speler1AanDeBeurt == true) {
      bord[geklikteRij][geklikteCol] = WAARDE_SPELER1;
      bord[geklikteRijOud][geklikteColOud] = 0;
    } else if (speler1AanDeBeurt == false) {
      bord[geklikteRij][geklikteCol] = WAARDE_SPELER2;
      bord[geklikteRijOud][geklikteColOud] = 0;
    }

    speler1AanDeBeurt = !speler1AanDeBeurt;
  }

  return bord;
}
