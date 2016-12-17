void vizONE() {
  
  //Declare local variables
  int sumSlight = 0;
  float mSlight = 0;
  int sumSerious = 0;
  float mSerious = 0;
  int sumFatal = 0;
  float mFatal = 0;
  String[] baseString = new String[3];
  baseString[0] = "Slight";
  baseString[1] = "Serious";
  baseString[2] = "Fatal";
  String rowString;
  int maxDiameter = wlength - (tmargin * 2);
  int totalInjuries = 0;
    
  fill(175,255,253);
  noStroke();
  rect(lmargin, tmargin, rmargin, bmargin);
       
  for (int crow = 1 ; crow < gvAccidentTable.getRowCount() ; crow++) {
    rowString = gvAccidentTable.getString(crow, 11);
    //print("\nRow " + crow + ": " + gvAccidentTable.getString(crow, 11));
    if (rowString.equals(baseString[0])) {
      sumSlight++;
    } else {
      if (rowString.equals(baseString[1])) {
        sumSerious++;
      } else {
        if (rowString.equals(baseString[2])) {
        sumFatal++;
        }
      }
    }      
  }
   
  for ( int i = 0 ; i < 3; i++) {
    mSlight = map(float(sumSlight), 0, sumSlight, 0, maxDiameter*2);
    fill(255, 210, 210);
    // ellipse(cxline-150, cyline, mSlight, mSlight);
    arc(cxline, tmargin, mSlight, mSlight, 0, PI);
    
    mSerious = map(float(sumSerious), 0, sumSlight, 0, maxDiameter*2);
    stroke(0);
    fill(255, 160, 160);
    ellipse(cxline, bmargin + tmargin - (mSerious/2), mSerious, mSerious);
     
    mFatal = map(float(sumFatal), 0, sumSlight, 0, maxDiameter*2);
    fill(255, 0, 0);
    ellipse(cxline, bmargin + tmargin - (mFatal/2), mFatal, mFatal);
    noStroke();
  }
 
    totalInjuries = sumSlight+sumSerious+sumFatal;    
    textAlign(CENTER,CENTER);
    fill(0,0,0);
    text(" Slight Injuries - " + str(sumSlight) + " or " + str(round((float(sumSlight)/float(totalInjuries)*100))) + "%", cxline, cyline-100);
    textAlign(RIGHT,CENTER);
    text(" Serious Injuries - " + str(sumSerious) + " or " + str(round((float(sumSerious)/float(totalInjuries)*100))) + "%", cxline - mSerious/2-5, bmargin+tmargin - (mSerious/2));
    textAlign(LEFT,CENTER);
    text(" Fatal Injuries - " + str(sumFatal) + " or " + str(round((float(sumFatal)/float(totalInjuries)*100))) + "%", cxline + mSerious/4, bmargin+tmargin - (mFatal));
 
    /*
    stroke(126);
    line(cxline-150 + (mSerious/2), bmargin + tmargin - (mSerious/2), cxline + 100, bmargin+tmargin - (mSerious/2));
    line(cxline-138, bmargin + tmargin - (mFatal/2) - 2, cxline + 100, bmargin+tmargin - (mFatal/2) - 14);
    */
    
  // Debugging Junk
  println("Slight = " + sumSlight + ".Serious = " + sumSerious + ".Fatal = " + sumFatal + ".");
  println("Total Records " + str(sumSlight+sumSerious+sumFatal) + ".");
  println("Total Records " + str(totalInjuries) + ".");
  println(float(sumSlight)/float(totalInjuries));
  
  //Set Statistic Title
  setStatTitle("Grasping Severity");
  
}