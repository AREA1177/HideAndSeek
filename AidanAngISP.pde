// Aidan Ang
// January 18, 2018
// Mr. Rosen, ICS
// To write a functioning Hide and Seek game for the TDSB

boolean happyFaceFound = false; // To help determine whether or not to continue prompting for guesses, to help determine which final message to display and to help determine the final score; stores whether the happy face has been found.
boolean answerCorrect = true; // To help determine whether or not to continue prompting for guesses and to help determine which final message to display; stores whether the last answer was correct new game is started.
float numCorrect = 0; // To help determine the final score; stores how many answers the player has answered correctly in the current game.
int screenMode = 1; // To help determine outputs; stores what part of the program is being executed.
int loadingStatus = 0; // To control animation of loading screen; used to provide variable coordinates for animated component and to "keep time" for the splashScreen method.
int levelSelect = 2; // To control the "difficulty", or size of visuals, of the next game (or until changed); stores user's choice.
int currentObjectX; // To help determine if the current object listed has the happy face hidden under it; stores the x coordinate of the prompted image.
int currentObjectY; // To help determine if the current object listed has the happy face hidden under it; stores the y coordinate of the prompted image.
int happyFaceUnderX; // To help determine if the happy face has been found; stores the x coordinate of the happy face.
int happyFaceUnderY; // To help determine if the happy face has been found; stores the y coordinate of the happy face.
int object1X, object2X, object3X, object4X, object5X, object6X, object7X, object8X, object9X, object10X; // To be able to manipulate images and to help determine currentObjectX; store x coordinates of images.
int object1Y, object2Y, object3Y, object4Y, object5Y, object6Y, object7Y, object8Y, object9Y, object10Y; // To be able to manipulate images and to help determine currentObjectY; store y coordinates of images.
PImage object1Image, object2Image, object3Image, object4Image, object5Image, object6Image, object7Image, object8Image, object9Image, object10Image; // To store object image to be called when needed; store object images.
PImage happyFaceImage; // To store object image to be called when needed; stores happy face image.
PImage splashScreenImage, mainMenuImage; // To store background image to be called when needed; store background images for splashScreen and mainMenu.

void setup () { // Sets basic framework for program: size, modes, loads images, resizes images to default.

  size (1280, 720); // Setting program output window size

  rectMode (CENTER); // Setting program modes
  textAlign (CENTER);
  imageMode (CENTER);

  object1Image = loadImage ("CDDrive.png"); // Loading game images
  object2Image = loadImage ("ComputerCase.jpg");
  object3Image = loadImage ("CPU.jpg");
  object4Image = loadImage ("Fan.jpg");
  object5Image = loadImage ("GPU.jpg");
  object6Image = loadImage ("HardDrive.jpg");
  object7Image = loadImage ("Modem.jpg");
  object8Image = loadImage ("Motherboard.jpg");
  object9Image = loadImage ("RAM.jpg");
  object10Image = loadImage ("SolidStateDrive.jpg");
  happyFaceImage = loadImage ("HappyFace.png");
  splashScreenImage = loadImage ("splashscreenBase.png");
  mainMenuImage = loadImage ("HideAndSeekMainMenu.jpg");

  object1Image.resize (0, 100); // Resizing game images
  object2Image.resize (0, 100);
  object3Image.resize (0, 100);
  object4Image.resize (0, 100);
  object5Image.resize (0, 100);
  object6Image.resize (0, 100);
  object7Image.resize (0, 100);
  object8Image.resize (0, 100);
  object9Image.resize (0, 100);
  object10Image.resize (0, 100);
  happyFaceImage.resize (0, 100);
  splashScreenImage.resize (1280, 720);
  mainMenuImage.resize (1280, 720);
}

void draw () { // Runs main component of program, in this case loops until program is exited.

  display(); // Main, "user-friendly" part of the program.
}

