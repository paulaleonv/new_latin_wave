//I am not using this library yet import peasy.*; import peasy.org.apache.commons.math.*; import peasy.org.apache.commons.math.geometry.*;
//library to work with strings
import rita.*;

// functions to capture the words from my dreams.txt and to write
RiMarkov markov;
RiLexicon lexicon;

//texts to display
String[] poem = new String[7];
String[] files = { "private/dreams_curation.txt", "private/dreams_input.txt" };
//numberLines has the same length as the poem array
//in this case, there are seven items
int[] numberLines = {1000, 15, 15, 12, 10, 20, 30};

//This works for a Rita example to write 
char letter;
String words = " ";

//speeds of movement of texts
float[] speeds = new float[7];
//there are seven speed increments
float[] speedDeltas = {0.01, 0.05, 0.09, 0.1, 0.5, 0.3, 0.04};

int fontinc = 0;

//variables for the mouseclicked text
int x = 160;
int y = 240;

boolean hasLoaded = false;

//PVector array for translate
PVector[] translations = new PVector[7];
//PVector array for rotation
PVector[] rotations = new PVector[7];
//array for colors
color[] colors = new color[7];
//array for positions
PVector[] positions = new PVector[7];


void setup() {

  size(1080, 800, P3D);

  noStroke();

  textFont(createFont("Avenir Next Condensed", 12));
  textAlign(RIGHT);

  frameRate(30);

  // setting up the matched sentences of dreams, through markov
  markov = new RiMarkov(4);
  markov.loadFrom(files, this);

  //initialize poems to be a single space character
  for (int i = 0; i < poem.length; i++) {
    poem[i] = (" ");
  }

  setupTranslation();
  setupRotation();
  setupColor();
  setupPosition();
}

void draw() {


  if (!hasLoaded) {
    if (!markov.ready()) {
      hasLoaded = true;
      return;
    }
    x = 50;
    y = 50;

    for (int i = 0; i < poem.length; i++) {
      poem[i] = RiTa.join(markov.generateSentences(numberLines[i]), " ");
    }  

    hasLoaded = true;
  }

  //black background
  background(0);

  lights();

  ////draw the poems
  //for (int i = 0; i < poem.length; i++) {
  for (int i = 0; i < 6; i++) {
    pushMatrix();
    //translate
    translate(translations[i].x, translations[i].y, translations[i].z);
    //rotateX
    rotateX(rotations[i].x);
    //rotateY
    rotateY(rotations[i].y);
    //rotateZ
    rotateZ(rotations[i].z);
    //translate(-width, -height, 0);
    //fill
    fill(colors[i]);
    //textFont
    textFont(createFont("Avenir Next Condensed", 12));
    //text
    //text(poem[i], positions[i].x, positions[i].y, positions[i].z, 500);
    text(poem[3], width/2-width/3, 30*-speeds[5], 400, 500);
    popMatrix();
  }
  ////Drawing texts
  ////drawing green principal/readable text
  //pushMatrix();
  //translate(width, height/5, 0);
  //rotateX(radians(62 + speeds[5]));
  ////rotateY(radians(10));
  ////rotateZ(radians(10));
  //translate(-width, -height, 0); 
  ////green text
  //fill(16, 183, 193);
  //textFont(createFont("Avenir Next Condensed", 12));
  //text(poem[1], width/2-width/7, 300 * speeds[5], 300, 500);

  ////white text on the background
  ////translate(width, height/2, 0);
  ////rotateX(radians(40));
  ////rotateY(radians(50));
  ////rotateZ(radians(50*speeds[5]));
  ////translate(-width, -height/2, 0);
  //////white text
  ////fill(255);
  ////text(poem[3], width/2+2*speeds[2], 30 * speeds[1], 100, 500); 
  //popMatrix();


  ////Yellow text starts in the middle of the screen
  //translate(width/4, height/4, 0);
  //translate(-width/4, -height/4, 0);  
  //translate(50, 700, 0);
  

  ////Text from Left TOp:it has the input in line 5
  //popMatrix();
  //translate(0, 0, 0);
  //rotateZ(radians(-50));
  //fill(249, 83, 56);
  //text(poem[6], 2, 10*speeds[0], 200, 300);   


  ////Draw text to the center of the screen
  ////Incrementing velocity for the rotation of the cube and sphere
  for (int i = 0; i < speeds.length; i++) {
    speeds[i] += speedDeltas[i];
  }

  fontinc++;

  //// Text for tests
  //textAlign(LEFT);
  //textFont(createFont("Avenir Next Condensed", 36));
  //fill(255);
  //textSize(16);

  //// For input text
  //fill(255, 122, 50);
  //textSize(46);
  //text(words, 200*-speeds[5], 900, 540, 400);

  //pushMatrix();
  //translate(1070, 700, 0);
  //rotateX(radians(10));
  //rotateZ(radians(20));
  //println (mouseX);
  //translate(-1070, -700, 0);

  ////orange text from right below
  //fill(236, 116, 29);
  //text(poem[4], 0, 30*-speeds[1], 200, 300);
  ////text(line5, 10,700, width,height)
  //popMatrix();

  ////white text from right below
  //pushMatrix();
  //translate(1070, 700, 0);
  //rotateX(radians(10));
  //rotateZ(radians(20));
  //println (mouseX);
  ////orange text from right below
  //fill(255);
  //text(poem[4], 2, 1500*-speeds[0], 200, 300);
  ////text(line5, 10,700, width,height);
  //popMatrix();

  //textSize(16);
  //fill (0, 0, 55);
}

void setupTranslation() {
  translations[0] = new PVector(width, height/5, 0);
  translations[1] = new PVector(0, 0, 0);
  translations[2] = new PVector(0, 0, 0);
  translations[3] = new PVector(width/4, height/4, 0);
  translations[4] = new PVector(0, 0, 0);
  translations[5] = new PVector(0, 0, 0);
  translations[6] = new PVector(0, 0, 0);
}

void setupRotation() {
  rotations[0] = new PVector(radians(62 + speeds[5]), radians(10), radians(10));
  rotations[1] = new PVector(0, 0, 0);
  rotations[2] = new PVector(0, 0, 0);
  rotations[3] = new PVector(radians(50), 0, 0);
  rotations[4] = new PVector(0, 0, 0);
  rotations[5] = new PVector(0, 0, 0);
  rotations[6] = new PVector(0, 0, 0);
}

void setupColor() {
  colors[0] = color(16, 183, 193);
  colors[1] = color(255, 255, 255);
  colors[2] = color(255, 255, 255);
  colors[3] = color(248, 223, 56);
  colors[4] = color(255, 255, 255);
  colors[5] = color(255, 255, 255);
  colors[6] = color(255, 255, 255);
}

void setupPosition() {
  positions[0] = new PVector(width/2-width/7, 300 * speeds[5], 300);
  positions[1] = new PVector(0, 0, 0);
  positions[2] = new PVector(0, 0, 0);
  positions[3] = new PVector(0, 0, 0);
  positions[4] = new PVector(0, 0, 0);
  positions[5] = new PVector(0, 0, 0);
  positions[6] = new PVector(0, 0, 0);
}