
void setup() {
  size(600, 600);
}

void draw() {
  //Draw white background
  background(0, 0, 200);

  //background
  fill(255, 255, 0);
  ellipse(10, 10, 50, 50);

  fill(200, 0, 0);
  ellipse(150, 30, 50, 50);

  fill(155, 0, 0);
  noStroke();
  ellipse(150, 16, 10, 10);

  fill(0, 255, 0);
  ellipse(300, 600, 600, 300);

  stroke(255, 255, 0);
  point(random(width), random(height));

  //Set CENTER mode
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  zoog(300,500);
  zoog(100,450);
  zoog(mouseX,mouseY);
  zoog(mouseX-50,mouseY+40);
}

void zoog(int xpos, int ypos){
  
  //Draw Zoog's body
  stroke(0);
  fill(random(255), random(255), random(255));
  rect(xpos, ypos, 20, 100);

  //Draw Zoog's head
  stroke(0);
  fill(random(255), random(255), random(255));
  ellipse(xpos, ypos-30, 60, 60);

  //Draw Zoog's eyes
  fill(0);
  //ellipse(81,70,16,32);
  //ellipse(119,70,16,32);
  ellipse(xpos-20, ypos-30, 16, 32);
  ellipse(xpos+20, ypos-30, 16, 32);

  //Draw Zoog's legs
  stroke(0);
  //line(90,150,80,160);
  //line(110,150,120,160);
  line(xpos-10, ypos+50, xpos-15, ypos+65);
  line(xpos+10, ypos+50, xpos+15, ypos+65);
}

