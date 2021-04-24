void gameover() {
  background (black);
  win.play();
  if (leftscore > rightscore) {
    fill(skyBlue);
    text("BLUE WINS!", 400, 300);
  } else {
    fill(crimson);
    text("RED WINS!", 400, 300);
  }
}

void gameoverClicks() {
  mode = Intro;
  leftscore = 0;
  rightscore = 0;
}
