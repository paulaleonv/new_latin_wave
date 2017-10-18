//library to work with strings
//import rita.

// var for the temporary logo of the page
  let logoImage;
// var for user input
  let userNewDreamInput;
// var for the button
  let sendDreamButton;
  //variable for the json file that archive the dreams
  let newDream=[];
// var for an array (json file) of dreams that maybe can ve use to archive newdreams
  let othersDreams;
// variable to a record button to record voice.
 let= recordVoiceButton;
 //variable to creat new json file (still need to work on this)
 let= json

  //variables to make the sound recording system workvar recordDream;
let stopRecording;
let mic;
let recorder;
let soundFile;
let state = 0;

  function preload() {
 //loading the json file / still not using it.
 //this file has some dreams of classmates/ then i should be replace by newDream[] in the future.
  othersDreams=loadJSON("othersDreams.json");

  }

function setup() {
  noCanvas();
  json = {}; // new JSON Object
  //transform html in js.
  userNewDreamInput= select("#userDreamInput");
  sendDreamButton= select("#sendDream");
  recordVoiceButton=select("dreamRecorderImage");

  //activating function that save the send new dream
  sendDreamButton.mousePressed(saveDreams);


  //Activating button TO RECORD DREAMS
  /*recordVoiceButton.mousePressed(startRec);
     mic = new p5.AudioIn();
   // prompts user to enable their browser mic
     mic.start();

   // create a sound recorder
    recorder = new p5.SoundRecorder();
   // connect the mic to the recorder
    recorder.setInput(mic);
   // this sound file will be used to
   // playback & save the recording
    soundFile = new p5.SoundFile(); */










}

  //here is my customize function to save files in the array after send button is pressed

function saveDreams () {
    let userDream= userNewDreamInput.value();
    //document.getElementById('writeInput').value = "I dream d in a dream I saw a city invincible to the attacks of the
//whole of the rest of the earth.";
    console.log (userDream);
        json.id = 0;
        json.dream = userDream;
        //let keywordsOfDream= keywords.value();
        //json.keywords = keywordsOfDream;
        //json.keywords = 'keywordsInput';
        //console.log ("are you checking keywords input?");

    saveJSON(userDream,'newDream.json');
    console.log ("newDream[0]");


  }

//Creating a function to make the record button work
/*function startRec(){

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
*/
