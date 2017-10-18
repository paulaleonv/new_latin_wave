var img;
var newDream=[];
var circles = [];
var canvas;
var keywords;
var categorize;
var date;
var place;
var writeDream;
var sendButton;
var sendYourDream;
var othersDreamsGift;
var receiveDream;
var lengthJSON = 0;
var json;
var backButton;
var dreams = [];
var recordDream;
var stopRecording;
var mic;
var recorder; 
var soundFile;
var state = 0;

function preload() {
    
    dreams = loadJSON("formAssets/dreams.json");
    //this file has some dreams of classmates/ then i should be replace by newDream[] in the future.
    othersDreams=loadJSON("formAssets/othersDreams.json"); 
    img =loadImage("mapAssets/mapa_dreams_1024x768.jpg");
    breathSound = loadSound('formAssets/breathLoop.mp3');

}

function setup() {
    createCanvas(windowWidth, windowHeight);
    //json to save data dreams 
    json = {}; // new JSON Object

    // this button send everything together to newDream.json
    sendButton=createButton("SEND");
    sendButton.id("sendButton");
    sendButton.position(windowWidth*0.65,windowHeight*0.7);
    
    //below is a call function for save dreams
    sendButton.mousePressed(saveDreams);

     //I need to create this function to give a dream back to the user
    //receiveDream=createButton ("Dream gift");
    //receiveDream.id("giftButton");
    //receiveDream.position(windowWidth*0.89,windowHeight*0.92);
    //receiveDream.mouseOver (textDisplay);
    
  //button TO RECORD DREAMS , its working but the sound recorded is not so good. 
    recordDream=createButton("RECORD IT/ STOP");
    recordDream.id("recordButton");
    recordDream.position(windowWidth*0.285,windowHeight*0.7);
    //stopRecording=createButton("Stop"); 
    //stopRecording.id("stopRecordingButton");  
    //stopRecording.position(windowWidth*0.347,windowHeight*0.7);
    
    // if i take this out the program fails. I dont know why.
    button = createButton('click me');
    button.position(19, 19);
    
    
    recordDream.mousePressed(startRec);
    mic = new p5.AudioIn();

  // prompts user to enable their browser mic


    mic.start();
   

  // create a sound recorder
   recorder = new p5.SoundRecorder();

  // connect the mic to the recorder
   recorder.setInput(mic);

  // this sound file will be used to
  // playback & save the recording
   soundFile = new p5.SoundFile();

  // Button to go back to Homepage
    
    backButton=createButton("Back");
    backButton.id("backHome");
    backButton.position(windowWidth*0.06,windowHeight*0.05);
    backButton.mousePressed(backToHomePage);


    // categories that the user can select and are send to newDream.json
    mystical = createCheckbox('       Mystical', false);
    mystical.changed(myCheckedEvent);
    mystical.id("mysticalCategoryCheckbox");
    mystical.class("Categories");
    mystical.position (windowWidth*0.72, windowHeight*0.25);
    nightmare= createCheckbox('       Nightmare', false);
    nightmare.changed(myCheckedEvent);
    nightmare.id("nightmareCategoryCheckbox");
    nightmare.class("Categories");
    nightmare.position (windowWidth*0.72, windowHeight*0.25+60);
    erotic=createCheckbox('       Erotic', false);
    erotic.changed(myCheckedEvent);
    erotic.position (windowWidth*0.72, windowHeight*0.25+120);
    erotic.id("eroticCategoryCheckbox");
    erotic.class("Categories");
    thriller=createCheckbox('       Thriller', false);
    thriller.changed(myCheckedEvent);
    thriller.id("thrillerCategoryCheckbox");
    thriller.class("Categories");
    thriller.position (windowWidth*0.72, windowHeight*0.25+180);
    revelatory=createCheckbox('       Revelatory', false);
    revelatory.changed(myCheckedEvent);
    revelatory.id("revelatoryCategoryCheckbox");
    revelatory.class("Categories");
    revelatory.position (windowWidth*0.72, windowHeight*0.25+240);
    recurrent=createCheckbox('       Recurrent', false);
    recurrent.changed(myCheckedEvent);
    recurrent.id("recurrentCategoryCheckbox");
    recurrent.class("Categories");
    recurrent.position (windowWidth*0.72, windowHeight*0.25+300);
    elaboratory=createCheckbox('       Elaboratory', false);
    elaboratory.changed(myCheckedEvent);
    elaboratory.id("elaboratoryCategoryCheckbox");
    elaboratory.class("Categories");
    elaboratory.position (windowWidth*0.72, windowHeight*0.25+360);
    categorize=createInput('       Other');
    categorize.position (windowWidth*0.72, windowHeight*0.25+420);

    //Circles in the background;
    circles.push(new Circle(windowWidth * 0.70, windowHeight * 0.755, random(-0.2, -0.3), random(-0.2, -0.4), random(100, 150), random(150, 225), random(180, 240), random(5, 10), dreams.dreams[6], 0, 0, 0));
    //this circles has dreams
    circles.push(new Circle(random(0,windowWidth), random(0,windowHeight), -0.001, 0.002, random(200, 250), random(150, 200), random(150, 200),random(5, 10), dreams.dreams[1], 0, windowWidth * 0.011, windowHeight * 0.57));
    circles.push(new Circle(windowWidth / 14, windowHeight * 0.8, random(0.002, 0.004), random(0.01, 0.03), random(200, 240), random(193, 196), random(150, 200), random(1, 15), dreams.dreams[0], 0, windowWidth * 0.011, windowHeight * 0.85));
    circles.push(new Circle(windowWidth * 0.87, 170, random(0.01, 0.06), random(0.03, 0.07), random(100, 150), random(170, 230),random(170, 230), random(5, 10), othersDreams.dreams[1], 0, windowWidth * 0.826, windowHeight * 0.914));
    circles.push(new Circle(windowWidth * 0.78, windowHeight * 0.52, random(0.02, 0.03), random(0.02, 0.04), random(200, 240), random(160, 170), random(100, 190), random(05, 10), dreams.dreams[3], 0, windowWidth * 0.194, windowHeight * 0.5857));
    circles.push(new Circle(windowWidth * 0.615, 130, random(-0.04, -0.1), random(0.02, 0.04), 150, 231, 241, random(5, 10), othersDreams.dreams[0], 0, windowWidth * 0.194, windowHeight * 0.5857));
    circles.push(new Circle(150, 280, random(0.1, 0.3), random(-0.02, -0.04), random(200, 240), random(150, 200), random(160, 190), random(5, 10), dreams.dreams[5], 0, windowWidth * 0.194, windowHeight * 0.5857));
    circles.push(new Circle(windowWidth * 0.87, random (10,170), random(0.1, 0.06), random(-0.03, -0.07), random(100, 150), random(170, 230),random(170, 230), random(5, 10), othersDreams.dreams[2], 0, windowWidth * 0.826, windowHeight * 0.914));
    circles.push(new Circle(150, 280, random(1, 0.03), random(-0.02, -0.04), random(200, 240), random(150, 200), random(160, 190), random(5, 10), dreams.dreams[2], 0, windowWidth * 0.194, windowHeight * 0.5857));
    fill(250, 231, 241);
    
    //Input to write dreams of users
    
    writeDream=createInput('here');
    writeDream.id("writeInput");
    writeDream.position(windowWidth*0.18,windowHeight*0.25);
    //writeDream.size(510,220);
 //end of setup
}

