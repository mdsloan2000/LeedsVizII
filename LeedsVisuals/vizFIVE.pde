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
  
  // float PercentMaleBar;
  // float PercentFemaleBar;
  int totalSlight = 0;
  int totalSerious = 0;
  int totalFatal = 0;
  // float mapper1 = 0;
  // float mapper2 = 0;
  
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
  
  //Bar Section One - Slight Injuries
  
  for (int i = 0 ; i < 7; i++) {
    float lheight = 0;
    line(i*bigspan/7 + llmargin, lbmargin, i*bigspan/7 + llmargin, lbmargin - 10);
    switch(i) {
      case 1:
        //println(sumSlightDrySurface);
        lheight = map(sumSlightDrySurface, 0, 1750, 0, lbmargin - ltmargin);
        fill(200,200,100);
        beginShape();
        vertex(i*bigspan/7 + llmargin, lbmargin);
        vertex(i*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin);
        endShape();
        textAlign(CENTER,BOTTOM);
        textSize(bodyTextSize);
        fill(0);
        text(float(round(1000*(float(sumSlightDrySurface)/float(sumSlightDrySurface+sumSlightFloodedSurface+sumSlightIcySurface
          +sumSlightSnowSurface+sumSlightWetSurface))))/10 +"%",(bigspan/7/2)+(i*bigspan/7 + llmargin),lbmargin-lheight);
        break;
      case 2:
        lheight = map(sumSlightFloodedSurface, 0, 1750, 0, lbmargin - ltmargin);
        fill(#1602D1);
        beginShape();
        vertex(i*bigspan/7 + llmargin, lbmargin);
        vertex(i*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin);
        endShape();
        textAlign(CENTER,BOTTOM);
        textSize(bodyTextSize);
        fill(0);
        text(float(round(1000*(float(sumSlightFloodedSurface)/float(sumSlightDrySurface+sumSlightFloodedSurface+sumSlightIcySurface
          +sumSlightSnowSurface+sumSlightWetSurface))))/10 +"%",(bigspan/7/2)+(i*bigspan/7 + llmargin),lbmargin-lheight);
        break;
      case 3:
        lheight = map(sumSlightIcySurface, 0, 1750, 0, lbmargin - ltmargin);
        fill(#57DED6);
        beginShape();
        vertex(i*bigspan/7 + llmargin, lbmargin);
        vertex(i*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin);
        endShape();
        textAlign(CENTER,BOTTOM);
        textSize(bodyTextSize);
        fill(0);
        text(float(round(1000*(float(sumSlightIcySurface)/float(sumSlightDrySurface+sumSlightFloodedSurface+sumSlightIcySurface
          +sumSlightSnowSurface+sumSlightWetSurface))))/10 +"%",(bigspan/7/2)+(i*bigspan/7 + llmargin),lbmargin-lheight);
        break;
      case 4:
        lheight = map(sumSlightSnowSurface, 0, 1750, 0, lbmargin - ltmargin);
        fill(#FBFF1F);
        beginShape();
        vertex(i*bigspan/7 + llmargin, lbmargin);
        vertex(i*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin);
        endShape();
        textAlign(CENTER,BOTTOM);
        textSize(bodyTextSize);
        fill(0);
        text(float(round(1000*(float(sumSlightSnowSurface)/float(sumSlightDrySurface+sumSlightFloodedSurface+sumSlightIcySurface
          +sumSlightSnowSurface+sumSlightWetSurface))))/10 +"%",(bigspan/7/2)+(i*bigspan/7 + llmargin),lbmargin-lheight);
        break;
      case 5:
        lheight = map(sumSlightWetSurface, 0, 1750, 0, lbmargin - ltmargin);
        fill(#74AAFF);
        beginShape();
        vertex(i*bigspan/7 + llmargin, lbmargin);
        vertex(i*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin, lbmargin);
        endShape();        textAlign(CENTER,BOTTOM);
        textSize(bodyTextSize);
        fill(0);
        text(float(round(1000*(float(sumSlightWetSurface)/float(sumSlightDrySurface+sumSlightFloodedSurface+sumSlightIcySurface
          +sumSlightSnowSurface+sumSlightWetSurface))))/10 +"%",(bigspan/7/2)+(i*bigspan/7 + llmargin),lbmargin-lheight);
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
        fill(200,200,100);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin);
        vertex(i*bigspan/7 + llmargin+ bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin);
        endShape();
        textSize(bodyTextSize);
        fill(0);
        text(float(round(1000*(float(sumSeriousDrySurface)/float(sumSeriousDrySurface+sumSeriousFloodedSurface+sumSeriousIcySurface
          +sumSeriousSnowSurface+sumSeriousWetSurface))))/10 +"%",bigspan+(bigspan/7/2)+(i*bigspan/7 + llmargin),lbmargin-lheight);
        break;
       case 2:
        lheight = map(sumSeriousFloodedSurface, 0, 500, 0, lbmargin - ltmargin);
        fill(#1602D1);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin);
        endShape();
        textSize(bodyTextSize);
        fill(0);
        text(float(round(1000*(float(sumSeriousFloodedSurface)/float(sumSeriousDrySurface+sumSeriousFloodedSurface+sumSeriousIcySurface
          +sumSeriousSnowSurface+sumSeriousWetSurface))))/10 +"%",bigspan+(bigspan/7/2)+(i*bigspan/7 + llmargin),lbmargin-lheight);
        break;
      case 3:
        lheight = map(sumSeriousIcySurface, 0, 500, 0, lbmargin - ltmargin);
        fill(#57DED6);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin);
        endShape();
        textSize(bodyTextSize);
        fill(0);
        text(float(round(1000*(float(sumSeriousIcySurface)/float(sumSeriousDrySurface+sumSeriousFloodedSurface+sumSeriousIcySurface
          +sumSeriousSnowSurface+sumSeriousWetSurface))))/10 +"%",bigspan+(bigspan/7/2)+(i*bigspan/7 + llmargin),lbmargin-lheight);
        break;
      case 4:
        lheight = map(sumSeriousSnowSurface, 0, 500, 0, lbmargin - ltmargin);
        fill(#FBFF1F);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin);
        endShape();
        textSize(bodyTextSize);
        fill(0);
        text(float(round(1000*(float(sumSeriousSnowSurface)/float(sumSeriousDrySurface+sumSeriousFloodedSurface+sumSeriousIcySurface
          +sumSeriousSnowSurface+sumSeriousWetSurface))))/10 +"%",bigspan+(bigspan/7/2)+(i*bigspan/7 + llmargin),lbmargin-lheight);
        break;
      case 5:
        lheight = map(sumSeriousWetSurface, 0, 500, 0, lbmargin - ltmargin);
        fill(#74AAFF);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan, lbmargin);
        endShape();
        textSize(bodyTextSize);
        fill(0);
        text(float(round(1000*(float(sumSeriousWetSurface)/float(sumSeriousDrySurface+sumSeriousFloodedSurface+sumSeriousIcySurface
          +sumSeriousSnowSurface+sumSeriousWetSurface))))/10 +"%",bigspan+(bigspan/7/2)+(i*bigspan/7 + llmargin),lbmargin-lheight);
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
        //println(sumFatalDrySurface);
        //println(lheight);
        fill(200,200,100);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin);
        vertex(i*bigspan/7 + llmargin+ bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin);
        endShape();
        textSize(bodyTextSize);
        fill(0);
        text(float(round(1000*(float(sumFatalDrySurface)/float(sumFatalDrySurface+sumFatalFloodedSurface+sumFatalIcySurface
          +sumFatalSnowSurface+sumFatalWetSurface))))/10 +"%",2*bigspan+(bigspan/7/2)+(i*bigspan/7 + llmargin),lbmargin-lheight);
        break;
      case 2:
        lheight = map(sumFatalFloodedSurface, 0, 50, 0, lbmargin - ltmargin);
        fill(#1602D1);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin);
        endShape();
        textSize(bodyTextSize);
        fill(0);
        text(float(round(1000*(float(sumFatalFloodedSurface)/float(sumFatalDrySurface+sumFatalFloodedSurface+sumFatalIcySurface
          +sumFatalSnowSurface+sumFatalWetSurface))))/10 +"%",2*bigspan+(bigspan/7/2)+(i*bigspan/7 + llmargin),lbmargin-lheight);
        break;
      case 3:
        lheight = map(sumFatalIcySurface, 0, 50, 0, lbmargin - ltmargin);
        fill(#57DED6);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin);
        endShape();
        textSize(bodyTextSize);
        fill(0);
        text(float(round(1000*(float(sumFatalIcySurface)/float(sumFatalDrySurface+sumFatalFloodedSurface+sumFatalIcySurface
          +sumFatalSnowSurface+sumFatalWetSurface))))/10 +"%",2*bigspan+(bigspan/7/2)+(i*bigspan/7 + llmargin),lbmargin-lheight);
        break;
      case 4:
        lheight = map(sumFatalSnowSurface, 0, 50, 0, lbmargin - ltmargin);
        fill(#FBFF1F);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin);
        endShape();
        textSize(bodyTextSize);
        fill(0);
        text(float(round(1000*(float(sumFatalSnowSurface)/float(sumFatalDrySurface+sumFatalFloodedSurface+sumFatalIcySurface
          +sumFatalSnowSurface+sumFatalWetSurface))))/10 +"%",2*bigspan+(bigspan/7/2)+(i*bigspan/7 + llmargin),lbmargin-lheight);
        break;
      case 5:
        lheight = map(sumFatalWetSurface, 0, 50, 0, lbmargin - ltmargin);
        fill(#74AAFF);
        beginShape();
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin);
        vertex(i*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin-lheight);
        vertex((i+1)*bigspan/7 + llmargin + bigspan*2, lbmargin);
        endShape();
        textSize(bodyTextSize);
        fill(0);
        text(float(round(1000*(float(sumFatalWetSurface)/float(sumFatalDrySurface+sumFatalFloodedSurface+sumFatalIcySurface
          +sumFatalSnowSurface+sumFatalWetSurface))))/10 +"%",2*bigspan+(bigspan/7/2)+(i*bigspan/7 + llmargin),lbmargin-lheight);
        break;
      default:
        break;
    }
  }
  // Add Labels
  fill(0);
  textSize(statTitleTsize);
  textAlign(CENTER,TOP);
  text("Slight Injuries",llmargin+bigspan-littlespan ,lbmargin+5);
  text("Serious Injuries",llmargin+bigspan*2-littlespan ,lbmargin+5);
  text("Fatalities",llmargin+bigspan*3-littlespan ,lbmargin+5);
  draw5Legend();
}

void draw5Legend() {
  
  int llmargin = lmargin+528;
  int lrmargin = llmargin+350;
  int ltmargin = tmargin+20;
  int lbmargin = ltmargin+(minorTitleTsize)*2+5+75+25+5;
  int cx = (lrmargin+llmargin)/2;
  int lpad = 5;
  
  fill(255,255,255);
  stroke(0);
  beginShape();
  vertex(llmargin,ltmargin);
  vertex(lrmargin,ltmargin);
  vertex(lrmargin,lbmargin);
  vertex(llmargin,lbmargin);
  endShape(CLOSE);
  
  fill(0,0,255);
  textSize(minorTitleTsize);
  textAlign(CENTER,TOP);
  text("Road Surface Conditions", cx, ltmargin+lpad);
  textAlign(LEFT,CENTER);
  textSize(minorTitleTsize-2);
  fill(200,200,100);
  rect(llmargin+10, ltmargin+minorTitleTsize+lpad+15+5,15,15);
  fill(0);
  text("- Dry Road Conditions", llmargin+30, ltmargin+minorTitleTsize+lpad+15+5+5);
  fill(#1602D1);
  rect(llmargin+10, ltmargin+minorTitleTsize+lpad+30+10,15,15);
  fill(0);
  text("- Flooded Road Conditions", llmargin+30, ltmargin+minorTitleTsize*2+lpad+15+5+7);
  fill(#57DED6);
  rect(llmargin+10, ltmargin+minorTitleTsize+lpad+45+15,15,15);
  fill(0);
  text("- Icy Road Conditions", llmargin+30, ltmargin+minorTitleTsize*3+lpad+15+5+9);
  fill(#FBFF1F);
  fill(0);
  text("- Snowy Road Conditions", llmargin+30, ltmargin+minorTitleTsize*4+lpad+15+5+11);
  rect(llmargin+10, ltmargin+minorTitleTsize+lpad+60+20,15,15);
  fill(#74AAFF);
  rect(llmargin+10, ltmargin+minorTitleTsize+lpad+75+25,15,15);
  fill(0);
  text("- Wet Road Conditions", llmargin+30, ltmargin+minorTitleTsize*5+lpad+15+5+13);
  
  
  
  /*
  textAlign(LEFT,CENTER);
  drawMark(llmargin+15, ltmargin+lpad+bodyTextSize+7, 0, true);
  fill(0);
  text("Fatal Accidents",llmargin+40, ltmargin+lpad+bodyTextSize+4);
  drawMark(llmargin+15, ltmargin+lpad+(bodyTextSize)*2+10, 1, false);
  fill(0);
  text("Serious Accidents",llmargin+40, ltmargin+lpad+(bodyTextSize*2)+6);
  drawMark(llmargin+15, ltmargin+lpad+(bodyTextSize)*3+10, 2, false);
  fill(0);
  text("Slight Accidents",llmargin+40, ltmargin+lpad+(bodyTextSize*3)+8);
  */
  
  //println(llmargin + " " + cx + " " + lrmargin);
  
}