boolean checkLegaleZet(int[][] bord, int geklikteRij, int geklikteCol, int geklikteRijOud, int geklikteColOud) {
  boolean isLegaleZet = false;

  if (((geklikteRij - geklikteRijOud < 2) && geklikteRijOud - geklikteRij < 2) &&
    (geklikteCol - geklikteColOud < 2 && geklikteColOud - geklikteCol < 2) &&
    ((geklikteRij % 2) + geklikteCol) % 2 == 0) {
    isLegaleZet = true;
  }

  println(isLegaleZet, geklikteRij - geklikteRijOud, geklikteRijOud - geklikteRij, geklikteCol - geklikteColOud, geklikteColOud - geklikteCol);
  return isLegaleZet;
}
