void game() {
  background(0);
  fill(white);
  stroke(white);
  line(400, 0, 400, 600);
  introM.pause();

  //scoreboard
  textSize (50);
  fill (skyBlue);
  text(leftscore, width/4, 100);
  fill (crimson);
  text(rightscore, 3*width/4, 100);
  textSize (75);
  //text(timer, width/2, 100);
  timer = timer - 1;

  //draw paddles
  fill(skyBlue);
  circle(leftx, lefty, leftd);
  fill(crimson);
  circle(rightx, righty, rightd);

  //move paddles
  if (wkey == true) lefty = lefty - 5;
  if (skey == true) lefty = lefty + 5;

  if (AI == false) {
    if (upkey == true) righty = righty - 5;
    if (downkey == true) righty = righty + 5;
  } else {
    if (ballx > 400) {
      if (bally < righty) righty = righty - 2.5;
      if (bally > righty) righty = righty + 2.5;
    }
  }

  //paddle limits
  if (lefty <= 110) lefty = 110;
  if (lefty >= 490) lefty = 490;
  if (righty <= 110) righty = 110;
  if (righty >= 490) righty = 490;  

  //draw ball
  if (ballx < 400) {
    fill (skyBlue);
  } else {
    fill (crimson);
  }
  circle(ballx, bally, balld);

  //move ball
  if (timer < 0) {
    ballx  = ballx + ballvx;
    bally  = bally + ballvy;
  }
  if (dist(ballx, bally, leftx, lefty) <= balld/2 + leftd/2) {
    ballvx = (ballx - leftx)/15;
    ballvy = (bally - lefty)/15;
    bounce.rewind();
    bounce.play();
  }
  if (dist(ballx, bally, rightx, righty) <= balld/2 + rightd/2) {
    ballvx = (ballx - rightx)/15;
    ballvy = (bally - righty)/15;
    bounce.rewind();
    bounce.play();
  }
  if (bally <= balld/2 || bally >= height-balld/2) {
    ballvy = ballvy * -1;
    bounce.rewind();
    bounce.play();
  }

  //pause
  rect(350, 475, 100, 100);
  if (ballx < 400) {
    fill (skyBlue);
  } else {
    fill (crimson);
  }
  fill (black);
  text("| |", 400, 525);

  //scoring
  if (ballx < 0) {
    rightscore++;
    score.rewind();
    score.play();
    ballx = width/2;
    bally = height/2;
    ballvx = random(-3, 3);
    ballvy = random(-3, 3);
    timer = 100;
  }
  if (ballx > 800) {
    leftscore++;
    score.rewind();
    score.play();
    ballx = width/2;
    bally = height/2;
    ballvx = random(-3, 3);
    ballvy = random(-3, 3);
    timer = 100;
  }
  if (leftscore >= 3 || rightscore >= 3) mode = Gameover;
}  

//tactile rect
void tactileR(int x, int y, int w, int h) {
  if (mouseX > x && mouseX < w && mouseY > y && mouseY < h) {
    stroke(white);
  } else {  
    stroke(black);
  }
}


void gameClicks() {
  if (mouseX > 350 && mouseX < 450 && mouseY > 475 && mouseY < 575) {
    mode = Pause;
    timer = 100;
  }
}
