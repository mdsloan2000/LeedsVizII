
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

// margin size global variables
int lmargin = 50;
int rmargin = wwidth-lmargin*2;
int tmargin = 100;
int bmargin = wlength-tmargin-50;

int selection = 1;


void setup() {
  // Set up the main page.
  size(1024,768);
  resetBase();

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
        setStatTitle("Grasping Severity");
        println (selection);
        break;
      case 2:
        resetBase();
        setStatTitle("Severity Impacts on Sex");
        println (selection);
        break;
      case 3:
        resetBase();
        setStatTitle("Distributing Severity Locations");    
        println (selection);
        break;
      case 4:
        resetBase();
        setStatTitle("Accident Rates Increase As the Year Progresses");    
        println (selection);
        break;
      case 5:
        resetBase();
        setStatTitle("Weather and Non-Superfical Accidents");
        println (selection);
        break;
      default:
        resetBase();
        setStatTitle("Press Keys 1 - 5 for a Statistic"); 
        println ("No Valid Selection - " + selection);  
    }
  } else {
    println ("No Press");
  }
}

void resetBase() {
    background(#FAF590);
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