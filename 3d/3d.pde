 //I am not using this library yet import peasy.*; import peasy.org.apache.commons.math.*; import peasy.org.apache.commons.math.geometry.*;
//library to work with strings
import rita.*;

// functions to capture the words from my dreams.txt and to write
RiMarkov markov;
RiLexicon lexicon;

//texts to display
String line1 =(" ");
String line2= (" ");
String line3= (" ");
String line4 =(" ");
String line5 =(" ");
String line6 =(" ");
String[] files = { "2004_2016_dreams.txt", "2016dreams2.txt" };

//This works for a Rita example to write 
char letter;
String words = " ";

//to increment the movement of the texts
float inc=0;
//to increment the movement of the texts
float inc1=0;
float inc2=0;
float inc3=0;
float inc4=0;
int fontinc = 0;

//variables for the mouseclicked text
int x = 160, y = 240;

void setup() {
noStroke();
size(1080, 800, P3D);
frameRate(30);
// setting up the matched sentences of dreams, through markov
textFont(createFont("Avenir Next Condensed", 12));
textAlign(RIGHT);


 markov = new RiMarkov(4);
 markov.loadFrom(files, this);
  
  
}

void draw() {
  lights();
  background(0);
  
  //Drawing texts 
  //drawing green principal/readable text
  pushMatrix();
  translate(width, height/5,0);
  rotateX(radians(62+inc));
  //rotateY(radians(10));
  //rotateZ(radians(10));
  println (mouseX);
  translate(-width,-height,0);
  //green text
  fill(16,183,193);
  textFont(createFont("Avenir Next Condensed", 12));
  text(line1,width/2-width/7, 300*inc, 300,500);
 
  //white text on the background
  translate(width, height/2,0);
  rotateX(radians(40));
  rotateY(radians(50));
  rotateZ(radians(50*inc));
  translate(-width,-height/2,0);
  //white text
  fill(255);
  text(line3, width/2+2*inc3,30*inc2, 100,500); 
   popMatrix();
   
   
 //Yellow text starts in the middle of the screen
  translate(width/4, height/4,0);
  rotateX(radians(50));
  //rotateY(radians(10));
  //rotateZ(radians(-50));
  translate(-width/4,-height/4,0);
  //yelow text fstarting left down the screen
  //fill(240,45,19);
  //text(line4,200,-120*-inc,400,500);
  pushMatrix();   
  translate(50, 700,0);
  //rotateX(radians(50));
  //rotateY(radians(10));
  //rotateZ(radians(-50));
   fill(255);
  //text(line4,2*-inc3,30,400,500);
  //translate(-50,-70,0);
  //textFont(createFont("Avenir Next Condensed", 12));
  //yellow text left below
  fill(248,223,56);
  text(line3, width/2-width/3,30*-inc,400,500);

  
  //Text from Left TOp:it has the input in line 5
  popMatrix();
  translate(0,0,0);
  rotateZ(radians(-50));
  fill(249,83,56);
  text(line6, 2,10*inc1, 200,300);   

  
  //Draw text to the center of the screen
  //Incrementing velocity for the rotation of the cube and sphere
 inc+=0.01;
 inc1+=0.05;
 inc2+=0.09;
 inc3+=0.1;
 fontinc++;
 
 // Text for tests
  textAlign(LEFT);
  textFont(createFont("Avenir Next Condensed", 36));
  fill(255);
  textSize(16);
  
  // For input text
  fill(255,122,50);
  textSize(46);
  text(words, 200*-inc, 900, 540, 400);
  
  pushMatrix();
  translate(1070,700,0);
  rotateX(radians(10));
  rotateZ(radians(20));
  println (mouseX);
  translate(-1070,-700,0);

//orange text from right below
  fill(236,116,29);
  text(line4, 0,30*-inc2, 200,300);
  //text(line5, 10,700, width,height)
  popMatrix();
  
//white text from right below
  pushMatrix();
  translate(1070,700,0);
  rotateX(radians(10));
  rotateZ(radians(20));
  println (mouseX);
//orange text from right below
  fill(255);
  text(line4, 2,1500*-inc1, 200,300);
  //text(line5, 10,700, width,height);
  popMatrix();
  
  textSize(16);
  fill (0,0,55);
  //text(line4, -160,1000*inc, 200,300);
 

}

//to write something in the screen
// I do not know if I am using this?

void keyTyped() {
  // The variable "key" always contains the value 
  // of the most recent key pressed.
  if ((key >= 'A' && key <= 'z') || key == ' ') {
    letter = key;
    words = words + key;
    // Write the letter to the console
    println(key);
  }
  if (key == '0') {
    println(words);
    line6 = words;
  }
}

//
void mouseClicked()
{
  if (!markov.ready()) return;
  x = y = 50;
  String[] lines1 = markov.generateSentences(1000);
  line1 = RiTa.join(lines1, " ");
  String[] lines2 = markov.generateSentences(6);
   line2 = RiTa.join(lines2, " ");
  String[] lines3 = markov.generateSentences(12);
   line3 = RiTa.join(lines3, " ");
  String[] lines4 = markov.generateSentences(15);
   line4 = RiTa.join(lines4, " ");
  String[] lines5 = markov.generateSentences(4);
   line5 = RiTa.join(lines5, " ");
  String[] lines6 = markov.generateSentences(5);
 
}