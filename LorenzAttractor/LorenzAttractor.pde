// Daniel Shiffman
// http://codingtra.in
// http://patreon.com/codingtrain
// Code for this video: https://youtu.be/f0lkz2gSsIk

import peasy.*;

float x = random(0,2);
float y = 0;
float z = 0;

float min_hu = 100;
float max_hu = 200;

float a = 10;
float b = 28;
float c = random(6.0,8.0)/random(3.0,5.0);
float t = 0;
float color_up = 1;

ArrayList<PVector> points = new ArrayList<PVector>();
PeasyCam cam;

void setup() {
  frameRate(240);
  size(800, 600, P3D);
  //fullScreen(P3D);
  colorMode(HSB);
  cam = new PeasyCam(this, 500);
}

void draw() {
  background(0);
  float dt = 0.006;
  float dx = (a * (y - x))*dt;
  float dy = (x * (b - z) - y)*dt;
  float dz = (x * y - c * z)*dt;
  x = x + dx;
  y = y + dy;
  z = z + dz;
  t += dt;
  points.add(new PVector(x, y, z));

  translate(0, 0, -80);
  rotate(t/100);
  //translate(width/2, height/2);
  scale(6);
  //stroke(255);
  noFill();

  float hu = min_hu;
  beginShape();
  for (PVector v : points) {
    strokeWeight(0.5);
    stroke(hu, 200, 250);
    vertex(v.x, v.y,v.z);
    //PVector offset = PVector.random3D();
    //offset.mult(0.1);
    //v.add(offset);
    if (hu < min_hu){
      color_up = 1;
    }
    if (color_up == 1) {
      hu += 0.04;
      if (hu > max_hu) {
        color_up = 0;
      }
    } else {
      hu -= 0.1;
    }
  }
  endShape();


  //println(x,y,z);
}
