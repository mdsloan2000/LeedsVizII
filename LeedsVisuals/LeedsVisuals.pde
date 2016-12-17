/*
Leeds Accident Data Visualization

Leeds Visuals - An Application for Viewing Visualizatons of Leeds UK Accident Data for 2015.

Author:            Michael Sloan
Submission Date:   12/18/2017

Sources:

*/



// window size global variables
int wlength = 768;
int cyline = wlength/2;
int wwidth = 1024;
int cxline = wwidth/2;
String mainTitle;
int hrefTitle = 20;
int mainTitleTsize = 22;
String statTitle;
int statTitleTsize = 20;
int titlePadding=10; 
int minorTitleTsize = 18;
int bodyTextSize = 11;

// margin size global variables
int lmargin = 50;
int rmargin = wwidth-lmargin*2;
int tmargin = 100;
int bmargin = wlength-tmargin*2;

// data handling global variables
Table gvAccidentTable;

// menu Handling global variables
int selection = 1;


void setup() {
  // Set up the main page.
  size(1024,768);
  resetBase();
  
  // Load Table
  gvAccidentTable = loadTable("2015 Accident Data.csv", "csv");
    
  // Set up default stat title.
  setStatTitle("Press Keys 1 - 5 for a Statistic");

}

void draw() {
  if (keyPressed == true) {
    selection = key-48;    //48 is the ucode offset
    switch(selection) {
      case 1:
        // Set screen
        resetBase();
        vizONE(); 
        break;
      case 2:
        resetBase();
        vizTWO();
        break;
      case 3:
        resetBase();
        vizTHREE();
        break;
      case 4:
        resetBase();
        setStatTitle("Accident Rates Increase As the Year Progresses");    
        //println (selection);
        break;
      case 5:
        resetBase();
        vizFIVE();
        //println (selection);
        break;
      default:
        resetBase();
        setStatTitle("Press Keys 1 - 5 for a Statistic"); 
        //println ("No Valid Selection - " + selection);  
    }
  } else {
    ;
  }
}

void resetBase() {
  background(175,255,253);
  fill(#FFFFFA);
  noStroke();
  rect(lmargin, tmargin, rmargin, bmargin);
  
  // Set up the main title.
  mainTitle = "Visualizations Applied to Leeds Accident Data - 2015";
  fill(1);
  textSize(mainTitleTsize);
  textAlign(CENTER,TOP);
  text(mainTitle, cxline, hrefTitle);  
}

void setStatTitle(String ctitle) {
  statTitle = "Press Keys 1 -5 for a Statistic";
  fill(1);
  textSize(statTitleTsize);
  textAlign(CENTER,TOP);
  text(ctitle, cxline, hrefTitle+mainTitleTsize+titlePadding);
}