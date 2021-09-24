int[][] beginStaatBord(int[][] bord) {
  for (int rijTeller = 0; rijTeller < bord.length; rijTeller ++) {
    for (int colTeller = 0; colTeller < bord[rijTeller].length; colTeller ++) {
      bord[rijTeller][colTeller] = 0;
    }
  }

  // Maak steentjes speler 1 BLAUW
  for (int rijTeller = 0; rijTeller < 4; rijTeller ++) {
    for (int colTeller = 0; colTeller < bord[rijTeller].length; colTeller ++) {
      if ((rijTeller + colTeller) % 2 == 0) {
        bord[rijTeller][colTeller] = 1;
      }
    }
  }

  // Maak steentjes speler 2 ROOD
  for (int rijTeller = 6; rijTeller < bord.length; rijTeller ++) {
    for (int colTeller = 0; colTeller < bord[rijTeller].length; colTeller ++) {
      if ((rijTeller + colTeller) % 2 == 0) {
        bord[rijTeller][colTeller] = 2;
      }
    }
  }

  return bord;
}
