int x;
int y;

void setup() {
  size(400,400);
  frameRate(10);
  //set start coords
  x=width/2;
  y=height/2;

}

void draw() {
  println(key);
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      moveLeft(1);
    }else if (key == 'd' || key == 'D') {
      moveRight(1);
    }else if (key == 'w' || key == 'W') {
      moveUp(1);
    }else if (key == 's' || key == 'S') {
      moveDown(1);
//    }else if (key == 'z' || key == 'Z') {
//      moveDownLeft(1);
    }
  }
}


//Method to draw right line
void moveRight(int rep) {
  for(int i=0;i<rep*10;i++) {
    point(x+i,y);
  }
  x=x+(10*rep);
}


//Method to draw left line
void moveLeft(int rep) {
  for(int i=0;i<rep*10;i++) {
    point(x-i,y);
  }
  x=x-(10*rep);
}


//Method to draw up line
void moveUp(int rep) {
  for(int i=0;i<rep*10;i++) {
    point(x,y-i);
  }
  y=y-(10*rep);
}


//Method to draw down line
void moveDown(int rep) {
  for(int i=0;i<rep*10;i++) {
    point(x,y+i);
  }
  y=y+(10*rep);
}


void mouseClicked() {
  saveFrame("line-######.png");
}
