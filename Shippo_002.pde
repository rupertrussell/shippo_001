// Author Rupert Russell
// 15 October 2020
// Processing 3.5 Java code on Github at: https://github.com/rupertrussell/shippo_001 
// Artwork on Redbubble at: https://www.redbubble.com/shop/ap/59931243?ref=studio-promote
// Based on Shippo design #83 in Japanese Quilt Blocks to Mix & Match by Susan Briscoe 
// https://www.penguinrandomhouse.com/books/563515/japanese-quilt-blocks-to-mix-and-match-by-susan-briscoe/
// ISBN: ISBN 9781568363653

int circle = 196;
float startStitch;
float stopStitch;
float stitchGapLenghtDegrees;
int margin = 10;

void setup() {
  size(800,800);
  background(0);
  stroke(255);
  strokeWeight(1);
  noFill();
  noLoop();
}

void draw() {

  for (int i = 0; i < 4; i ++) {
    for (int j = 0; j < 4; j++) {
      push();
      translate((i * circle) + margin, (j * circle) + margin);

      float centerX = circle/2;
      float centerY = circle/2;
       dashedArc(centerX, centerY, circle, circle, 0, 360, 2.5); // Full circle
      dashedArc(0, circle, circle, circle, 270, 360, 3); // lower inner left half
      dashedArc(circle, circle, circle, circle, 180, 270, 3); // lower right half
      dashedArc(0, 0, circle, circle, 0, 90, 3); // upper left half

    
      dashedArc(circle, 0, circle, circle, 90, 180, 3); // upper right half
      pop();
    }
  }

  save("Shippo-800x800.png");
  // exit();
}

void dashedArc(float _xCent, float _yCent, float _xScale, float _yScale, float _start, float _stop, float _stitchLenghtDegrees) {
  int n = 0;
  println(_xCent + " " + _yCent+ " " + _xScale+ " " + _yScale+ " " + _start+ " " + _stop);

  startStitch = _start + n * _stitchLenghtDegrees;
  stopStitch = startStitch + _stitchLenghtDegrees;
  stitchGapLenghtDegrees = _stitchLenghtDegrees * 0.1; // adjust this to if you increase size & stroke Weight

  while (stopStitch + _stitchLenghtDegrees * 0.8  <= _stop) {
    startStitch = _start + n * _stitchLenghtDegrees;
    stopStitch = startStitch + stitchGapLenghtDegrees;
    arc(_xCent, _yCent, _xScale, _yScale, radians(startStitch), radians(stopStitch));
    n ++;
  }
}
