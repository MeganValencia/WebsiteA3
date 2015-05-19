
//Fix and adjust ALL text/ layout

// Instantiate each of the classification of buttons
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
Button[] spButtons = new Button[1];

// Global variables
String displayValue = "0";
String valueToCompute = "";
String valueToCompute2 = "";
float valueToComputeI = 0;
float valueToComputeI2 = 0;
float result = 0;
char opValue;
boolean firstNum;

void setup() {
  size(280, 370);
  background(50, 55, 55);  
  stroke(200);
  rect(1, 1, 327, 327);
  //Populate number buttons
  numButtons[0] = new Button(20, 270).asNumber(0, 130, 30);
  numButtons[1] = new Button(20, 220).asNumber(1, 30, 30);
  numButtons[2] = new Button(70, 220).asNumber(2, 30, 30);
  numButtons[3] = new Button(120, 220).asNumber(3, 30, 30);
  numButtons[4] = new Button(20, 170).asNumber(4, 30, 30);
  numButtons[5] = new Button(70, 170).asNumber(5, 30, 30);
  numButtons[6] = new Button(120, 170).asNumber(6, 30, 30);
  numButtons[7] = new Button(20, 120).asNumber(7, 30, 30);
  numButtons[8] = new Button(70, 120).asNumber(8, 30, 30);
  numButtons[9] = new Button(120, 120).asNumber(9, 30, 30);
  //Populate operators
  opButtons[0] = new Button(180, 120).asOperator("+");
  opButtons[1] = new Button(180, 170).asOperator("-");
  opButtons[2] = new Button(180, 270).asOperator("="); 
  opButtons[3] = new Button(230, 170).asOperator("÷");
  opButtons[4] = new Button(230, 120).asOperator("×");
  opButtons[5] = new Button(230, 220).asOperator("±");
  opButtons[6] = new Button(230, 270).asOperator("C");
  opButtons[7] = new Button(20, 70).asOperator("sin");
  opButtons[8] = new Button(70, 70).asOperator("cos");
  opButtons[9] = new Button(120, 70).asOperator("tan");
  opButtons[10] = new Button(170, 70).asOperator("√");
  opButtons[11] = new Button(230, 70).asOperator("^2");
  //Populate special buttons
  spButtons[0] = new Button(180, 220).asSpecial(".");
  //Set the initial value of first num to true
  firstNum = true;
}

void draw() {
  background(64);
  for (int i=0; i<numButtons.length; i++) {
    Button inumButton = numButtons[i];
    inumButton.display();
  }
  for (int i=0; i<opButtons.length; i++) {
    Button iopButton = opButtons[i];
    iopButton.display();
  }
  for (int i=0; i<spButtons.length; i++) {
    Button ispButtons= spButtons[i];
    ispButtons.display();
  }
  updateDisplay();
} 

void performCalculator() {
  valueToComputeI = float(valueToCompute);
  valueToComputeI2 = float(valueToCompute2);

  if (opValue == '+') {
    result = valueToComputeI + valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '-') {
    result = valueToComputeI - valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == 'n') {
    valueToComputeI = valueToComputeI*-1;
    displayValue = str(valueToComputeI);
  } 
  if (firstNum) {
    valueToCompute = displayValue;
  } else {
    valueToCompute = displayValue;
    valueToCompute2 = "";
  } 
  if (opValue == '*') {
    result = valueToComputeI * valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == '/') {
    result = valueToComputeI / valueToComputeI2;
    displayValue = str(result);
  } else if (opValue == 'r') {
    result = sqrt(valueToComputeI);
    displayValue = str(result);
  } else if (opValue == 'c') {
    result = cos(valueToComputeI);
    displayValue = str(result);
  } else if (opValue == 's') {
    result = sin(valueToComputeI);
    displayValue = str(result);
  } else if (opValue == 't') {
    result = tan(valueToComputeI);
    displayValue = str(result);
  } else if (opValue == 'S') {
    result = valueToComputeI * valueToComputeI;
    displayValue = str(result);
  }
}

