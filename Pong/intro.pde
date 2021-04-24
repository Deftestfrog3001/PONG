void intro () {
  textFont(DOOM);
  background (crimson);
  strokeWeight (5);
  textSize (150);
  stroke( black);
  fill(black);
  text("PONG!", 400, 300);
  textSize (50);
  introM.play();

  //1player
  tactileR (100, 500, 200, 100);
  fill(75);
  rect (100, 500, 200, 100);
  fill(0);
  text ("1 player", 200, 550);
  fill(75);

  //2player
  tactileR(100, 500, 200, 100);
  rect (500, 500, 200, 100);
  fill(0);
  text ("2 player", 600, 550);
  fill(75);
}

void introClicks () {
  //1player
  if (mouseX > 100 && mouseX < 300 && mouseY > 500 && mouseY < 600) {
    mode = Game;
    AI = true;
  }
  //2player
  if (mouseX > 500 && mouseX < 700 && mouseY > 500 && mouseY < 600) {
    mode = Game;
    AI = false;
  }
}