function draw() {

    // Play a Sound
    playBreath();
    
    // Background of the sketch
    background(0);
    
    // Active mic to record audio of dreams
    //micLevel = mic.getLevel();

    // Image Background
    image(img, 0, 0, windowWidth, windowHeight);
    
    // Display circles
    for (var i = 0; i < circles.length; i++) {
        circles[i].display();
        //circles[i].intersection();
        circles[i].move();    
    }

    // I want to return a Poem of Withman after the user send their poem. But is not working jet.
     fill (255,0,0);
   // text("poema waltwithman", windowWidth/2, windowHeight/2);
    
    //Input to write the kwywords of the dream. This has a problem too.
    fill(255,255,255);
    textFont("Helvetica");
    textSize(21);
    text("Keywords", windowWidth*0.285, windowHeight*0.6);
    text("Write your dream", windowWidth*0.285, windowHeight*0.22);
    keywords= createInput('x');
    keywords.id("keywordsInput");
    keywords.position (windowWidth*0.36, windowHeight*0.58);
    keywords.size (windowWidth/3.1,30);
    
}   

  //here is my customize function to save files in the array after send button is pressed

function saveDreams () {
    var userDream= writeDream.value();
   
    //document.getElementById('writeInput').value = "I dream d in a dream I saw a city invincible to the attacks of the
//whole of the rest of the earth.";
    
    console.log (userDream);
    json.id = 0;
    json.dream = userDream;
    var userKeywords= keywords.value();
    json.keywords = userKeywords;
    //json.keywords = 'keywordsInput';
    console.log ("are you checking keywords input?");
    //json.categories= 'dog';
    var checkboxes=selectAll('.Categories');
    json.categories=[];

        for (var i=0;i<checkboxes.length;i++) {
            if (checkboxes[i].elt.firstChild.checked==true) {
            json.categories.push(checkboxes[i].elt.innerText);
            console.log ("are you checking the boxes");
            }
  
            console.log ("are you working?");
        }

    saveJSON(json,'newDream.json');

    
  }