void mousePressed () { // Called when mouse is pressed, allows for user input. All programmer-created functions cycle through here.

  if (screenMode == 1) { // If in main menu...
    if (mouseX > 440 && mouseX < 840 && mouseY > 49 && mouseY < 209) {
      screenMode = 2; // ... go to game.
    } else if (mouseX > 440 && mouseX < 840 && mouseY > 193 && mouseY < 353) {
      screenMode = 20; // ... go to instructions.
    } else if (mouseX > 440 && mouseX < 840 && mouseY > 337 && mouseY < 497) {
      screenMode = 30; // .. go to levelSelector.
    } else {
      screenMode = 40; // ... go to goodbye.
    }
  } else if (screenMode == 3) { // Else if in game part 1...
    if (mouseX > (currentObjectX - (250/1.9/2)) && mouseX < (currentObjectX + (250/1.9/2)) && mouseY > (currentObjectY - 50) && mouseY < (currentObjectY + 50)) {
      if (currentObjectX == happyFaceUnderX && currentObjectY == happyFaceUnderY) { // If the correct match is made and the happy face is uncovered
        numCorrect += 1; 
        happyFaceFound = true;
        answerCorrect = true;
        screenMode = 13; // ... go to game part 12, or win part 1
      } else { // If the correct match is made but the happy face is not uncovered
        numCorrect += 1;
        screenMode = 4; // ... go to game part 2
        answerCorrect = true;
      }
    } else { // If the correct match is not made
      answerCorrect = false; // go to game part 13, or loss part 1 (screenMode 15)
    }
  } else if (screenMode == 4) { // Else if in game part 2...
    if (mouseX > (currentObjectX - (230/2.3/2)) && mouseX < (currentObjectX + (230/2.3/2)) && mouseY > (currentObjectY - 50) && mouseY < (currentObjectY + 50)) {
      if (currentObjectX == happyFaceUnderX && currentObjectY == happyFaceUnderY) { // If the correct match is made and the happy face is uncovered
        numCorrect += 1; 
        happyFaceFound = true;
        answerCorrect = true;
        screenMode = 13; // ... go to game part 12, or win part 1
      } else {
        numCorrect += 1;      
        screenMode = 5; // ... go to game part 3
        answerCorrect = true;
      }
    } else { // If the correct match is not made
      answerCorrect = false; // go to game part 13, or loss part 1 (screenMode 15)
    }
  } else if (screenMode == 5) { // Else if in game part 3...
    if (mouseX > (currentObjectX - (250/1.9/2)) && mouseX < (currentObjectX + (250/1.9/2)) && mouseY > (currentObjectY - 50) && mouseY < (currentObjectY + 50)) {
      if (currentObjectX == happyFaceUnderX && currentObjectY == happyFaceUnderY) { // If the correct match is made and the happy face is uncovered
        numCorrect += 1; 
        happyFaceFound = true;
        answerCorrect = true;
        screenMode = 13; // ... go to game part 12, or win part 1
      } else {
        numCorrect += 1;      
        screenMode = 6; // ... go to game part 4
        answerCorrect = true;
      }
    } else { // If the correct match is not made
      answerCorrect = false; // go to game part 13, or loss part 1 (screenMode 15)
    }
  } else if (screenMode == 6) { // Else if in game part 4...
    if (mouseX > (currentObjectX - (200/2/2)) && mouseX < (currentObjectX + (200/2/2)) && mouseY > (currentObjectY - 50) && mouseY < (currentObjectY + 50)) {
      if (currentObjectX == happyFaceUnderX && currentObjectY == happyFaceUnderY) { // If the correct match is made and the happy face is uncovered
        numCorrect += 1; 
        happyFaceFound = true;
        answerCorrect = true;
        screenMode = 13; // ... go to game part 12, or win part 1
      } else {
        numCorrect += 1;     
        screenMode = 7; // ... go to game part 5
        answerCorrect = true;
      }
    } else { // If the correct match is not made
      answerCorrect = false; // go to game part 13, or loss part 1 (screenMode 15)
    }
  } else if (screenMode == 7) { // Else if in game part 5...
    if (mouseX > (currentObjectX - (250/2.5/2)) && mouseX < (currentObjectX + (250/2.5/2)) && mouseY > (currentObjectY - 50) && mouseY < (currentObjectY + 50)) {
      if (currentObjectX == happyFaceUnderX && currentObjectY == happyFaceUnderY) { // If the correct match is made and the happy face is uncovered
        numCorrect += 1; 
        happyFaceFound = true;
        answerCorrect = true;
        screenMode = 13; // ... go to game part 12, or win part 1
      } else {
        numCorrect += 1;     
        screenMode = 8; // ... go to game part 6
        answerCorrect = true;
      }
    } else { // If the correct match is not made
      answerCorrect = false; // go to game part 13, or loss part 1 (screenMode 15)
    }
  } else if (screenMode == 8) { // Else if in game part 6...
    if (mouseX > (currentObjectX - (250/1.75/2)) && mouseX < (currentObjectX + (250/1.75/2)) && mouseY > (currentObjectY - 50) && mouseY < (currentObjectY + 50)) {
      if (currentObjectX == happyFaceUnderX && currentObjectY == happyFaceUnderY) { // If the correct match is made and the happy face is uncovered
        numCorrect += 1; 
        happyFaceFound = true;
        answerCorrect = true;
        screenMode = 13; // ... go to game part 12, or win part 1
      } else {
        numCorrect += 1;  
        screenMode = 9; // ... go to game part 7
        answerCorrect = true;
      }
    } else { // If the correct match is not made
      answerCorrect = false; // go to game part 13, or loss part 1 (screenMode 15)
    }
  } else if (screenMode == 9) { // Else if in game part 7...
    if (mouseX > (currentObjectX - (250/2.5/2)) && mouseX < (currentObjectX + 250/2.5/2) && mouseY > (currentObjectY - 50) && mouseY < (currentObjectY + 50)) {
      if (currentObjectX == happyFaceUnderX && currentObjectY == happyFaceUnderY) { // If the correct match is made and the happy face is uncovered
        numCorrect += 1; 
        happyFaceFound = true;
        answerCorrect = true;
        screenMode = 13; // ... go to game part 12, or win part 1
      } else {
        numCorrect += 1;     
        screenMode = 10; // ... go to game part 8
        answerCorrect = true;
      }
    } else { // If the correct match is not made
      answerCorrect = false; // go to game part 13, or loss part 1 (screenMode 15)
    }
  } else if (screenMode == 10) { // Else if in game part 8...
    if (mouseX > (currentObjectX - (250/1.6/2)) && mouseX < currentObjectX + (250/1.6/2) && mouseY > (currentObjectY - 50) && mouseY < (currentObjectY + 50)) {
      if (currentObjectX == happyFaceUnderX && currentObjectY == happyFaceUnderY) { // If the correct match is made and the happy face is uncovered
        numCorrect += 1; 
        happyFaceFound = true;
        answerCorrect = true;
        screenMode = 13;
      } else {
        numCorrect += 1;     
        screenMode = 11; // ... go to game part 9
        answerCorrect = true;
      }
    } else { // If the correct match is not made
      answerCorrect = false; // go to game part 13, or loss part 1 (screenMode 15)
    }
  } else if (screenMode == 11) { // Else if in game part 9...
    if (mouseX > (currentObjectX - (280/2.3/2)) && mouseX < (currentObjectX + (280/2.3/2)) && mouseY > (-50) && mouseY < (currentObjectY + 50)) {
      if (currentObjectX == happyFaceUnderX && currentObjectY == happyFaceUnderY) { // If the correct match is made and the happy face is uncovered
        numCorrect += 1; 
        happyFaceFound = true;
        answerCorrect = true;
        screenMode = 13; // ... go to game part 12, or win part 1
      } else {
        numCorrect += 1;
        screenMode = 12; // ... go to game part 10
        answerCorrect = true;
      }
    } else { // If the correct match is not made
      answerCorrect = false; // go to game part 13, or loss part 1 (screenMode 15)
    }
  } else if (screenMode == 12) { // Else if in game part 10...
    if (mouseX > (currentObjectX - (140/2/2)) && mouseX < (currentObjectX + (140/2/2)) && mouseY > (currentObjectY - 50) && mouseY < (currentObjectY + 50)) {
      if (currentObjectX == happyFaceUnderX && currentObjectY == happyFaceUnderY) { // If the correct match is made and the happy face is uncovered
        numCorrect += 1; 
        happyFaceFound = true;
        answerCorrect = true;
        screenMode = 13; // ... go to game part 12, or win part 1
      } else {
        numCorrect += 1;
        screenMode = 13; // ... go to game part 11
        answerCorrect = true;
      }
    } else { // If the correct match is not made
      answerCorrect = false; // go to game part 13, or loss part 1 (screenMode 15)
    }
  } else if (screenMode == 13) { // Else if in game part 12, or win part 1...
    screenMode = 14; // ... go to game part 13, or win part 2
  } else if (screenMode == 14) { // Else if in game part 13, or win part 2...
    screenMode = 19; // ... go to scores(); (screenMode 19)
  } else if (screenMode == 15) { // Else if in game part 14, or loss part 1...
    screenMode = 19; // ... go to scores(); (screenMode 19)
  } else if (screenMode == 19) { // Else if in scores (scores())...
    answerCorrect = true; // ... reset counters
    happyFaceFound = false;
    numCorrect = 0;
    screenMode = 1; // ... return to main menu (mainMenu())
  } else if (screenMode == 20) { // Else if in instructions (instructions())...
    screenMode = 1; // ... return to main menu (mainMenu())
  } else if (screenMode == 30) { // Else if in levelSelector (levelSelector())...
    if (mouseX > 190 && mouseX < 1090 && mouseY > 20 && mouseY < 220) {
      levelSelect = 1; // if button pressed make visuals easy (big)
      screenMode = 1; // return to main menu
    } else if (mouseX > 190 && mouseX < 1090 && mouseY > 155 && mouseY < 355) {
      levelSelect = 2; // if button pressed make visuals intermediate (medium)
      screenMode = 1; // return to main menu
    } else if (mouseX > 190 && mouseX < 1090 && mouseY > 295 && mouseY < 495) {
      levelSelect = 3;  // if button pressed make visuals hard (small)
      screenMode = 1; // return to main menu
    } else { // If a valid choice is not made
      screenMode = 1; // return to main menu
    }
  } else { // Else if screenMode = other (goodbye())...
    exit(); // ... Close/stop output
  }
}

void display () { // Combines all programmer-created functions into one using conditionals.

  if (loadingStatus == 344) {
    mainMenu();
  } else { // Ensures that splashScreen will run first, by itself, and vice versa.
    splashScreen();
  }
}

void splashScreen () { // When running, displays an interesting animated splash screen

  background (splashScreenImage); // Refreshes image (covers all prior graphics) 

  if (loadingStatus == 340) { // Inserts text when a certain point is reached -
    textSize (50);
    text ("Aidan Ang", width / 2, height / 720 * 507);
    textSize(25);
    text ("January 18th, 2019", width / 4, height / 720 * 507);
    text ("version 3.1", width / 4 * 3, height / 720 * 507);
    loadingStatus += 2;
  } else if (loadingStatus == 342) { // then stops splashScreen()
    delay (5000);
    loadingStatus = 344;
  } else {

    if (loadingStatus <= 338) { // Allows animation through a changing variable
      loadingStatus += 2;
    }
  }

  image (object1Image, width / 12 * 2 - 340 + loadingStatus, height / 6); // Draws images based on changing variable creating illusion of animation
  image (object2Image, width / 12 * 4 - 340 + loadingStatus, height / 6 - 340 + loadingStatus);
  image (object3Image, width / 12 * 6, height / 6 - 340 + loadingStatus);
  image (object4Image, width / 12 * 8 + 340 -loadingStatus, height / 6 - 340 + loadingStatus);
  image (object5Image, width / 12 * 10 + 340 -loadingStatus, height /6);
  image (object6Image, width / 12 * 2 - 340 + loadingStatus, height / 6 * 5);
  image (object7Image, width / 12 * 4 - 340 + loadingStatus, height / 6 * 5 + 340 - loadingStatus);
  image (object8Image, width / 12 * 6, height / 6 * 5 + 340 - loadingStatus);
  image (object9Image, width / 12 * 8 + 340 - loadingStatus, height / 6 * 5 + 340 - loadingStatus);
  image (object10Image, width / 12 * 10 + 340 - loadingStatus, height / 6 * 5);
  //image (happyFaceImage, 590, 410);
}

