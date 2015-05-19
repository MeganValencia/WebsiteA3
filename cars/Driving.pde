// Creates an array of car object
Car[] myCar = new Car [100];

void setup() {
  size(575, 1000);
  background(255);
  frameRate(80);

  //intantiate the array of cars
  for (int i= 0; i < myCar.length; i++) {
    myCar[i] = new Car (random(width), random(height), int(random(50)), color(random(255), random(255), random(255)), random(10));
  }
}

void draw() {
  background(255);
  // draw cars
  for (int i = 0; i < myCar.length; i++) {
    Car iCar = myCar[i];
    iCar.display();
    iCar.drive();
  }
}
class Car {
  // member variables
  int cLength, cHeight, cSpeed;
  float xpos, ypos; 
  color cColor;
  float left;

  // constructor 1
  Car(float tempX, float tempY) {
    xpos = tempX;
    ypos = tempY;
    cSpeed = 1;
    cColor = color(0, 100, 255);
  }

  //constructor 2
  Car(float tempX, float tempY, int tempSpeed, color tempColor, float tempLeft) {
    xpos = tempX;
    ypos = tempY;
    cSpeed = tempSpeed;
    cColor = tempColor;
    left = tempLeft;
  }

  //member methods
  void display() {
    stroke(0);
    rectMode(CENTER);
    fill(cColor);
    rect(xpos, ypos, 20, 10);
    fill(0);
    ellipse(xpos-9, ypos-5, 5, 1);
    ellipse(xpos-9, ypos+6, 5, 1);
    ellipse(xpos+10, ypos-5, 5, 1);
    ellipse(xpos+10, ypos+6, 5, 1);
    rect(xpos, ypos, 20, 1);
    fill(100);
    rect(xpos, ypos, 8, 10);
  }

  void drive() {
    if (left <= 5) {
      xpos = xpos + cSpeed;
      if (xpos > width) {
        xpos = 0;
      }
    } else {
      xpos = xpos - cSpeed;
      if (xpos < 0) {
        xpos = width;
      }
    }
  }
}