void updateDisplay() {
  //fill(200,200,150);
  fill(55, 250, 250);
  rect(10, 10, 250, 35, 7);
  fill(255, 50, 255);
  textSize(25);
  text(displayValue, 20, 37);

  fill(50, 50, 50);
  noStroke();
  rect(10, 330, 250, 230);
  fill(255);
  textSize(10);
  text("Val 1: " + valueToCompute, 15, 340);
  text("Val 2: " + valueToCompute2, 15, 350);
  text("Result: " + result, 15, 360);
  text("Operator: " + opValue, 15, 370);
  text("REMEMBER to CLEAR after every use.", 80, 365);
}

void mousePressed() {
  for (int i=0; i<numButtons.length; i++) {
    Button inumButtons = numButtons[i];
    inumButtons.click();
    if (inumButtons.overBox) {
      if (firstNum) {
        valueToCompute += int(inumButtons.numButtonValue);
        displayValue = valueToCompute;
      } else {
        valueToCompute2 += int(inumButtons.numButtonValue);
        displayValue = valueToCompute2;
      }
    }
  }
  for (int i=0; i<opButtons.length; i++) {
    Button iOpButton = opButtons[i];
    iOpButton.click();
    if (iOpButton.overBox) {
      if (iOpButton.opButtonValue == "+") {
        if (result != 0) {
          opValue = '+';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "+";
        } else {
          opValue = '+';
          firstNum = false;
          displayValue = "+";
        }
      } else if (iOpButton.opButtonValue == "C") {
        displayValue = "0";
        opValue = 'C';
        valueToCompute = "";
        valueToCompute2 = "";
        valueToComputeI= 0;
        valueToComputeI2 = 0;
        result = 0;
        firstNum = true;
      } else if (iOpButton.opButtonValue == "-") {
        if (result != 0) {
          opValue = '-';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "-";
        } else {
          opValue = '-';
          firstNum = false;
          displayValue = "-";
        }
      } else if (iOpButton.opButtonValue == "÷") {
        if (result != 0) {
          opValue = '/';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "÷";
        } else {
          opValue = '/';
          firstNum = false;
          displayValue = "÷";
        }
      } else if (iOpButton.opButtonValue == "×") {
        if (result != 0) {
          opValue = '*';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "×";
        } else {
          opValue = '*';
          firstNum = false;
          displayValue = "×";
        }
      } else if (iOpButton.opButtonValue == "+/-") {
        if (result != 0) {
          opValue = 'n';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "±";
        } else {
          opValue = 'n';
          firstNum = false;
          displayValue = "±";
        }
      } else if (iOpButton.opButtonValue == "cos") {
        if (result != 0) {
          opValue = 'c';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "cos(";
        } else {
          opValue = 'c';
          firstNum = false;
          displayValue = "cos(";
        }
      } else if (iOpButton.opButtonValue == "sin") {
        if (result != 0) {
          opValue = 's';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "sin(";
        } else {
          opValue = 's';
          firstNum = false;
          displayValue = "sin(";
        }
      } else if (iOpButton.opButtonValue == "tan") {
        if (result != 0) {
          opValue = 't';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "tan(";
        } else {
          opValue = 't';
          firstNum = false;
          displayValue = "tan(";
        }
      } else if (iOpButton.opButtonValue == "^2") {
        if (result != 0) {
          opValue = 'S';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "^2";
        } else {
          opValue = 'S';
          firstNum = false;
          displayValue = "^2";
        }
      } else if (iOpButton.opButtonValue == "√") {
        if (result != 0) {
          opValue = 'r';
          valueToCompute2 = "";
          firstNum = false;
          displayValue = "√";
        } else {
          opValue = 'r';
          firstNum = false;
          displayValue = "√";
        }
      } else if (iOpButton.opButtonValue == "=") {
        firstNum = true;
        performCalculator();
      }
    }
  }
  for (int i=0; i<spButtons.length; i++) {
    Button ispButton = spButtons[i];
    ispButton.click();
    if (ispButton.overBox) {
      if (ispButton.spButtonValue == ".") {
        if (result != 0) {          
          valueToCompute += ispButton.spButtonValue;
          displayValue = valueToCompute;
        } else  if (firstNum == false) {
          valueToCompute2 += ispButton.spButtonValue;
          displayValue = valueToCompute2;
        }
      }
    }
  }
}
void keyPressed() {
  if (key == '1') {
    handleKeyPressNum("1");
  } else if (key == '2') {
    handleKeyPressNum("2");
  } else if (key == '3') {
    handleKeyPressNum("3");
  } else if (key == '4') {
    handleKeyPressNum("4");
  } else if (key == '5') {
    handleKeyPressNum("5");
  } else if (key == '6') {
    handleKeyPressNum("6");
  } else if (key == '7') {
    handleKeyPressNum("7");
  } else if (key == '8') {
    handleKeyPressNum("8");
  } else if (key == '9') {
    handleKeyPressNum("9");
  } else if (key == '0') {
    handleKeyPressNum("0");
  }
  if (key == 'C') {
    handleKeyPressOp("C");
  } else if (key == '=') {
    handleKeyPressOp("=");
  } else if (key == '+') {
    handleKeyPressOp("+");
  } else if (key == '-') {
    handleKeyPressOp("-");
  } else if (key == '*') {
    handleKeyPressOp("*");
  } else if (key == '/') {
    handleKeyPressOp("/");
  }
}
void handleKeyPressNum (String keyPress) {
  if (firstNum) {
    valueToCompute += keyPress;
    displayValue = valueToCompute;
  } else {
    valueToCompute2 += keyPress;
    displayValue = valueToCompute2;
  }
}
void handleKeyPressOp (String keyPress) {
  if (keyPress == "C") {
    displayValue = "0";
    opValue = 'C';
    valueToCompute = "";
    valueToCompute2 = "";
    valueToComputeI = 0;
    valueToComputeI2 = 0;
    result = 0;
    firstNum = true;
  } else if (keyPress == "=") {
    firstNum = true;
    performCalculator();
  } else if (keyPress == "+") {
    if (result != 0) {
      opValue = '+';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "+";
    } else {
      opValue = '+';
      firstNum = false;
      displayValue = "+";
    }
  } else if (keyPress == "-") {
    if (result != 0) {
      opValue = '-';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "-";
    } else {
      opValue = '-';
      firstNum = false;
      displayValue = "-";
    }
  } else if (keyPress == "*") {
    if (result != 0) {
      opValue = '*';
      valueToCompute2 = "";
      firstNum = false;
      displayValue = "×";
    } else {
      opValue = '*';
      firstNum = false;
      displayValue = "×";
    }
  } else if (keyPress == "/") {
    if (result != 0) {
      opValue = '/';
      valueToCompute2 = "÷";
      firstNum = false;
      displayValue = "";
    } else {
      opValue = '/';
      firstNum = false;
      displayValue = "÷";
    }
  }
}