//this function is for the chexboxes of Categories
function myCheckedEvent() {
    
    if (this.checked()) {
      console.log("Checking!");
    } else {
      console.log("Unchecking!");
        }
}

//This function is when the user click over the backButton, goes to Home Page
function backToHomePage () {
    
        window.location="index.html"
}
// i would like this sound to be playing, but is not working.
function playBreath(){
    if (!breathSound.isPlaying()){
        breathSound.play();
        loop();
    }
}

function startRec(){
    
  if (state === 0 && mic.enabled) {

    // record to our p5.SoundFile
    recorder.record(soundFile);

    //background(255,0,0);
    //text('Recording!', 20, 20);
    state++;
  }
  else if (state === 1) {
    //background(0,255,0);

    // stop recorder and
    // send result to soundFile
    recorder.stop();

    //text('Stopped', 20, 20);
    state++;
  }

  else if (state === 2) {
    soundFile.play(); // play the result!
    save(soundFile, 'mySound.wav');
    state++;
  }

}
//circle function, intersection, display, move
function Circle(x, y, xSpeed, ySpeed, colr, colg, colb, colA, dream, place, pX, pY, dreamRecorder) {
  this.xSpeed = xSpeed;
  this.ySpeed = ySpeed;
  this.x = x;
  this.y = y;
  this.colr = colr; 
  this.colg = colg;
  this.colb = colb;
  this.colA = colA;
  this.dream = dream;
  //this.date= date;
  this.place = place;
  this.pX = pX;
  this.pY = pY;
  this.dreamRecorder = dreamRecorder;


    this.display = function() {
      fill(this.colr, this.colg, this.colb);
      ellipse(this.x,this.y,random(5,50),random (5,50));
      // line ( random (this.x-25, this.x+25),random (this.y-25, this.y+25), random (this.x-25, this.x+25), random (this.y-25, this.y+25));
   };

    this.intersection = function() {
      if (mouseX < this.x + 25 && mouseX > this.x - 25 &&
          mouseY < this.y + 25 && mouseY > this.y - 25) {
              fill(255,240,241,150);
              textSize(22);
              text(this.dream.thedream, windowWidth/4, windowHeight/3, 650, 600);
              //textSize(13);
              //text(this.dream.date, 15, 35);
              textSize(15);
              text(this.dream.place, this.pX, this.pY);
              fill(255, 0, 0);
              ellipse(this.pX + 90, this.pY - 5, 5, 5);
              //ellipse ();

            if (this.dreamRecorder === true) {
              dreamForm = true;
            //write here
            }
       }
  };

     this.move = function() {

          this.x = this.x + this.xSpeed;
          this.y = this.y + this.ySpeed;

        if (this.x > width || this.x < 0) {
                this.xSpeed *= -1;
         }

         if (this.y > height || this.y < 0) {
         this.ySpeed *= -1;
         }
     };
}
