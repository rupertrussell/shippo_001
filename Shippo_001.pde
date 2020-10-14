// Author Rupert Russell
// 15 October 2020
// Processing 3.5 Java code on Github at: https://github.com/rupertrussell/seigaiha_005 
// Artwork on Redbubble at: https://www.redbubble.com/shop/ap/59870217?ref=studio-promote
// Based on Shippo design #83 in Japanese Quilt Blocks to Mix & Match by Susan Briscoe 
// https://www.penguinrandomhouse.com/books/563515/japanese-quilt-blocks-to-mix-and-match-by-susan-briscoe/
// ISBN: ISBN 9781568363653

int circle = 760;
float startStitch;
float stopStitch;
float stitchGapLenghtDegrees;

void setup() {
  size(760, 760);
  background(0);
  stroke(255);
  noFill();
  noLoop();
}

void draw() {
  float centerX = width/2;
  float centerY = height/2;

  strokeWeight(4.5);

  dashedArc(centerX, centerY, circle, circle, 0, 360, 2.5); // Full circle
  dashedArc(0, height, circle, circle, 270, 360, 3); // lower inner left half
  dashedArc(width, height, circle, circle, 90, 270, 3); // lower right half
  dashedArc(0, 0, circle, circle, 0, 90, 3); // upper left half
  dashedArc(width, 0, circle, circle, 90, 270, 3); // upper right half
  save("Shippo_001.png");
}

void dashedArc(float _xCent, float _yCent, float _xScale, float _yScale, float _start, float _stop, float _stitchLenghtDegrees) {
  int n = 0;
  println(_xCent + " " + _yCent+ " " + _xScale+ " " + _yScale+ " " + _start+ " " + _stop);

  startStitch = _start + n * _stitchLenghtDegrees;
  stopStitch = startStitch + _stitchLenghtDegrees;
  stitchGapLenghtDegrees = _stitchLenghtDegrees * 0.5;

  while (stopStitch + _stitchLenghtDegrees * 0.8  <= _stop) {
    startStitch = _start + n * _stitchLenghtDegrees;
    stopStitch = startStitch + stitchGapLenghtDegrees;
    arc(_xCent, _yCent, _xScale, _yScale, radians(startStitch), radians(stopStitch));
    n ++;
  }
}