void mainMenu () { // The "hub". Game will always cycle back to here. Controls when certain functions will run. Is screenMode 1.

  if (screenMode == 1) { // If in mainMenu show main menu visuals
    background (mainMenuImage);
    textSize (50);
    text ("Start Game", 640, 144);
    text ("Instructions", 640, 288);
    text ("Level Select", 640, 432);
    textSize (25);
    text ("Click on any blank part of the screen to exit", 640, 576);
    noFill();
    stroke (255);
    rect (640, 129, 400, 80);
    rect (640, 273, 400, 80);
    rect (640, 417, 400, 80);
  } else if (screenMode == 2 || screenMode == 3 || screenMode == 4 || screenMode == 5 || screenMode == 6 || screenMode == 7 || screenMode == 8 || screenMode == 9 || screenMode == 10 || screenMode == 11 || screenMode == 12 || screenMode == 13 || screenMode == 14 || screenMode == 15) {
    game(); // Else if in game show game visuals
  } else if (screenMode == 19) {
    scores(); // Else if in scores show scores visuals
  } else if (screenMode == 20) {
    instructions(); // Else if in instructions show instructions visuals
  } else if (screenMode == 30) {
    levelSelector(); // Else if in levelSelector show levelSelector visuals
  } else { //if (screenMode == 40) {
    goodbye(); // Else (in goodbye) show goodbye visuals
  }
}

