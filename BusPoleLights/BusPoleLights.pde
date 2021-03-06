// This sketch is using fadecandy
// https://www.adafruit.com/product/1689
// You need to download and run the fedecandy server
// before running this sketch

import processing.video.*;

OPC opc;
PImage dot;
Movie myMovie;


void setup()
{
  size(1080, 1920);

  // Load a sample image
  dot = loadImage("dot.png");

  //Load movie
  myMovie = new Movie(this, "led_anim.mp4");
  myMovie.loop();

  // Connect to the local instance of fcserver
  opc = new OPC(this, "127.0.0.1", 7890);
  
  float centerX = width/2;
  float centerY = height/2;  

  // Map an 8x8 grid of LEDs to the center of the window
  //opc.ledGrid8x8(0, width/2, height/2, height / 12.0, 0, false);
  opc.ledGrid(0, 10, 6, centerX, centerY, 120.0, 120.0, 4.7, true);
}

void draw()
{
  
  background(0);
  image(myMovie, 0, 0);

  // Draw the image, centered at the mouse location
  //float dotSize = height * 0.7;
  //image(dot, mouseX - dotSize/2, mouseY - dotSize/2, dotSize, dotSize);
}


void movieEvent(Movie m) {
  m.read();
}
