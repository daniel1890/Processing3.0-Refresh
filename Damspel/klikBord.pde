int[] klikBord(int[][] bord) {
  int[] geklikteRijEnCol = new int[2];

  if (mousePressed) {
    geklikteRijEnCol[0] = floor(mouseY / BLOCKSIZE);
    geklikteRijEnCol[1] = floor(mouseX / BLOCKSIZE);
  }

  return geklikteRijEnCol;
}
