void vizFIVE() {
  
  int sumSlightDrySurface = 0;
  int sumSeriousDrySurface = 0;
  int sumFatalDrySurface = 0;
  int sumSlightFloodedSurface = 0;
  int sumSeriousFloodedSurface = 0;
  int sumFatalFloodedSurface = 0;
  int sumSlightIcySurface = 0;
  int sumSeriousIcySurface = 0;
  int sumFatalIcySurface = 0;
  int sumSlightSnowSurface = 0;
  int sumSeriousSnowSurface = 0;
  int sumFatalSnowSurface = 0;
  int sumSlightWetSurface = 0;
  int sumSeriousWetSurface = 0;
  int sumFatalWetSurface = 0;
  
  int totalDry = 0;
  int totalFlooded = 0;
  int totalIcy = 0;
  int totalSnow = 0;
  int totalWet = 0;
  
  String[] baseString = new String[3];
  baseString[0] = "Slight";
  baseString[1] = "Serious";
  baseString[2] = "Fatal";
  String rowString;
  String[] baseSurface = new String[5];
  baseSurface[0] = "Dry";
  baseSurface[1] = "Flood (surface water over 3cm deep)";
  baseSurface[2] = "Frost / Ice";
  baseSurface[3] = "Snow";
  baseSurface[4] = "Wet / Damp";
  String weatherString;
  
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
    weatherString = gvAccidentTable.getString(crow, 7);
    //println("Row " + crow + ": " + gvAccidentTable.getString(crow, 11));
    //println("Row " + crow + ": " + gvAccidentTable.getString(crow, 7));
    if (rowString.equals(baseString[0])) {          //Slight Injuries
      if (weatherString.equals(baseSurface[0])) {
        sumSlightDrySurface++; 
      }
      if (weatherString.equals(baseSurface[1])) {
        sumSlightFloodedSurface++; 
      }
      if (weatherString.equals(baseSurface[2])) {
        sumSlightIcySurface++; 
      }
      if (weatherString.equals(baseSurface[3])) {
        sumSlightSnowSurface++; 
      }
      if (weatherString.equals(baseSurface[4])) {
        sumSlightWetSurface++; 
      }
    } else {
      if (rowString.equals(baseString[1])) {        //Serious Injuries
        if (weatherString.equals(baseSurface[0])) {
          sumSeriousDrySurface++; 
        }
        if (weatherString.equals(baseSurface[1])) {
          sumSeriousFloodedSurface++; 
        }
        if (weatherString.equals(baseSurface[2])) {
          sumSeriousIcySurface++; 
        }
        if (weatherString.equals(baseSurface[3])) {
          sumSeriousSnowSurface++; 
        }
        if (weatherString.equals(baseSurface[4])) {
          sumSeriousWetSurface++; 
        }      
      } else {
        if (rowString.equals(baseString[2])) {      //Fatal Injuries
          if (weatherString.equals(baseSurface[0])) {
          sumFatalDrySurface++; 
          }
          if (weatherString.equals(baseSurface[1])) {
            sumFatalFloodedSurface++; 
          }
          if (weatherString.equals(baseSurface[2])) {
            sumFatalIcySurface++; 
          }
          if (weatherString.equals(baseSurface[3])) {
            sumFatalSnowSurface++; 
          }
          if (weatherString.equals(baseSurface[4])) {
            sumFatalWetSurface++; 
          }
        }
      }
    }
  }

  
  //Totaling Logic
  totalDry = sumSlightDrySurface+sumSeriousDrySurface+sumFatalDrySurface;
  totalFlooded = sumSlightFloodedSurface+sumSeriousFloodedSurface+sumFatalFloodedSurface;
  totalIcy = sumSlightIcySurface+sumSeriousIcySurface+sumFatalIcySurface;
  totalSnow = sumSlightSnowSurface+sumSeriousSnowSurface+sumFatalSnowSurface;
  totalWet = sumSlightWetSurface+sumSeriousWetSurface+sumFatalWetSurface;
  
  
  

  
  
  //Display Logic
  
  //Draw Major Lines5
  bigspan = pwidth/numBigFeatures;
  littlespan = pwidth/numLittleFeatures;
  
  for (int i = 0 ; i <= numBigFeatures; i++) {
      stroke(126); 
      line(llmargin+(i*bigspan), ltmargin, llmargin+(i*bigspan),lbmargin);
      //stroke(200);
      //line(llmargin+(i*bigspan) - littlespan, ltmargin, llmargin+(i*bigspan) - littlespan, lbmargin);  
  }

  
  
  // Finish the panel frame.
  line(llmargin, ltmargin,lrmargin, ltmargin);
  line(llmargin, lbmargin,lrmargin, lbmargin);
 
  setStatTitle("Road Conditions and Accidents Severity");
  
  //Bar Section One
  
  for (int i = 0 ; i < 7; i++) {
    float lheight = 0;
    line(i*bigspan/7 + llmargin, lbmargin, i*bigspan/7 + llmargin, lbmargin - 10);
    switch(i) {
      case 1:
        //println(sumSlightDrySurface);
        lheight = map(sumSlightDrySurface, 0, 1750, 0, lbmargin - ltmargin);
        fill(100,0,0);
        beginShape();
        vertex(i*bigspan/7 + llmargin, lbmargin);
        vertex(i*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin);
        endShape();
        break;
      case 2:
        lheight = map(sumSlightFloodedSurface, 0, 1750, 0, lbmargin - ltmargin);
        fill(100,100,0);
        beginShape();
        vertex(i*bigspan/7 + llmargin, lbmargin);
        vertex(i*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin);
        endShape();
        break;
      case 3:
        lheight = map(sumSlightIcySurface, 0, 1750, 0, lbmargin - ltmargin);
        fill(100,100,100);
        beginShape();
        vertex(i*bigspan/7 + llmargin, lbmargin);
        vertex(i*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin);
        endShape();
        break;
      case 4:
        lheight = map(sumSlightSnowSurface, 0, 1750, 0, lbmargin - ltmargin);
        fill(200,100,100);
        beginShape();
        vertex(i*bigspan/7 + llmargin, lbmargin);
        vertex(i*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin);
        endShape();
        break;
      case 5:
        lheight = map(sumSlightWetSurface, 0, 1750, 0, lbmargin - ltmargin);
        fill(200,200,100);
        beginShape();
        vertex(i*bigspan/7 + llmargin, lbmargin);
        vertex(i*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin);
        endShape();
        break;
      default:
        break;
    }
  }

   for (int i = 0 ; i < 7; i++) {
    float lheight = 0;
    line(i*bigspan/7 + llmargin + bigspan, lbmargin, i*bigspan/7 + llmargin + bigspan, lbmargin - 10);
    switch(i) {
      case 1:
        //println(sumSeriousDrySurface);
        lheight = map(sumSeriousDrySurface, 0, 500, 0, lbmargin - ltmargin);
        fill(100,0,0);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin);
        vertex(i*bigspan/7 + llmargin+ bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin);
        endShape();
        break;
      case 2:
        lheight = map(sumSeriousFloodedSurface, 0, 500, 0, lbmargin - ltmargin);
        fill(100,100,0);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin);
        endShape();
        break;
      case 3:
        lheight = map(sumSeriousIcySurface, 0, 500, 0, lbmargin - ltmargin);
        fill(100,100,100);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin);
        endShape();
        break;
      case 4:
        lheight = map(sumSeriousSnowSurface, 0, 500, 0, lbmargin - ltmargin);
        fill(200,100,100);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin);
        endShape();
        break;
      case 5:
        lheight = map(sumSeriousWetSurface, 0, 500, 0, lbmargin - ltmargin);
        fill(200,200,100);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin);
        endShape();
        break;
      default:
        break;
    }
  }
  
  for (int i = 0 ; i < 7; i++) {
    float lheight = 0;
    line(i*bigspan/7 + llmargin + bigspan*2, lbmargin, i*bigspan/7 + llmargin + bigspan*2, lbmargin - 10);
    switch(i) {
      case 1:
        //println(sumFatalDrySurface);
        lheight = map(sumFatalDrySurface, 0, 50, 0, lbmargin - ltmargin);
        println(sumFatalDrySurface);
        println(lheight);
        fill(100,0,0);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin);
        vertex(i*bigspan/7 + llmargin+ bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin);
        endShape();
        break;
      case 2:
        lheight = map(sumFatalFloodedSurface, 0, 50, 0, lbmargin - ltmargin);
        fill(100,100,0);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin);
        endShape();
        break;
      case 3:
        lheight = map(sumFatalIcySurface, 0, 50, 0, lbmargin - ltmargin);
        fill(100,100,100);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin);
        endShape();
        break;
      case 4:
        lheight = map(sumFatalSnowSurface, 0, 50, 0, lbmargin - ltmargin);
        fill(200,100,100);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin);
        endShape();
        break;
      case 5:
        lheight = map(sumFatalWetSurface, 0, 50, 0, lbmargin - ltmargin);
        fill(200,200,100);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin);
        endShape();
        break;
      default:
        break;
    }
  }
  
  /*  
  PercentFemaleBar = round(float(sumSlightFemale)/float(sumSlightMale+sumSlightFemale)*100);
  PercentMaleBar = round(float(sumSlightMale)/float(sumSlightMale+sumSlightFemale)*100);
  mapper1 = map(PercentFemaleBar, 0, 100, 0, plength/2);
  println("Mapper " + mapper1);
  fill(0,0,125);
  beginShape();
  vertex(llmargin+60, lvcenter);
  vertex(llmargin+60, lvcenter - mapper1);
  vertex(llmargin+(1*bigspan) - littlespan, lvcenter - mapper1);
  vertex(llmargin+(1*bigspan) - littlespan, lvcenter);
  endShape();
  
  mapper2 = map(PercentMaleBar, 0, 100, 0, plength/2);
  fill(0,125,0);   
  beginShape();
  vertex(llmargin+(1*bigspan) - littlespan, lvcenter);
  vertex(llmargin+(1*bigspan) - littlespan, lvcenter - mapper2);
  vertex(llmargin+(1*bigspan) - 60, lvcenter - mapper2);
  vertex(llmargin+(1*bigspan) - 60, lvcenter);
  endShape();

  
  //println(sumSlightMale);
  //println(sumSlightFemale);

  //Section One - Rect One
  //Sect One - Rect two
  
  
  //Bar Section Two
  PercentFemaleBar = round(float(sumSeriousFemale)/float(sumSeriousMale+sumSeriousFemale)*100);
  PercentMaleBar = round(float(sumSeriousMale)/float(sumSeriousMale+sumSeriousFemale)*100);
  mapper1 = map(PercentFemaleBar, 0, 100, 0, plength/2);
  mapper2 = map(PercentMaleBar, 0, 100, 0, plength/2);
  println("Mapper " + mapper1);
  fill(0,0,125);
  beginShape();
  vertex(llmargin+60+bigspan, lvcenter);
  vertex(llmargin+60+bigspan, lvcenter - mapper1);
  vertex(llmargin+(2*bigspan) - littlespan, lvcenter - mapper1);
  vertex(llmargin+(2*bigspan) - littlespan, lvcenter);
  endShape();
  
  mapper2 = map(PercentMaleBar, 0, 100, 0, plength/2);
  fill(0,125,0);   
  beginShape();
  vertex(llmargin+(2*bigspan) - littlespan, lvcenter);
  vertex(llmargin+(2*bigspan) - littlespan, lvcenter - mapper2);
  vertex(llmargin+(2*bigspan) - 60, lvcenter - mapper2);
  vertex(llmargin+(2*bigspan) - 60, lvcenter);
  endShape();

  //println(sumSeriousMale);
  //println(sumSeriousFemale);
  
  //Bar Section Three
  PercentFemaleBar = round(float(sumFatalFemale)/float(sumFatalMale+sumFatalFemale)*100);
  PercentMaleBar = round(float(sumFatalMale)/float(sumFatalMale+sumFatalFemale)*100);
  mapper1 = map(PercentFemaleBar, 0, 100, 0, plength/2);
  mapper2 = map(PercentMaleBar, 0, 100, 0, plength/2);
  println("Mapper " + mapper1);
  fill(0,0,125);
  beginShape();
  vertex(llmargin+60+bigspan*2, lvcenter);
  vertex(llmargin+60+bigspan*2, lvcenter - mapper1);
  vertex(llmargin+(3*bigspan) - littlespan, lvcenter - mapper1);
  vertex(llmargin+(3*bigspan) - littlespan, lvcenter);
  endShape();
  
  mapper2 = map(PercentMaleBar, 0, 100, 0, plength/2);
  fill(0,125,0);   
  beginShape();
  vertex(llmargin+(3*bigspan) - littlespan, lvcenter);
  vertex(llmargin+(3*bigspan) - littlespan, lvcenter - mapper2);
  vertex(llmargin+(3*bigspan) - 60, lvcenter - mapper2);
  vertex(llmargin+(3*bigspan) - 60, lvcenter);
  endShape();
  
  //Bar Section Four
  totalSlight = sumSlightMale + sumSlightFemale;
  mapper1 = map(totalSlight, 0, 2326, 0, plength/2);
  fill(255,210,210);
  rect(llmargin+60,lvcenter,bigspan-120, mapper1); 
  
  //Bar Section Five
  totalSerious = sumSeriousMale + sumSeriousFemale;
  mapper1 = map(totalSerious, 0, 2326, 0, plength/2);
  fill(255,160,160);
  rect(llmargin+bigspan+60,lvcenter,bigspan-120, mapper1); 
  
  //Bar Section Six
  totalFatal = sumFatalMale + sumFatalFemale;
  mapper1 = map(totalFatal, 0, 2326, 0, plength/2);
  fill(255,0,0);
  rect(llmargin+bigspan*2+60,lvcenter,bigspan-120, mapper1); 
  
  
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