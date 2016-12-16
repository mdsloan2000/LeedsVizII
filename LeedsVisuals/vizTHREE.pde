void vizTHREE() {
  // Load the screen image
  PImage leedsmap;
  
  
  //Screen Helpers
  
  int lrmargin = rmargin+lmargin;
  int llmargin = lmargin;
  int ltmargin = tmargin;
  int lbmargin = bmargin+tmargin;
  //int lhcenter = cxline;
  //int lvcenter = cyline;
  //float pwidth = lrmargin-llmargin;
  //float plength = lbmargin-ltmargin;
  
  int xFloor = 415316;// original 415316;
  int xCeiling = 445949;// original 445949;
  int yFloor = 423187; // original 423187;
  int yCeiling = 449040;// original 449040;
  float mapX;
  float mapY;
  
  
  //RetrievalFields
  String severity;
  int easting;
  int northing;
      
  // Set Display
  leedsmap = loadImage("Capture.PNG");
  image(leedsmap, llmargin, ltmargin, lrmargin-llmargin, lbmargin-ltmargin);
  
  setStatTitle("Distributing Severity Locations");
  
  //Get Row and Map Point
    for (int crow = 1 ; crow <  gvAccidentTable.getRowCount() ; crow++) {
      severity = gvAccidentTable.getString(crow, 11);
      easting = gvAccidentTable.getInt(crow, 1);
      northing = gvAccidentTable.getInt(crow, 2);
      
      mapX = map(easting, xFloor, xCeiling, llmargin, lrmargin);   
      mapY = map(northing, yFloor, yCeiling, ltmargin, lbmargin);
      
      if (severity.equals("Slight")) {
        drawMark(mapX, mapY, 2, false);
      } else {
        if (severity.equals("Serious")) {
          drawMark(mapX, mapY, 1, false);
        } else {
          if (severity.equals("Fatal")) {
            println("Fatal");
            drawMark(mapX, mapY, 0, true);
          }
        }
          
      
      
      //println("Sev - " + severity + ". Easting - " + easting + ". Northing - " + northing);
  
    }
  }
  
  
  
  
  // Plotting Logic
  // 
        
}

void drawMark(float x, float y, int lmode, boolean lemphasis) {
  float dclength = 5;

  switch(lmode) {
    case 0:
      //Cross - Mode Cross, emphasis TRUE/FALSE
      stroke(125);
      if (lemphasis == true) {
        stroke (255, 0, 0);
        strokeWeight(4);
        //println("TRUE");
      } else { 
        stroke (150, 0, 0);
        strokeWeight(1);
        //println("FALSE");
      }
      // Draw a line...
      line(x-dclength, y, x+dclength, y);
      line(x, y-dclength, x, y+dclength);
      //reset defaults
      stroke(125);
      strokeWeight(1);
      break;
    case 1:
      float leglength;
      float apothem;
      stroke(125);
      if (lemphasis == true) {
        strokeWeight(1);
        stroke (252,11,3);
        fill(252,11,3);
        //println("TRUE");
      } else { 
        strokeWeight(1);
        stroke (#FF904B);
        fill(255,255,255, 0);
        //println("FALSE");
      }
      leglength=sqrt(3)*dclength;
      apothem=sqrt(3)/6*leglength;
      beginShape();
      vertex(x, y-dclength);
      vertex(x+(leglength/2),y+apothem);
      vertex(x-(leglength/2),y+apothem);
      vertex(x, y-dclength);
      endShape();
      //reset defaults
      stroke(125);
      strokeWeight(1);
      break;
    case 2:
      if (lemphasis == true) {
        strokeWeight(1);
        stroke (0,0,255);
        fill(0,0,255);
        //println("TRUE");
      } else { 
        strokeWeight(1);
        stroke (#6584FA);
        fill(255,255,255, 0);
        //println("FALSE");
      }
      beginShape();
      vertex(x-dclength, y-dclength);
      vertex(x+dclength, y-dclength);
      vertex(x+dclength, y+dclength);
      vertex(x-dclength, y+dclength);
      vertex(x-dclength, y-dclength);
      endShape();
      //reset defaults
      stroke(125);
      strokeWeight(1);
      break;      
    default:
      break;
  }

//


}