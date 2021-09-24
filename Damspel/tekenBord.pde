void tekenBord(int[][] bord) {
  for (int rijTeller = 0; rijTeller < bord.length; rijTeller ++) {
    for (int colTeller = 0; colTeller < bord[rijTeller].length; colTeller ++) {
      // teken zwart vakje als rijTeller + colTeller restwaarde resultaat is gelijk aan een gelijk getal anders wit
      if (((rijTeller % 2) + colTeller) % 2 == 0) {
        fill(0);
      } else {
        fill(255);
      }

      rect(colTeller * BLOCKSIZE, rijTeller * BLOCKSIZE, BLOCKSIZE, BLOCKSIZE);

      // Wanneer de waarde binnen het 2d bord array 1 of 2 is wordt het steentje erop
      // getekend in kleur van de betreffende speler
      if (bord[rijTeller][colTeller] == WAARDE_SPELER1) {
        fill(KLEUR_SPELER1);
        ellipse(colTeller * BLOCKSIZE, rijTeller * BLOCKSIZE, BLOCKSIZE, BLOCKSIZE);
      } else if (bord[rijTeller][colTeller] == WAARDE_SPELER2) {
        fill(KLEUR_SPELER2);
        ellipse(colTeller * BLOCKSIZE, rijTeller * BLOCKSIZE, BLOCKSIZE, BLOCKSIZE);
      }
    }
  }
}