void game () { // Runs the "playing" part of the program. Can be screenModes 2 - 15.

  int locationAlreadyUsed1, locationAlreadyUsed2, locationAlreadyUsed3, locationAlreadyUsed4, locationAlreadyUsed5, locationAlreadyUsed6, locationAlreadyUsed7, locationAlreadyUsed8, locationAlreadyUsed9, locationAlreadyUsed10; // To help randomly assign locations to the 10 images of computer hardware without having overlapping images; stores which spaces have taken up.

  background(0, 0, 128); // setup
  textSize (25);

  if (happyFaceFound == true && screenMode == 13) { // Checks that the game is not over because the player has won. If the game is over...
    fill (255);
    if (numCorrect == 1) { // Displays all visuals including the happy face, depending on when the happy face was found
      stroke (255);
      line (0, height/2, width, height/2);
      image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
      image (object1Image, width/6, 440);
      image (object2Image, object2X, object2Y);
      image (object3Image, object3X, object3Y);
      image (object4Image, object4X, object4Y);
      image (object5Image, object5X, object5Y);
      image (object6Image, object6X, object6Y);
      image (object7Image, object7X, object7Y);
      image (object8Image, object8X, object8Y);
      image (object9Image, object9X, object9Y);
      image (object10Image, object10X, object10Y);
      text ("CD Drive", width/6, 520);
    } else if (numCorrect == 2) {
      stroke (255);
      line (0, height/2, width, height/2);
      image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
      image (object1Image, width/6, 440);
      image (object2Image, width/6*2, 440);
      image (object3Image, object3X, object3Y);
      image (object4Image, object4X, object4Y);
      image (object5Image, object5X, object5Y);
      image (object6Image, object6X, object6Y);
      image (object7Image, object7X, object7Y);
      image (object8Image, object8X, object8Y);
      image (object9Image, object9X, object9Y);
      image (object10Image, object10X, object10Y);
      text ("CD Drive", width/6, 520);
      text ("Computer Case", width/6*2, 520);
    } else if (numCorrect == 3) {
      stroke (255);
      line (0, height/2, width, height/2);
      image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
      image (object1Image, width/6, 440);
      image (object2Image, width/6*2, 440);
      image (object3Image, width/6*3, 440);
      image (object4Image, object4X, object4Y);
      image (object5Image, object5X, object5Y);
      image (object6Image, object6X, object6Y);
      image (object7Image, object7X, object7Y);
      image (object8Image, object8X, object8Y);
      image (object9Image, object9X, object9Y);
      image (object10Image, object10X, object10Y);
      text ("CD Drive", width/6, 520);
      text ("Computer Case", width/6*2, 520);
      text ("CPU", width/6*3, 520);
    } else if (numCorrect == 4) {
      stroke (255);
      line (0, height/2, width, height/2);
      image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
      image (object1Image, width/6, 440);
      image (object2Image, width/6*2, 440);
      image (object3Image, width/6*3, 440);
      image (object4Image, width/6*4, 440);
      image (object5Image, object5X, object5Y);
      image (object6Image, object6X, object6Y);
      image (object7Image, object7X, object7Y);
      image (object8Image, object8X, object8Y);
      image (object9Image, object9X, object9Y);
      image (object10Image, object10X, object10Y);
      text ("CD Drive", width/6, 520);
      text ("Computer Case", width/6*2, 520);
      text ("CPU", width/6*3, 520);
      text ("Fan", width/6*4, 520);
    } else if (numCorrect == 5) {
      stroke (255);
      line (0, height/2, width, height/2);
      image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
      image (object1Image, width/6, 440);
      image (object2Image, width/6*2, 440);
      image (object3Image, width/6*3, 440);
      image (object4Image, width/6*4, 440);
      image (object5Image, width/6*5, 440);
      image (object6Image, object6X, object6Y);
      image (object7Image, object7X, object7Y);
      image (object8Image, object8X, object8Y);
      image (object9Image, object9X, object9Y);
      image (object10Image, object10X, object10Y);
      text ("CD Drive", width/6, 520);
      text ("Computer Case", width/6*2, 520);
      text ("CPU", width/6*3, 520);
      text ("Fan", width/6*4, 520);
      text ("GPU", width/6*5, 520);
    } else if (numCorrect == 6) {
      stroke (255);
      line (0, height/2, width, height/2);
      image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
      image (object1Image, width/6, 440);
      image (object2Image, width/6*2, 440);
      image (object3Image, width/6*3, 440);
      image (object4Image, width/6*4, 440);
      image (object5Image, width/6*5, 440);
      image (object6Image, width/6, 590);
      image (object7Image, object7X, object7Y);
      image (object8Image, object8X, object8Y);
      image (object9Image, object9X, object9Y);
      image (object10Image, object10X, object10Y);
      text ("CD Drive", width/6, 520);
      text ("Computer Case", width/6*2, 520);
      text ("CPU", width/6*3, 520);
      text ("Fan", width/6*4, 520);
      text ("GPU", width/6*5, 520);
      text ("Hard Drive", width/6, 680);
    } else if (numCorrect == 7) {
      stroke (255);
      line (0, height/2, width, height/2);
      image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
      image (object1Image, width/6, 440);
      image (object2Image, width/6*2, 440);
      image (object3Image, width/6*3, 440);
      image (object4Image, width/6*4, 440);
      image (object5Image, width/6*5, 440);
      image (object6Image, width/6, 590);
      image (object7Image, width/6*2, 590);
      image (object8Image, object8X, object8Y);
      image (object9Image, object9X, object9Y);
      image (object10Image, object10X, object10Y);
      text ("CD Drive", width/6, 520);
      text ("Computer Case", width/6*2, 520);
      text ("CPU", width/6*3, 520);
      text ("Fan", width/6*4, 520);
      text ("GPU", width/6*5, 520);
      text ("Hard Drive", width/6, 680);
      text ("Modem", width/6*2, 680);
    } else if (numCorrect == 8) {
      stroke (255);
      line (0, height/2, width, height/2);
      image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
      image (object1Image, width/6, 440);
      image (object2Image, width/6*2, 440);
      image (object3Image, width/6*3, 440);
      image (object4Image, width/6*4, 440);
      image (object5Image, width/6*5, 440);
      image (object6Image, width/6, 590);
      image (object7Image, width/6*2, 590);
      image (object8Image, width/6*3, 590);
      image (object9Image, object9X, object9Y);
      image (object10Image, object10X, object10Y);
      text ("CD Drive", width/6, 520);
      text ("Computer Case", width/6*2, 520);
      text ("CPU", width/6*3, 520);
      text ("Fan", width/6*4, 520);
      text ("GPU", width/6*5, 520);
      text ("Hard Drive", width/6, 680);
      text ("Modem", width/6*2, 680);
      text ("Motherboard", width/6*3, 680);
    } else if (numCorrect == 9) {
      stroke (255);
      line (0, height/2, width, height/2);
      image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
      image (object1Image, width/6, 440);
      image (object2Image, width/6*2, 440);
      image (object3Image, width/6*3, 440);
      image (object4Image, width/6*4, 440);
      image (object5Image, width/6*5, 440);
      image (object6Image, width/6, 590);
      image (object7Image, width/6*2, 590);
      image (object8Image, width/6*3, 590);
      image (object9Image, width/6*4, 590);
      image (object10Image, object10X, object10Y);
      text ("CD Drive", width/6, 520);
      text ("Computer Case", width/6*2, 520);
      text ("CPU", width/6*3, 520);
      text ("Fan", width/6*4, 520);
      text ("GPU", width/6*5, 520);
      text ("Hard Drive", width/6, 680);
      text ("Modem", width/6*2, 680);
      text ("Motherboard", width/6*3, 680);
      text ("RAM", width/6*4, 680);
    } else {
      stroke (255);
      line (0, height/2, width, height/2);
      image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
      image (object1Image, width/6, 440);
      image (object2Image, width/6*2, 440);
      image (object3Image, width/6*3, 440);
      image (object4Image, width/6*4, 440);
      image (object5Image, width/6*5, 440);
      image (object6Image, width/6, 590);
      image (object7Image, width/6*2, 590);
      image (object8Image, width/6*3, 590);
      image (object9Image, width/6*4, 590);
      image (object10Image, width/6*5, 590);
      text ("CD Drive", width/6, 520);
      text ("Computer Case", width/6*2, 520);
      text ("CPU", width/6*3, 520);
      text ("Fan", width/6*4, 520);
      text ("GPU", width/6*5, 520);
      text ("Hard Drive", width/6, 680);
      text ("Modem", width/6*2, 680);
      text ("Motherboard", width/6*3, 680);
      text ("RAM", width/6*4, 680);
      text ("SSD", width/6*5, 680);
    }
    fill (0, 255, 0);
    textSize (50);
    text ("Click anywhere to continue", 640, 50); // Prompts user to proceed after winning
  } else if (happyFaceFound == true && screenMode == 14) { // Congratulates and prompts user
    textSize (100);
    text ("YOU WIN!!!", 640, 360  );
    textSize (50);
    text ("Click anywhere to continue", 640, 670);
  } else if (answerCorrect == false) { // Informs and prompts user
    fill (255, 0, 0);
    textSize (100);
    text ("YOU LOSE", 640, 360  );
    textSize (50);
    text ("Click anywhere to continue", 640, 670);
    screenMode = 15;
  } else if (screenMode == 2) { // Used for setup of each game - note screenMode 2.
    if (levelSelect == 1) { // Resizing visuals based on user input
      object1Image.resize (0, 100);
      object2Image.resize (0, 100);
      object3Image.resize (0, 100);
      object4Image.resize (0, 100);
      object5Image.resize (0, 100);
      object6Image.resize (0, 100);
      object7Image.resize (0, 100);
      object8Image.resize (0, 100);
      object9Image.resize (0, 100);
      object10Image.resize (0, 100);
      happyFaceImage.resize (0, 100);
    } else if (levelSelect == 2) { // Resizing visuals based on user input
      object1Image.resize (0, 75);
      object2Image.resize (0, 75);
      object3Image.resize (0, 75);
      object4Image.resize (0, 75);
      object5Image.resize (0, 75);
      object6Image.resize (0, 75);
      object7Image.resize (0, 75);
      object8Image.resize (0, 75);
      object9Image.resize (0, 75);
      object10Image.resize (0, 75);
      happyFaceImage.resize (0, 75);
    } else { // Resizing visuals based on user input
      object1Image.resize (0, 50);
      object2Image.resize (0, 50);
      object3Image.resize (0, 50);
      object4Image.resize (0, 50);
      object5Image.resize (0, 50);
      object6Image.resize (0, 50);
      object7Image.resize (0, 50);
      object8Image.resize (0, 50);
      object9Image.resize (0, 50);
      object10Image.resize (0, 50);
      happyFaceImage.resize (0, 50);
    }

    happyFaceUnderX = int (random (1, 11)); // Gives random locations to the happy face and the 10 hardware images
    locationAlreadyUsed1 = int (random(1, 11));
    locationAlreadyUsed2 = int (random(1, 11));
    locationAlreadyUsed3 = int (random(1, 11));
    locationAlreadyUsed4 = int (random(1, 11));
    locationAlreadyUsed5 = int (random(1, 11));
    locationAlreadyUsed6 = int (random(1, 11));
    locationAlreadyUsed7 = int (random(1, 11));
    locationAlreadyUsed8 = int (random(1, 11));
    locationAlreadyUsed9 = int (random(1, 11));
    locationAlreadyUsed10 = int (random(1, 11));

    while (locationAlreadyUsed2 == locationAlreadyUsed1) { // Ensures no two hardware images will be drawn in the same place (by comparing to previous entries)
      locationAlreadyUsed2 = int (random(1, 11));
    }
    while (locationAlreadyUsed3 == locationAlreadyUsed2 || locationAlreadyUsed3 == locationAlreadyUsed1) { // Ensures no two hardware images will be drawn in the same place
      locationAlreadyUsed3 = int (random(1, 11));
    }
    while (locationAlreadyUsed4 == locationAlreadyUsed3 || locationAlreadyUsed4 == locationAlreadyUsed2 || locationAlreadyUsed4 == locationAlreadyUsed1) { // Ensures no two hardware images will be drawn in the same place
      locationAlreadyUsed4 = int (random(1, 11));
    }
    while (locationAlreadyUsed5 == locationAlreadyUsed4 || locationAlreadyUsed5 == locationAlreadyUsed3 || locationAlreadyUsed5 == locationAlreadyUsed2 || locationAlreadyUsed5 == locationAlreadyUsed1) { // Ensures no two hardware images will be drawn in the same place
      locationAlreadyUsed5 = int (random(1, 11));
    }
    while (locationAlreadyUsed6 == locationAlreadyUsed5 || locationAlreadyUsed6 == locationAlreadyUsed4 || locationAlreadyUsed6 == locationAlreadyUsed3 || locationAlreadyUsed6 == locationAlreadyUsed2 || locationAlreadyUsed6 == locationAlreadyUsed1) { // Ensures no two hardware images will be drawn in the same place
      locationAlreadyUsed6 = int (random(1, 11));
    }
    while (locationAlreadyUsed7 == locationAlreadyUsed6 || locationAlreadyUsed7 == locationAlreadyUsed5 || locationAlreadyUsed7 == locationAlreadyUsed4 || locationAlreadyUsed7 == locationAlreadyUsed3 || locationAlreadyUsed7 == locationAlreadyUsed2 || locationAlreadyUsed7 == locationAlreadyUsed1) { // Ensures no two hardware images will be drawn in the same place
      locationAlreadyUsed7 = int (random(1, 11));
    }
    while (locationAlreadyUsed8 == locationAlreadyUsed7 || locationAlreadyUsed8 == locationAlreadyUsed6 || locationAlreadyUsed8 == locationAlreadyUsed5 || locationAlreadyUsed8 == locationAlreadyUsed4 || locationAlreadyUsed8 == locationAlreadyUsed3 || locationAlreadyUsed8 == locationAlreadyUsed2 || locationAlreadyUsed8 == locationAlreadyUsed1) { // Ensures no two hardware images will be drawn in the same place
      locationAlreadyUsed8 = int (random(1, 11));
    }
    while (locationAlreadyUsed9 == locationAlreadyUsed8 || locationAlreadyUsed9 == locationAlreadyUsed7 || locationAlreadyUsed9 == locationAlreadyUsed6 || locationAlreadyUsed9 == locationAlreadyUsed5 || locationAlreadyUsed9 == locationAlreadyUsed4 || locationAlreadyUsed9 == locationAlreadyUsed3 || locationAlreadyUsed9 == locationAlreadyUsed2 || locationAlreadyUsed9 == locationAlreadyUsed1) { // Ensures no two hardware images will be drawn in the same place
      locationAlreadyUsed9 = int (random(1, 11));
    }
    while (locationAlreadyUsed10 == locationAlreadyUsed9 || locationAlreadyUsed10 == locationAlreadyUsed8 || locationAlreadyUsed10 == locationAlreadyUsed7 || locationAlreadyUsed10 == locationAlreadyUsed6 || locationAlreadyUsed10 == locationAlreadyUsed5 || locationAlreadyUsed10 == locationAlreadyUsed4 || locationAlreadyUsed10 == locationAlreadyUsed3 || locationAlreadyUsed10 == locationAlreadyUsed2 || locationAlreadyUsed10 == locationAlreadyUsed1) { // Ensures no two hardware images will be drawn in the same place
      locationAlreadyUsed10 = int (random(1, 11));
    }  

    if (happyFaceUnderX == 1) { // Assigns coordinates to objects based on their randomized positions
      image (happyFaceImage, width/6, height / 6);
      happyFaceUnderX = width/6;
      happyFaceUnderY = height / 6;
    } else if (happyFaceUnderX == 2) {
      image (happyFaceImage, width/6*2, height / 6);
      happyFaceUnderX = width/6*2;
      happyFaceUnderY = height / 6;
    } else if (happyFaceUnderX == 3) {
      image (happyFaceImage, width/6*3, height / 6);
      happyFaceUnderX = width/6*3;
      happyFaceUnderY = height / 6;
    } else if (happyFaceUnderX == 4) {
      image (happyFaceImage, width/6*4, height / 6);
      happyFaceUnderX = width/6*4;
      happyFaceUnderY = height / 6;
    } else if (happyFaceUnderX == 5) {
      image (happyFaceImage, width/6*5, height / 6);
      happyFaceUnderX = width/6*5;
      happyFaceUnderY = height / 6;
    } else if (happyFaceUnderX == 6) {
      image (happyFaceImage, width/6, height / 3);
      happyFaceUnderX = width/6;
      happyFaceUnderY = height / 3;
    } else if (happyFaceUnderX == 7) {
      image (happyFaceImage, width/6*2, height / 3);
      happyFaceUnderX = width/6*2;
      happyFaceUnderY = height / 3;
    } else if (happyFaceUnderX == 8) {
      image (happyFaceImage, width/6*3, height / 3);
      happyFaceUnderX = width/6*3;
      happyFaceUnderY = height / 3;
    } else if (happyFaceUnderX == 9) {
      image (happyFaceImage, width/6*4, height / 3);
      happyFaceUnderX = width/6*4;
      happyFaceUnderY = height / 3;
    } else if (happyFaceUnderX == 10) {
      image (happyFaceImage, width/6*5, height / 3);
      happyFaceUnderX = width/6*5;
      happyFaceUnderY = height / 3;
    } 

    if (locationAlreadyUsed1 == 1) { // Assigns coordinates to objects based on their randomized positions
      image (object1Image, width/6, height / 6);
      object1X = width/6;
      object1Y = height / 6;
    } else if (locationAlreadyUsed1 == 2) {
      image (object2Image, width/6, height / 6);
      object2X = width/6;
      object2Y = height / 6;
    } else if (locationAlreadyUsed1 == 3) {
      image (object3Image, width/6, height / 6);
      object3X = width/6;
      object3Y = height / 6;
    } else if (locationAlreadyUsed1 == 4) {
      image (object4Image, width/6, height / 6);
      object4X = width/6;
      object4Y = height / 6;
    } else if (locationAlreadyUsed1 == 5) {
      image (object5Image, width/6, height / 6);
      object5X = width/6;
      object5Y = height / 6;
    } else if (locationAlreadyUsed1 == 6) {
      image (object6Image, width/6, height / 6);
      object6X = width/6;
      object6Y = height / 6;
    } else if (locationAlreadyUsed1 == 7) {
      image (object7Image, width/6, height / 6);
      object7X = width/6;
      object7Y = height / 6;
    } else if (locationAlreadyUsed1 == 8) {
      image (object8Image, width/6, height / 6);
      object8X = width/6;
      object8Y = height / 6;
    } else if (locationAlreadyUsed1 == 9) {
      image (object9Image, width/6, height / 6);
      object9X = width/6;
      object9Y = height / 6;
    } else if (locationAlreadyUsed1 == 10) {
      image (object10Image, width/6, height / 6);
      object10X = width/6;
      object10Y = height / 6;
    } 

    if (locationAlreadyUsed2 == 1) { // Assigns coordinates to objects based on their randomized positions
      image (object1Image, width/6*2, height / 6);
      object1X = width/6*2;
      object1Y = height / 6;
    } else if (locationAlreadyUsed2 == 2) {
      image (object2Image, width/6*2, height / 6);
      object2X = width/6*2;
      object2Y = height / 6;
    } else if (locationAlreadyUsed2 == 3) {
      image (object3Image, width/6*2, height / 6);
      object3X = width/6*2;
      object3Y = height / 6;
    } else if (locationAlreadyUsed2 == 4) {
      image (object4Image, width/6*2, height / 6);
      object4X = width/6*2;
      object4Y = height / 6;
    } else if (locationAlreadyUsed2 == 5) {
      image (object5Image, width/6*2, height / 6);
      object5X = width/6*2;
      object5Y = height / 6;
    } else if (locationAlreadyUsed2 == 6) {
      image (object6Image, width/6*2, height / 6);
      object6X = width/6*2;
      object6Y = height / 6;
    } else if (locationAlreadyUsed2 == 7) {
      image (object7Image, width/6*2, height / 6);
      object7X = width/6*2;
      object7Y = height / 6;
    } else if (locationAlreadyUsed2 == 8) {
      image (object8Image, width/6*2, height / 6);
      object8X = width/6*2;
      object8Y = height / 6;
    } else if (locationAlreadyUsed2 == 9) {
      image (object9Image, width/6*2, height / 6);
      object9X = width/6*2;
      object9Y = height / 6;
    } else if (locationAlreadyUsed2 == 10) {
      image (object10Image, width/6*2, height / 6);
      object10X = width/6*2;
      object10Y = height / 6;
    } 

    if (locationAlreadyUsed3 == 1) { // Assigns coordinates to objects based on their randomized positions
      image (object1Image, width/6*3, height / 6);
      object1X = width/6*3;
      object1Y = height / 6;
    } else if (locationAlreadyUsed3 == 2) {
      image (object2Image, width/6*3, height / 6);
      object2X = width/6*3;
      object2Y = height / 6;
    } else if (locationAlreadyUsed3 == 3) {
      image (object3Image, width/6*3, height / 6);
      object3X = width/6*3;
      object3Y = height / 6;
    } else if (locationAlreadyUsed3 == 4) {
      image (object4Image, width/6*3, height / 6);
      object4X = width/6*3;
      object4Y = height / 6;
    } else if (locationAlreadyUsed3 == 5) {
      image (object5Image, width/6*3, height / 6);
      object5X = width/6*3;
      object5Y = height / 6;
    } else if (locationAlreadyUsed3 == 6) {
      image (object6Image, width/6*3, height / 6);
      object6X = width/6*3;
      object6Y = height / 6;
    } else if (locationAlreadyUsed3 == 7) {
      image (object7Image, width/6*3, height / 6);
      object7X = width/6*3;
      object7Y = height / 6;
    } else if (locationAlreadyUsed3 == 8) {
      image (object8Image, width/6*3, height / 6);
      object8X = width/6*3;
      object8Y = height / 6;
    } else if (locationAlreadyUsed3 == 9) {
      image (object9Image, width/6*3, height / 6);
      object9X = width/6*3;
      object9Y = height / 6;
    } else if (locationAlreadyUsed3 == 10) {
      image (object10Image, width/6*3, height / 6);
      object10X = width/6*3;
      object10Y = height / 6;
    } 

    if (locationAlreadyUsed4 == 1) { // Assigns coordinates to objects based on their randomized positions
      image (object1Image, width/6*4, height / 6);
      object1X = width/6*4;
      object1Y = height / 6;
    } else if (locationAlreadyUsed4 == 2) {
      image (object2Image, width/6*4, height / 6);
      object2X = width/6*4;
      object2Y = height / 6;
    } else if (locationAlreadyUsed4 == 3) {
      image (object3Image, width/6*4, height / 6);
      object3X = width/6*4;
      object3Y = height / 6;
    } else if (locationAlreadyUsed4 == 4) {
      image (object4Image, width/6*4, height / 6);
      object4X = width/6*4;
      object4Y = height / 6;
    } else if (locationAlreadyUsed4 == 5) {
      image (object5Image, width/6*4, height / 6);
      object5X = width/6*4;
      object5Y = height / 6;
    } else if (locationAlreadyUsed4 == 6) {
      image (object6Image, width/6*4, height / 6);
      object6X = width/6*4;
      object6Y = height / 6;
    } else if (locationAlreadyUsed4 == 7) {
      image (object7Image, width/6*4, height / 6);
      object7X = width/6*4;
      object7Y = height / 6;
    } else if (locationAlreadyUsed4 == 8) {
      image (object8Image, width/6*4, height / 6);
      object8X = width/6*4;
      object8Y = height / 6;
    } else if (locationAlreadyUsed4 == 9) {
      image (object9Image, width/6*4, height / 6);
      object9X = width/6*4;
      object9Y = height / 6;
    } else if (locationAlreadyUsed4 == 10) {
      image (object10Image, width/6*4, height / 6);
      object10X = width/6*4;
      object10Y = height / 6;
    }  

    if (locationAlreadyUsed5 == 1) { // Assigns coordinates to objects based on their randomized positions
      image (object1Image, width/6*5, height / 6);
      object1X = width/6*5;
      object1Y = height / 6;
    } else if (locationAlreadyUsed5 == 2) {
      image (object2Image, width/6*5, height / 6);
      object2X = width/6*5;
      object2Y = height / 6;
    } else if (locationAlreadyUsed5 == 3) {
      image (object3Image, width/6*5, height / 6);
      object3X = width/6*5;
      object3Y = height / 6;
    } else if (locationAlreadyUsed5 == 4) {
      image (object4Image, width/6*5, height / 6);
      object4X = width/6*5;
      object4Y = height / 6;
    } else if (locationAlreadyUsed5 == 5) {
      image (object5Image, width/6*5, height / 6);
      object5X = width/6*5;
      object5Y = height / 6;
    } else if (locationAlreadyUsed5 == 6) {
      image (object6Image, width/6*5, height / 6);
      object6X = width/6*5;
      object6Y = height / 6;
    } else if (locationAlreadyUsed5 == 7) {
      image (object7Image, width/6*5, height / 6);
      object7X = width/6*5;
      object7Y = height / 6;
    } else if (locationAlreadyUsed5 == 8) {
      image (object8Image, width/6*5, height / 6);
      object8X = width/6*5;
      object8Y = height / 6;
    } else if (locationAlreadyUsed5 == 9) {
      image (object9Image, width/6*5, height / 6);
      object9X = width/6*5;
      object9Y = height / 6;
    } else if (locationAlreadyUsed5 == 10) {
      image (object10Image, width/6*5, height / 6);
      object10X = width/6*5;
      object10Y = height / 6;
    } 

    if (locationAlreadyUsed6 == 1) { // Assigns coordinates to objects based on their randomized positions
      image (object1Image, width/6, height / 3);
      object1X = width/6;
      object1Y = height / 3;
    } else if (locationAlreadyUsed6 == 2) {
      image (object2Image, width/6, height / 3);
      object2X = width/6;
      object2Y = height / 3;
    } else if (locationAlreadyUsed6 == 3) {
      image (object3Image, width/6, height / 3);
      object3X = width/6;
      object3Y = height / 3;
    } else if (locationAlreadyUsed6 == 4) {
      image (object4Image, width/6, height / 3);
      object4X = width/6;
      object4Y = height / 3;
    } else if (locationAlreadyUsed6 == 5) {
      image (object5Image, width/6, height / 3);
      object5X = width/6;
      object5Y = height / 3;
    } else if (locationAlreadyUsed6 == 6) {
      image (object6Image, width/6, height / 3);
      object6X = width/6;
      object6Y = height / 3;
    } else if (locationAlreadyUsed6 == 7) {
      image (object7Image, width/6, height / 3);
      object7X = width/6;
      object7Y = height / 3;
    } else if (locationAlreadyUsed6 == 8) {
      image (object8Image, width/6, height / 3);
      object8X = width/6;
      object8Y = height / 3;
    } else if (locationAlreadyUsed6 == 9) {
      image (object9Image, width/6, height / 3);
      object9X = width/6;
      object9Y = height / 3;
    } else if (locationAlreadyUsed6 == 10) {
      image (object10Image, width/6, height / 3);
      object10X = width/6;
      object10Y = height / 3;
    } 

    if (locationAlreadyUsed7 == 1) { // Assigns coordinates to objects based on their randomized positions
      image (object1Image, width/6*2, height / 3);
      object1X = width/6*2;
      object1Y = height / 3;
    } else if (locationAlreadyUsed7 == 2) {
      image (object2Image, width/6*2, height / 3);
      object2X = width/6*2;
      object2Y = height / 3;
    } else if (locationAlreadyUsed7 == 3) {
      image (object3Image, width/6*2, height / 3);
      object3X = width/6*2;
      object3Y = height / 3;
    } else if (locationAlreadyUsed7 == 4) {
      image (object4Image, width/6*2, height / 3);
      object4X = width/6*2;
      object4Y = height / 3;
    } else if (locationAlreadyUsed7 == 5) {
      image (object5Image, width/6*2, height / 3);
      object5X = width/6*2;
      object5Y = height / 3;
    } else if (locationAlreadyUsed7 == 6) {
      image (object6Image, width/6*2, height / 3);
      object6X = width/6*2;
      object6Y = height / 3;
    } else if (locationAlreadyUsed7 == 7) {
      image (object7Image, width/6*2, height / 3);
      object7X = width/6*2;
      object7Y = height / 3;
    } else if (locationAlreadyUsed7 == 8) {
      image (object8Image, width/6*2, height / 3);
      object8X = width/6*2;
      object8Y = height / 3;
    } else if (locationAlreadyUsed7 == 9) {
      image (object9Image, width/6*2, height / 3);
      object9X = width/6*2;
      object9Y = height / 3;
    } else if (locationAlreadyUsed7 == 10) {
      image (object10Image, width/6*2, height / 3);
      object10X = width/6*2;
      object10Y = height / 3;
    }  

    if (locationAlreadyUsed8 == 1) { // Assigns coordinates to objects based on their randomized positions
      image (object1Image, width/6*3, height / 3);
      object1X = width/6*3;
      object1Y = height / 3;
    } else if (locationAlreadyUsed8 == 2) {
      image (object2Image, width/6*3, height / 3);
      object2X = width/6*3;
      object2Y = height / 3;
    } else if (locationAlreadyUsed8 == 3) {
      image (object3Image, width/6*3, height / 3);
      object3X = width/6*3;
      object3Y = height / 3;
    } else if (locationAlreadyUsed8 == 4) {
      image (object4Image, width/6*3, height / 3);
      object4X = width/6*3;
      object4Y = height / 3;
    } else if (locationAlreadyUsed8 == 5) {
      image (object5Image, width/6*3, height / 3);
      object5X = width/6*3;
      object5Y = height / 3;
    } else if (locationAlreadyUsed8 == 6) {
      image (object6Image, width/6*3, height / 3);
      object6X = width/6*3;
      object6Y = height / 3;
    } else if (locationAlreadyUsed8 == 7) {
      image (object7Image, width/6*3, height / 3);
      object7X = width/6*3;
      object7Y = height / 3;
    } else if (locationAlreadyUsed8 == 8) {
      image (object8Image, width/6*3, height / 3);
      object8X = width/6*3;
      object8Y = height / 3;
    } else if (locationAlreadyUsed8 == 9) {
      image (object9Image, width/6*3, height / 3);
      object9X = width/6*3;
      object9Y = height / 3;
    } else if (locationAlreadyUsed8 == 10) {
      image (object10Image, width/6*3, height / 3);
      object10X = width/6*3;
      object10Y = height / 3;
    } 

    if (locationAlreadyUsed9 == 1) { // Assigns coordinates to objects based on their randomized positions
      image (object1Image, width/6*4, height / 3);
      object1X = width/6*4;
      object1Y = height / 3;
    } else if (locationAlreadyUsed9 == 2) {
      image (object2Image, width/6*4, height / 3);
      object2X = width/6*4;
      object2Y = height / 3;
    } else if (locationAlreadyUsed9 == 3) {
      image (object3Image, width/6*4, height / 3);
      object3X = width/6*4;
      object3Y = height / 3;
    } else if (locationAlreadyUsed9 == 4) {
      image (object4Image, width/6*4, height / 3);
      object4X = width/6*4;
      object4Y = height / 3;
    } else if (locationAlreadyUsed9 == 5) {
      image (object5Image, width/6*4, height / 3);
      object5X = width/6*4;
      object5Y = height / 3;
    } else if (locationAlreadyUsed9 == 6) {
      image (object6Image, width/6*4, height / 3);
      object6X = width/6*4;
      object6Y = height / 3;
    } else if (locationAlreadyUsed9 == 7) {
      image (object7Image, width/6*4, height / 3);
      object7X = width/6*4;
      object7Y = height / 3;
    } else if (locationAlreadyUsed9 == 8) {
      image (object8Image, width/6*4, height / 3);
      object8X = width/6*4;
      object8Y = height / 3;
    } else if (locationAlreadyUsed9 == 9) {
      image (object9Image, width/6*4, height / 3);
      object9X = width/6*4;
      object9Y = height / 3;
    } else if (locationAlreadyUsed9 == 10) {
      image (object10Image, width/6*4, height / 3);
      object10X = width/6*4;
      object10Y = height / 3;
    } 

    if (locationAlreadyUsed10 == 1) { // Assigns coordinates to objects based on their randomized positions
      image (object1Image, width/6*5, height / 3);
      object1X = width/6*5;
      object1Y = height / 3;
    } else if (locationAlreadyUsed10 == 2) {
      image (object2Image, width/6*5, height / 3);
      object2X = width/6*5;
      object2Y = height / 3;
    } else if (locationAlreadyUsed10 == 3) {
      image (object3Image, width/6*5, height / 3);
      object3X = width/6*5;
      object3Y = height / 3;
    } else if (locationAlreadyUsed10 == 4) {
      image (object4Image, width/6*5, height / 3);
      object4X = width/6*5;
      object4Y = height / 3;
    } else if (locationAlreadyUsed10 == 5) {
      image (object5Image, width/6*5, height / 3);
      object5X = width/6*5;
      object5Y = height / 3;
    } else if (locationAlreadyUsed10 == 6) {
      image (object6Image, width/6*5, height / 3);
      object6X = width/6*5;
      object6Y = height / 3;
    } else if (locationAlreadyUsed10 == 7) {
      image (object7Image, width/6*5, height / 3);
      object7X = width/6*5;
      object7Y = height / 3;
    } else if (locationAlreadyUsed10 == 8) {
      image (object8Image, width/6*5, height / 3);
      object8X = width/6*5;
      object8Y = height / 3;
    } else if (locationAlreadyUsed10 == 9) {
      image (object9Image, width/6*5, height / 3);
      object9X = width/6*5;
      object9Y = height / 3;
    } else if (locationAlreadyUsed10 == 10) {
      image (object10Image, width/6*5, height / 6);
      object10X = width/6*5;
      object10Y = height / 3;
    } 

    stroke (255);
    line (0, height/2, width, height/2);
    screenMode = 3; // Proceeds from setup to interactive stage
  } else if (screenMode == 3) { // Draws graphics for the first guess - CD Drive. Note: User input is handled in mousePressed() under conditional else if (screenMode == 3)
    stroke (255);
    line (0, height/2, width, height/2);
    image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
    image (object1Image, object1X, object1Y);
    image (object2Image, object2X, object2Y);
    image (object3Image, object3X, object3Y);
    image (object4Image, object4X, object4Y);
    image (object5Image, object5X, object5Y);
    image (object6Image, object6X, object6Y);
    image (object7Image, object7X, object7Y);
    image (object8Image, object8X, object8Y);
    image (object9Image, object9X, object9Y);
    image (object10Image, object10X, object10Y);
    text ("CD Drive", width/6, 520);

    currentObjectX = object1X; // Determines and stores the coordinates of the current object to be guessed to ascertain whether the user will/has found the happy face or not.
    currentObjectY = object1Y;
  } else if (screenMode == 4) { // Draws graphics for the second guess. Note: User input is handled in mousePressed() under conditional else if (screenMode == 4)
    stroke (255);
    line (0, height/2, width, height/2);
    image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
    image (object1Image, width/6, 440);
    image (object2Image, object2X, object2Y);
    image (object3Image, object3X, object3Y);
    image (object4Image, object4X, object4Y);
    image (object5Image, object5X, object5Y);
    image (object6Image, object6X, object6Y);
    image (object7Image, object7X, object7Y);
    image (object8Image, object8X, object8Y);
    image (object9Image, object9X, object9Y);
    image (object10Image, object10X, object10Y);
    text ("CD Drive", width/6, 520);
    text ("Computer Case", width/6*2, 520);

    currentObjectX = object2X; // Determines and stores the coordinates of the current object to be guessed to ascertain whether the user will/has found the happy face or not.
    currentObjectY = object2Y;
  } else if (screenMode == 5) { // Draws graphics for the third guess. Note: User input is handled in mousePressed() under conditional else if (screenMode == 5)
    stroke (255);
    line (0, height/2, width, height/2);
    image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
    image (object1Image, width/6, 440);
    image (object2Image, width/6*2, 440);
    image (object3Image, object3X, object3Y);
    image (object4Image, object4X, object4Y);
    image (object5Image, object5X, object5Y);
    image (object6Image, object6X, object6Y);
    image (object7Image, object7X, object7Y);
    image (object8Image, object8X, object8Y);
    image (object9Image, object9X, object9Y);
    image (object10Image, object10X, object10Y);
    text ("CD Drive", width/6, 520);
    text ("Computer Case", width/6*2, 520);
    text ("CPU", width/6*3, 520);

    currentObjectX = object3X; // Determines and stores the coordinates of the current object to be guessed to ascertain whether the user will/has found the happy face or not.
    currentObjectY = object3Y;
  } else if (screenMode == 6) { // Draws graphics for the fourth guess. Note: User input is handled in mousePressed() under conditional else if (screenMode == 6)
    stroke (255);
    line (0, height/2, width, height/2);
    image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
    image (object1Image, width/6, 440);
    image (object2Image, width/6*2, 440);
    image (object3Image, width/6*3, 440);
    image (object4Image, object4X, object4Y);
    image (object5Image, object5X, object5Y);
    image (object6Image, object6X, object6Y);
    image (object7Image, object7X, object7Y);
    image (object8Image, object8X, object8Y);
    image (object9Image, object9X, object9Y);
    image (object10Image, object10X, object10Y);
    text ("CD Drive", width/6, 520);
    text ("Computer Case", width/6*2, 520);
    text ("CPU", width/6*3, 520);
    text ("Fan", width/6*4, 520);

    currentObjectX = object4X; // Determines and stores the coordinates of the current object to be guessed to ascertain whether the user will/has found the happy face or not.
    currentObjectY = object4Y;
  } else if (screenMode == 7) { // Draws graphics for the fifth guess. Note: User input is handled in mousePressed() under conditional else if (screenMode == 7)
    stroke (255);
    line (0, height/2, width, height/2);
    image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
    image (object1Image, width/6, 440);
    image (object2Image, width/6*2, 440);
    image (object3Image, width/6*3, 440);
    image (object4Image, width/6*4, 440);
    image (object5Image, object5X, object5Y);
    image (object6Image, object6X, object6Y);
    image (object7Image, object7X, object7Y);
    image (object8Image, object8X, object8Y);
    image (object9Image, object9X, object9Y);
    image (object10Image, object10X, object10Y);
    text ("CD Drive", width/6, 520);
    text ("Computer Case", width/6*2, 520);
    text ("CPU", width/6*3, 520);
    text ("Fan", width/6*4, 520);
    text ("GPU", width/6*5, 520);

    currentObjectX = object5X; // Determines and stores the coordinates of the current object to be guessed to ascertain whether the user will/has found the happy face or not.
    currentObjectY = object5Y;
  } else if (screenMode == 8) { // Draws graphics for the sixth guess. Note: User input is handled in mousePressed() under conditional else if (screenMode == 8)
    stroke (255);
    line (0, height/2, width, height/2);
    image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
    image (object1Image, width/6, 440);
    image (object2Image, width/6*2, 440);
    image (object3Image, width/6*3, 440);
    image (object4Image, width/6*4, 440);
    image (object5Image, width/6*5, 440);
    image (object6Image, object6X, object6Y);
    image (object7Image, object7X, object7Y);
    image (object8Image, object8X, object8Y);
    image (object9Image, object9X, object9Y);
    image (object10Image, object10X, object10Y);
    text ("CD Drive", width/6, 520);
    text ("Computer Case", width/6*2, 520);
    text ("CPU", width/6*3, 520);
    text ("Fan", width/6*4, 520);
    text ("GPU", width/6*5, 520);
    text ("Hard Drive", width/6, 680);

    currentObjectX = object6X; // Determines and stores the coordinates of the current object to be guessed to ascertain whether the user will/has found the happy face or not.
    currentObjectY = object6Y;
  } else if (screenMode == 9) { // Draws graphics for the seventh guess. Note: User input is handled in mousePressed() under conditional else if (screenMode == 9)
    stroke (255);
    line (0, height/2, width, height/2);
    image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
    image (object1Image, width/6, 440);
    image (object2Image, width/6*2, 440);
    image (object3Image, width/6*3, 440);
    image (object4Image, width/6*4, 440);
    image (object5Image, width/6*5, 440);
    image (object6Image, width/6, 590);
    image (object7Image, object7X, object7Y);
    image (object8Image, object8X, object8Y);
    image (object9Image, object9X, object9Y);
    image (object10Image, object10X, object10Y);
    text ("CD Drive", width/6, 520);
    text ("Computer Case", width/6*2, 520);
    text ("CPU", width/6*3, 520);
    text ("Fan", width/6*4, 520);
    text ("GPU", width/6*5, 520);
    text ("Hard Drive", width/6, 680);
    text ("Modem", width/6*2, 680);

    currentObjectX = object7X; // Determines and stores the coordinates of the current object to be guessed to ascertain whether the user will/has found the happy face or not.
    currentObjectY = object7Y;
  } else if (screenMode == 10) { // Draws graphics for the eigth guess. Note: User input is handled in mousePressed() under conditional else if (screenMode == 12)
    stroke (255);
    line (0, height/2, width, height/2);
    image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
    image (object1Image, width/6, 440);
    image (object2Image, width/6*2, 440);
    image (object3Image, width/6*3, 440);
    image (object4Image, width/6*4, 440);
    image (object5Image, width/6*5, 440);
    image (object6Image, width/6, 590);
    image (object7Image, width/6*2, 590);
    image (object8Image, object8X, object8Y);
    image (object9Image, object9X, object9Y);
    image (object10Image, object10X, object10Y);
    text ("CD Drive", width/6, 520);
    text ("Computer Case", width/6*2, 520);
    text ("CPU", width/6*3, 520);
    text ("Fan", width/6*4, 520);
    text ("GPU", width/6*5, 520);
    text ("Hard Drive", width/6, 680);
    text ("Modem", width/6*2, 680);
    text ("Motherboard", width/6*3, 680);

    currentObjectX = object8X; // Determines and stores the coordinates of the current object to be guessed to ascertain whether the user will/has found the happy face or not.
    currentObjectY = object8Y;
  } else if (screenMode == 11) { // Draws graphics for the ninth guess. Note: User input is handled in mousePressed() under conditional else if (screenMode == 11)
    stroke (255);
    line (0, height/2, width, height/2);
    image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
    image (object1Image, width/6, 440);
    image (object2Image, width/6*2, 440);
    image (object3Image, width/6*3, 440);
    image (object4Image, width/6*4, 440);
    image (object5Image, width/6*5, 440);
    image (object6Image, width/6, 590);
    image (object7Image, width/6*2, 590);
    image (object8Image, width/6*3, 590);
    image (object9Image, object9X, object9Y);
    image (object10Image, object10X, object10Y);
    text ("CD Drive", width/6, 520);
    text ("Computer Case", width/6*2, 520);
    text ("CPU", width/6*3, 520);
    text ("Fan", width/6*4, 520);
    text ("GPU", width/6*5, 520);
    text ("Hard Drive", width/6, 680);
    text ("Modem", width/6*2, 680);
    text ("Motherboard", width/6*3, 680);
    text ("RAM", width/6*4, 680);

    currentObjectX = object9X; // Determines and stores the coordinates of the current object to be guessed to ascertain whether the user will/has found the happy face or not.
    currentObjectY = object9Y;
  } else { // Draws graphics for the tenth guess. Note: User input is handled in mousePressed() under conditional else if (screenMode == 12)
    stroke (255);
    line (0, height/2, width, height/2);
    image (happyFaceImage, happyFaceUnderX, happyFaceUnderY);
    image (object1Image, width/6, 440);
    image (object2Image, width/6*2, 440);
    image (object3Image, width/6*3, 440);
    image (object4Image, width/6*4, 440);
    image (object5Image, width/6*5, 440);
    image (object6Image, width/6, 590);
    image (object7Image, width/6*2, 590);
    image (object8Image, width/6*3, 590);
    image (object9Image, width/6*4, 590);
    image (object10Image, object10X, object10Y);
    text ("CD Drive", width/6, 520);
    text ("Computer Case", width/6*2, 520);
    text ("CPU", width/6*3, 520);
    text ("Fan", width/6*4, 520);
    text ("GPU", width/6*5, 520);
    text ("Hard Drive", width/6, 680);
    text ("Modem", width/6*2, 680);
    text ("Motherboard", width/6*3, 680);
    text ("RAM", width/6*4, 680);
    text ("SSD", width/6*5, 680);

    currentObjectX = object10X;  // Determines and stores the coordinates of the current object to be guessed to ascertain whether the user will/has found the happy face or not.
    currentObjectY = object10Y;
  }
}

