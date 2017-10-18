//I am not using this library yet import peasy.*; import peasy.org.apache.commons.math.*; import peasy.org.apache.commons.math.geometry.*;
//library to work with strings
import rita.*;

// functions to capture the words from my dreams.txt and to write
RiMarkov markov;
RiLexicon lexicon;

//texts to display
String[] poem = new String[7];
String[] files = { "private/dreams_curation.txt", "private/dreams_input.txt" };

//This works for a Rita example to write 
char letter;
String words = " ";

//to increment the movement of the texts
float[] speeds = new float[6];

int fontinc = 0;

//variables for the mouseclicked text
int x = 160;
int y = 240;

boolean hasLoaded = false;

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
}

void draw() {

  if (!hasLoaded) {
    if (!markov.ready()) {
      hasLoaded = true;
      return;
    }
    x = 50;
    y = 50;
    String[] lines1 = markov.generateSentences(1000);
    poem[1] = RiTa.join(lines1, " ");
    String[] lines2 = markov.generateSentences(6);
    poem[2] = RiTa.join(lines2, " ");
    String[] lines3 = markov.generateSentences(12);
    poem[3] = RiTa.join(lines3, " ");
    String[] lines4 = markov.generateSentences(15);
    poem[4] = RiTa.join(lines4, " ");
    String[] lines5 = markov.generateSentences(4);
    poem[5] = RiTa.join(lines5, " ");
    String[] lines6 = markov.generateSentences(5);
    hasLoaded = true;
  }


  background(0);

  lights();

  //Drawing texts 
  //drawing green principal/readable text
  pushMatrix();
  translate(width, height/5, 0);
  rotateX(radians(62 + speeds[5]));
  //rotateY(radians(10));
  //rotateZ(radians(10));
  println (mouseX);
  translate(-width, -height, 0);
  //green text
  fill(16, 183, 193);
  textFont(createFont("Avenir Next Condensed", 12));
  text(poem[1], width/2-width/7, 300 * speeds[5], 300, 500);

  //white text on the background
  translate(width, height/2, 0);
  rotateX(radians(40));
  rotateY(radians(50));
  rotateZ(radians(50*speeds[5]));
  translate(-width, -height/2, 0);
  //white text
  fill(255);
  text(poem[3], width/2+2*speeds[2], 30 * speeds[1], 100, 500); 
  popMatrix();


  //Yellow text starts in the middle of the screen
  translate(width/4, height/4, 0);
  rotateX(radians(50));
  //rotateY(radians(10));
  //rotateZ(radians(-50));
  translate(-width/4, -height/4, 0);
  //yelow text fstarting left down the screen
  //fill(240,45,19);
  //text(line4,200,-120*-inc,400,500);
  pushMatrix();   
  translate(50, 700, 0);
  //rotateX(radians(50));
  //rotateY(radians(10));
  //rotateZ(radians(-50));
  fill(255);
  //text(line4,2*-speeds[2],30,400,500);
  //translate(-50,-70,0);
  //textFont(createFont("Avenir Next Condensed", 12));
  //yellow text left below
  fill(248, 223, 56);
  text(poem[3], width/2-width/3, 30*-speeds[5], 400, 500);


  //Text from Left TOp:it has the input in line 5
  popMatrix();
  translate(0, 0, 0);
  rotateZ(radians(-50));
  fill(249, 83, 56);
  text(poem[6], 2, 10*speeds[0], 200, 300);   


  //Draw text to the center of the screen
  //Incrementing velocity for the rotation of the cube and sphere
  speeds[5] += 0.01;
  speeds[0] += 0.05;
  speeds[1] += 0.09;
  speeds[2] += 0.1;
  fontinc++;

  // Text for tests
  textAlign(LEFT);
  textFont(createFont("Avenir Next Condensed", 36));
  fill(255);
  textSize(16);

  // For input text
  fill(255, 122, 50);
  textSize(46);
  text(words, 200*-speeds[5], 900, 540, 400);

  pushMatrix();
  translate(1070, 700, 0);
  rotateX(radians(10));
  rotateZ(radians(20));
  println (mouseX);
  translate(-1070, -700, 0);

  //orange text from right below
  fill(236, 116, 29);
  text(poem[4], 0, 30*-speeds[1], 200, 300);
  //text(line5, 10,700, width,height)
  popMatrix();

  //white text from right below
  pushMatrix();
  translate(1070, 700, 0);
  rotateX(radians(10));
  rotateZ(radians(20));
  println (mouseX);
  //orange text from right below
  fill(255);
  text(poem[4], 2, 1500*-speeds[0], 200, 300);
  //text(line5, 10,700, width,height);
  popMatrix();

  textSize(16);
  fill (0, 0, 55);
  //text(line4, -160,1000*inc, 200,300);
}