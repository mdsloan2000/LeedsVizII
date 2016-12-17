void vizTWO() {
  
  
  int sumSlightMale = 0;
  int sumSlightFemale = 0;
  int sumSeriousMale = 0;
  int sumSeriousFemale = 0;
  int sumFatalMale = 0;
  int sumFatalFemale = 0;
  int totalMale = 0;
  int totalFemale = 0;
  int grandTotal = 0;
  String[] baseString = new String[3];
  baseString[0] = "Slight";
  baseString[1] = "Serious";
  baseString[2] = "Fatal";
  String rowString;
  String[] baseSex = new String[2];
  baseSex[0] = "Male";
  baseSex[1] = "Female";
  String sexString;
  float PercentMaleBar;
  float PercentFemaleBar;
  int totalSlight = 0;
  int totalSerious = 0;
  int totalFatal = 0;
  float mapper1 = 0;
  float mapper2 = 0;
  
  // Local Screen Attributes
  int numBigFeatures = 3;
  int numLittleFeatures = 6;
  int lrmargin = rmargin+lmargin;
  int llmargin = lmargin;
  int ltmargin = tmargin;
  int lbmargin = bmargin+tmargin;
  int lhcenter = cxline;
  int lvcenter = cyline;
  float pwidth = lrmargin-llmargin;
  float plength = lbmargin-ltmargin;
  float bigspan = 0;
  float littlespan = 0;
  
  //Counting Logic
    for (int crow = 1 ; crow <  gvAccidentTable.getRowCount() ; crow++) {
    rowString = gvAccidentTable.getString(crow, 11);
    sexString = gvAccidentTable.getString(crow, 12);
    //print("\nRow " + crow + ": " + gvAccidentTable.getString(crow, 11));
    if (rowString.equals(baseString[0])) {
      if (sexString.equals(baseSex[1])) {
        sumSlightFemale++; 
      } else {
        if (sexString.equals(baseSex[0])); { 
          sumSlightMale++;
        }
      }
    } else {
      if (rowString.equals(baseString[1])) {
        if (sexString.equals(baseSex[1])) {
          sumSeriousFemale++;
        } else {
        if (sexString.equals(baseSex[0])); {
          sumSeriousMale++;
        }
       }
      } else {
        if (rowString.equals(baseString[2])) {
          if (sexString.equals(baseSex[1])) {
              sumFatalFemale++;
            } else {
              if (sexString.equals(baseSex[0])); {
                sumFatalMale++;
              }
            } 
          }
        }      
      }
    }
 
  //Totaling Logic
  totalMale = sumSlightMale+sumSeriousMale+sumFatalMale;
  totalFemale = sumSlightFemale+sumSeriousFemale+sumFatalFemale;
  grandTotal = totalMale+totalFemale;
  
  //Display Logic
  
  //Draw Major Lines
  bigspan = pwidth/numBigFeatures;
  littlespan = pwidth/numLittleFeatures;
  
  for (int i = 0 ; i <= numBigFeatures; i++) {
      stroke(126); 
      line(llmargin+(i*bigspan), ltmargin, llmargin+(i*bigspan),lbmargin);
      //stroke(200);
      //line(llmargin+(i*bigspan) - littlespan, ltmargin, llmargin+(i*bigspan) - littlespan, lvcenter);  
  }
  
  // Add Labels
  stroke(126);
  textSize(statTitleTsize);
  textAlign(CENTER,TOP);
  text("Slight Injuries",llmargin+bigspan-littlespan ,lbmargin+5);
  text("Serious Injuries",llmargin+bigspan*2-littlespan ,lbmargin+5);
  text("Fatalities",llmargin+bigspan*3-littlespan ,lbmargin+5);
  
  // Finish the panel frame.
  line(llmargin, ltmargin,lrmargin, ltmargin);
  line(llmargin, lvcenter,lrmargin, lvcenter);
  line(llmargin, lbmargin,lrmargin, lbmargin);
  setStatTitle("Sex of the Victim Relating to The Severity of Injury");
  
  //Bar Section One
    
  PercentFemaleBar = round(float(sumSlightFemale)/float(sumSlightMale+sumSlightFemale)*100);
  PercentMaleBar = round(float(sumSlightMale)/float(sumSlightMale+sumSlightFemale)*100);
  mapper1 = map(PercentFemaleBar, 0, 100, 0, plength/2);
  //println("Mapper " + mapper1);
  fill(#FF9A03);
  beginShape();
  vertex(llmargin+60, lvcenter);
  vertex(llmargin+60, lvcenter - mapper1);
  vertex(llmargin+(1*bigspan) - littlespan, lvcenter - mapper1);
  vertex(llmargin+(1*bigspan) - littlespan, lvcenter);
  endShape();
 
  
  mapper2 = map(PercentMaleBar, 0, 100, 0, plength/2);
  fill(#0503FF);   
  beginShape();
  vertex(llmargin+(1*bigspan) - littlespan, lvcenter);
  vertex(llmargin+(1*bigspan) - littlespan, lvcenter - mapper2);
  vertex(llmargin+(1*bigspan) - 60, lvcenter - mapper2);
  vertex(llmargin+(1*bigspan) - 60, lvcenter);
  endShape();
  
  fill(0,0,0);
  textSize(bodyTextSize);
  textAlign(CENTER, BOTTOM);
  text(sumSlightFemale + " Injuries", llmargin+bigspan*1-(littlespan*1.25)-4, lvcenter );
  fill(255,255,255);
  text(sumSlightMale + " Injuries", llmargin+bigspan*1-(.75*littlespan)+4, lvcenter );
  
  fill(0,0,0);  
  textSize(bodyTextSize);
  text((float(round(((float(sumSlightFemale)/float((sumSlightFemale+sumSlightMale)))*100)*100)))/100 + "% Females",
    llmargin+bigspan*1-(littlespan*1.25)-4, lvcenter-mapper1-2 );
  text((float(round(((float(sumSlightMale)/float((sumSlightFemale+sumSlightMale)))*100)*100)))/100 + "% Males",
    llmargin+bigspan*1-(.75*littlespan)+4, lvcenter-mapper2-2 );

  
  
   //Add Injury Count Labels
  
  //println(sumSlightMale);
  //println(sumSlightFemale);

  //Section One - Rect One
  //Sect One - Rect two
  
  
  //Bar Section Two
  PercentFemaleBar = round(float(sumSeriousFemale)/float(sumSeriousMale+sumSeriousFemale)*100);
  PercentMaleBar = round(float(sumSeriousMale)/float(sumSeriousMale+sumSeriousFemale)*100);
  mapper1 = map(PercentFemaleBar, 0, 100, 0, plength/2);
  mapper2 = map(PercentMaleBar, 0, 100, 0, plength/2);
  //println("Mapper " + mapper1);
  fill(#FF9A03);
  beginShape();
  vertex(llmargin+60+bigspan, lvcenter);
  vertex(llmargin+60+bigspan, lvcenter - mapper1);
  vertex(llmargin+(2*bigspan) - littlespan, lvcenter - mapper1);
  vertex(llmargin+(2*bigspan) - littlespan, lvcenter);
  endShape();
  
  mapper2 = map(PercentMaleBar, 0, 100, 0, plength/2);
  fill(#0503FF);   
  beginShape();
  vertex(llmargin+(2*bigspan) - littlespan, lvcenter);
  vertex(llmargin+(2*bigspan) - littlespan, lvcenter - mapper2);
  vertex(llmargin+(2*bigspan) - 60, lvcenter - mapper2);
  vertex(llmargin+(2*bigspan) - 60, lvcenter);
  endShape();

  //add inner lables
  fill(0,0,0);
  textSize(bodyTextSize);
  textAlign(CENTER, BOTTOM);
  text(sumSeriousFemale + " Injuries", llmargin+bigspan*2-(littlespan*1.25)-4, lvcenter );
  fill(255,255,255);
  text(sumSeriousMale + " Injuries", llmargin+bigspan*2-(.75*littlespan)+4, lvcenter );
  fill(126);

  fill(0,0,0);  
  textSize(bodyTextSize);
  text((float(round(((float(sumSeriousFemale)/float((sumSeriousFemale+sumSeriousMale)))*100)*100)))/100 + "% Females",
    llmargin+bigspan*2-(littlespan*1.25)-4, lvcenter-mapper1-2 );
  text((float(round(((float(sumSeriousMale)/float((sumSeriousFemale+sumSeriousMale)))*100)*100)))/100 + "% Males",
    llmargin+bigspan*2-(.75*littlespan)+4, lvcenter-mapper2-2 );


  //println(sumSeriousMale);
  //println(sumSeriousFemale);
  
  //Bar Section Three
  PercentFemaleBar = round(float(sumFatalFemale)/float(sumFatalMale+sumFatalFemale)*100);
  PercentMaleBar = round(float(sumFatalMale)/float(sumFatalMale+sumFatalFemale)*100);
  mapper1 = map(PercentFemaleBar, 0, 100, 0, plength/2);
  mapper2 = map(PercentMaleBar, 0, 100, 0, plength/2);
  //println("Mapper " + mapper1);
  fill(#FF9A03);
  beginShape();
  vertex(llmargin+60+bigspan*2, lvcenter);
  vertex(llmargin+60+bigspan*2, lvcenter - mapper1);
  vertex(llmargin+(3*bigspan) - littlespan, lvcenter - mapper1);
  vertex(llmargin+(3*bigspan) - littlespan, lvcenter);
  endShape();
  
  mapper2 = map(PercentMaleBar, 0, 100, 0, plength/2);
  fill(#0503FF);   
  beginShape();
  vertex(llmargin+(3*bigspan) - littlespan, lvcenter);
  vertex(llmargin+(3*bigspan) - littlespan, lvcenter - mapper2);
  vertex(llmargin+(3*bigspan) - 60, lvcenter - mapper2);
  vertex(llmargin+(3*bigspan) - 60, lvcenter);
  endShape();
  
  textSize(bodyTextSize);
  textAlign(CENTER, BOTTOM);
  fill(0,0,0);
  text(sumFatalFemale + " Injuries", llmargin+bigspan*3-(littlespan*1.25)-4, lvcenter );
  fill(255,255,255);
  text(sumFatalMale + " Injuries", llmargin+bigspan*3-(.75*littlespan)+4, lvcenter );
  fill(0,0,0);
  
  textSize(bodyTextSize);
  text(((float(sumFatalFemale)/float((sumFatalFemale+sumFatalMale)))*100) + "% Females",
    llmargin+bigspan*3-(littlespan*1.25)-4, lvcenter-mapper1-2 );
  text(((float(sumFatalMale)/float((sumFatalFemale+sumFatalMale)))*100) + "% Males",
    llmargin+bigspan*3-(.75*littlespan)+4, lvcenter-mapper2-2 );
  
  
  //Bar Section Four
  totalSlight = sumSlightMale + sumSlightFemale;
  mapper1 = map(totalSlight, 0, 2326, 0, plength/2);
  fill(255,210,210);
  rect(llmargin+60,lvcenter,bigspan-120, mapper1);
  fill(0,0,225);
  textSize(minorTitleTsize);
  textAlign(CENTER, CENTER);
  text(sumSlightMale+sumSlightFemale + " Injuries", llmargin+bigspan-littlespan, lvcenter + (lbmargin-lvcenter)/2 );
  fill(126);
  
  //Bar Section Five
  totalSerious = sumSeriousMale + sumSeriousFemale;
  mapper1 = map(totalSerious, 0, 2326, 0, plength/2);
  fill(255,160,160);
  rect(llmargin+bigspan+60,lvcenter,bigspan-120, mapper1);
  
  fill(0,0,225);
  textSize(minorTitleTsize);
  textAlign(CENTER, TOP);
  text(sumSeriousMale+sumSeriousFemale + " Injuries", llmargin+bigspan*2-littlespan, lvcenter+mapper1+5 );
  fill(126);
  
  //Bar Section Six
  totalFatal = sumFatalMale + sumFatalFemale;
  mapper1 = map(totalFatal, 0, 2326, 0, plength/2);
  fill(255,0,0);
  rect(llmargin+bigspan*2+60,lvcenter,bigspan-120, mapper1); 

  fill(0,0,225);
  textSize(minorTitleTsize);
  textAlign(CENTER, TOP);
  text(sumFatalMale+sumFatalFemale + " Fatalities", llmargin+bigspan*3-littlespan, lvcenter + mapper1+5 );
  fill(126);
  
  //Debugging Junk
  /*
  println("Male: Slight - " + sumSlightMale + ", Serious - " + sumSeriousMale + ", Fatal - " 
    + sumFatalMale + ", Total Male - " + totalMale + ".");
  println("Female: Slight - " + sumSlightFemale + ", Serious - " + sumSeriousFemale + ", Fatal - " 
    + sumFatalFemale + ", Total Female - " + totalFemale + ".");
  println("Grand Total - " + grandTotal + ".");
  println ("ll - " + llmargin + " ,lr - " + lrmargin); 
  println ("lt - " + ltmargin + " ,lb - " + lbmargin);
  */
}