void scores () { // Calculates and outputs the user's score when prompted. Returns to mainMenu. User input handled in mousePressed() under conditional if (screenMode == 19)

  fill (255);
  background (0);
  textSize (40);

  if (happyFaceFound == true) { // If the game was won the program delivers a happy message
    background (0, 128, 0);
    if (numCorrect == 1) {
      text ("You got " + round(numCorrect) + " answer correct!", 640, 144);
    } else {
      text ("You got " + round(numCorrect) + " answers correct!", 640, 144);
    }
    text ("You didn't get a single answer wrong!", 640, 288);
    text ("That means you had an accuracy (score) of " + round(numCorrect*100/numCorrect) + "%!", 640, 432); // Delivers accuracy (score) in percentage using numCorrect / numCorrect + 1 (or numAttempts)
  } else { // If the game was lost the program delivers an encouraging message
    background (128, 0, 0);
    if (numCorrect == 1) {
      text ("You got " + round(numCorrect) + " answer correct!", 640, 144);
    } else {
      text ("You got " + round(numCorrect) + " answers correct!", 640, 144);
    }
    text ("Unfortunately, you chose wrong.", 640, 288);
    if (numCorrect > 0) {
      text ("You still had an accuracy (score) of " + round(numCorrect*100/(numCorrect+1)) + "%...", 640, 432); // Delivers accuracy (score) in percentage using numCorrect / numCorrect + 1 (or numAttempts)
    } else {
      text ("You had an accuracy (score) of " + round(numCorrect*100/(numCorrect+1)) + "%.", 640, 432); // Delivers accuracy (score) in percentage using numCorrect / numCorrect + 1 (or numAttempts)
    }
  }
  text ("Click anywhere on the screen to continue to the main menu.", 640, 576);
}