class Button {    
  //Class variables
  boolean isNumber;
  boolean isOperator;
  boolean isSpecial;
  float numButtonValue;
  String opButtonValue;
  String spButtonValue;
  float xpos;
  float ypos;
  int buttonW = 30;
  int buttonH = 30;
  boolean overBox = false;

  //Constructor for number buttons
  Button(float tempXpos, float tempYpos) {
    xpos = tempXpos;
    ypos = tempYpos;
    //println(bn\\numButtonValue);
  }
  //Constructor for operator buttons
  Button asNumber(float tempNumButtonValue, int tempW, int tempH) {
    isNumber = true;
    numButtonValue = tempNumButtonValue;
    buttonW = tempW;
    buttonH = tempH;
    return this;
  }
  //Constructor for special buttons
  Button asOperator(String tempOpButtonValue) {
    isOperator = true;
    opButtonValue = tempOpButtonValue;
    return this;
  }
  Button asSpecial(String tempSpButtonValue) {
    isSpecial = true;
    spButtonValue = tempSpButtonValue;
    return this;
  }

  //Member methods & Draw the button on the canvas
  void display() {
    if (isNumber) {
      fill(150);
      stroke(0);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(255, 128, 0);
      textSize(24);
      text(int(numButtonValue), xpos+8, ypos+25);
    }
    if (isOperator) {
      fill(0);
      stroke(0);
      rect(xpos, ypos, buttonW, buttonH, 10);
      //fill(154,0,255);
      fill(255, 0, 127);
      textSize(24);
      text(opButtonValue, xpos+8, ypos+25);
    }
    if (isSpecial) {
      fill(255);
      stroke(0);
      rect(xpos, ypos, buttonW, buttonH, 10);
      fill(0);
      textSize(24);
      text(spButtonValue, xpos+12, ypos+20);
    }
  }
  void click() {
    overBox = mouseX > xpos && mouseX < xpos+buttonW && mouseY > ypos && mouseY < ypos+buttonH;
  }
}



