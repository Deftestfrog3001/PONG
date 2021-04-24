//Carson

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//mode variables
int mode;
final int Intro    = 0;
final int Game     = 1;
final int Pause    = 2;
final int Gameover = 3;

//font
PFont DOOM;

//entity variables
float leftx, lefty, leftd, rightx, righty, rightd; //paddeles
float ballx, bally, balld, ballvx, ballvy; //ball
boolean AI;

//score
int leftscore, rightscore, timer;

//keyboard variables
boolean wkey, skey, upkey, downkey;

//colors
color skyBlue = #075299;
color black   = #000000;
color viridian =#40826d;
color crimson = #990000;
color white = #FFFFFF;

//sound variables
Minim minim;
AudioPlayer introM, bounce, score, win;

void setup() {
  frameRate(120);
  size (800, 600);
  textAlign (CENTER, CENTER);
  mode = Intro;

  //initialize left paddle
  leftx = 0;
  lefty = height/2;
  leftd = 150;

  //initialize right paddle
  rightx = width;
  righty = height/2;
  rightd = 150;

  //initialize ball
  ballx = width/2;
  bally = height/2;
  balld = 50;
  ballvx = random(-3, 3);
  ballvy = random(-3, 3); 

  //initialize keyboard
  wkey = skey = upkey = downkey = false;

  //initialize score
  rightscore = leftscore = 0;
  timer = 100;

  //font
  DOOM = createFont("AmazDooMRight.ttf", 1);

  //minim
  minim = new Minim(this);
  introM = minim.loadFile("introM.mp3");
  bounce = minim.loadFile("bounce.mp3");  
  score = minim.loadFile("score.mp3");  
  win = minim.loadFile("win.mp3");
}

void draw() {
  if (mode == Intro) {
    intro ();
  } else if (mode == Game) {
    game ();
  } else if (mode == Pause) {
    pause ();
  } else if (mode == Gameover) {
    gameover ();
  } else {
    println("Error : Mode = " + mode);
  }
}