void instructions () { // Outputs instructions of game when prompted. Returns to mainMenu. User input handled in mousePressed() under conditional if (screenMode == 20)

  background (0);
  textSize (35);
  text ("Welcome to Hide and Seek!", 640, 108);
  textSize (15);
  text ("The object of Hide and Seek is to find a happy face randomly", 640, 194.4);
  text ("hidden under one of ten randomly placed objects on screen.", 640, 266.4); 
  text ("To look under an object, you must correctly identify it", 640, 338.4);
  text ("(click on it) when its name comes up below the game screen.", 640, 410.4);
  text ("If you choose right, you get another object name.", 640, 482.4);
  text ("However, be warned: if you choose wrong, you lose.", 640, 554.4);
  textSize (25);
  text ("Click anywhere to return to the main menu", 640, 637.2);
}

void levelSelector () { // Allows user to choose skill level (picture size) - easy, intermediate, hard. Returns to mainMenu. User input handled in mousePressed() under conditional if (screenMode == 30)

  background (0);
  textSize (40);
  text ("Easy (Big Pictures)", 640, 135);
  text ("Intermediate (Medium Pictures) (Default)", 640, 270);
  text ("Hard (Small Pictures)", 640, 410);
  textSize (20);
  text ("Click on the difficulty you wish to play in to choose it,", 640, 550);
  text ("or click anywhere else to go back to the main menu without changes.", 640, 640);
  rect (640, height / 6, 900, 100);
  rect (640, 255, 900, 100);
  rect (640, 395, 900, 100);
}

void goodbye () { // Outputs exit text before exiting program when prompted. User input handled in mousePressed() under conditional if (screenMode == 40)

  screenMode = 41;
  background (0);
  textSize (30);
  text ("Thank you for playing Hide and Seek.", 640, height / 6);
  text ("Hide and Seek was developed by Aidan Ang", 640, height / 3);
  text ("for the TDSB from", 640, 360);
  text ("December of 2018 to January of 2019.", 640, 480);
  text ("Click anywhere on the screen to end the game.", 640, 600);
}
