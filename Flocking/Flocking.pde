/**
 * AR521 Flocking 
 * By Theodor Waalberg
 * based on the example
 * by Daniel Shiffman. 
 * found at: https://github.com/processing/processing-examples/tree/main/Topics/Simulate/Flocking
 * 
 * An implementation of Craig Reynold's Boids program to simulate
 * the flocking behavior of birds. Each boid steers itself based on 
 * rules of avoidance, alignment, and coherence.
 * 
 * Click the mouse to add a new boid.
 */
//import processing.sound.*;

//AudioIn input;
//Amplitude analyzer;
int max_boids = 600;
//int time = millis();
Flock flock;

void setup() {
  frameRate(30);
  fullScreen();
  //input = new AudioIn(this, 0);

  //// start the Audio Input
  //input.start();

  //// create a new Amplitude analyzer
  //analyzer = new Amplitude(this);

  //// Patch the input to an volume analyzer
  //analyzer.input(input);
  //size(1080,720);
  background(0);
  flock = new Flock();
  // Add an initial set of boids into the system
  float hue_low = 240;
  float hue_high = 255;
  for (int i = 0; i < max_boids; i++) {
      flock.addBoid(new Boid(map(i, 0, max_boids, 200, width-200),height/2,hue_high,hue_low));
  }
}

void draw() {
  //float vol = analyzer.analyze();
  background(0);
  //if (millis() > time + 60000) // Adds a new boid every so often
  //{
  //  float hue_low = 240;
  //  float hue_high = 255;
  //  flock.addBoid(new Boid(map(random(0,1), 0, 1, 0, width),height,hue_low,hue_high));
  //  time = millis();
  //}
  flock.run();
}

// Add a new boid into the System
void mouseDragged() {
  float hue_low = 20;
  float hue_high = 245;
  flock.addBoid(new Boid(mouseX,mouseY,hue_low,hue_high));
}
void mousePressed() {
  float hue_low = 20;
  float hue_high = 245;
  flock.addBoid(new Boid(mouseX,mouseY,hue_low,hue_high));
}
