boolean drawingside = false;
boolean drawingvert = false;
boolean drawingrandom = false;
boolean drawingdiag = false;

void setup() {
  size(1000, 1000);
}

void draw() {
  strokeWeight(1);
  //fill(0, 60, 100, (int)(Math.random()*61));
  fill(0, (int)(Math.random()*31));
  rect(0, 0, 1000, 1000);
  stroke(255);
  rect(0, 250, 250, 500);
  rect(750, 250, 250, 500);
  rect(250, 0, 500, 250);
  rect(250, 750, 500, 250);

  if (mousePressed){
    fill(100, 150, 200);
    ellipse(mouseX, mouseY, 50, 50);
  }
  
  stroke(255);
  
  if (drawingside){
    lightning();
    drawingside = false;
  } else if (drawingvert) {
    lightningvert();
    drawingvert = false;
  } else if (drawingrandom) {
    int picker = (int)(Math.random()*3);
    if (picker == 0)
      lightning();
    else if (picker == 1)
      lightningvert();
    //else
      //lightningdiag();
    drawingrandom = false;
  } else if (drawingdiag) {
    lightningdiag();
    drawingdiag = false;
  }
}

void lightning() {
  int x_coord = 0;
  int y_coord = (int)(Math.random()*(height)+1);
  int x_prev;
  int y_prev;
  
  stroke((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 200);
  
  while (x_coord < width) {
    x_prev = x_coord;
    y_prev = y_coord;
    
    x_coord += (int)(Math.random()*(1+width/75));
    if (Math.random() <= 0.5)
      y_coord -= (int)(Math.random()*(1+width/75));
    else
      y_coord += (int)(Math.random()*(1+width/75));
    
    strokeWeight((int)(Math.random()*5)+1);
    line(x_prev, y_prev, x_coord, y_coord);
  }
}
void lightningvert() {
  int x_coord = (int)(Math.random()*(width)+1);
  int y_coord = 0;
  int x_prev;
  int y_prev;
  
  stroke((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 200);
  
  while (y_coord < height) {
    x_prev = x_coord;
    y_prev = y_coord;
    
    y_coord += (int)(Math.random()*(1+width/75));
    if (Math.random() <= 0.5)
      x_coord -= (int)(Math.random()*(1+width/75));
    else
      x_coord += (int)(Math.random()*(1+width/75));
    
    strokeWeight((int)(Math.random()*5)+1);
    line(x_prev, y_prev, x_coord, y_coord);
  }
}
//split into 4
void lightningdiag() {
  int x_coord;
  int y_coord;
  int x_prev;
  int y_prev;
  int picker = (int)(Math.random()*4);
  
  stroke((int)(Math.random()*256), (int)(Math.random()*256), (int)(Math.random()*256), 200);
  
  if (picker == 0) {
    x_coord = 0;
    y_coord = 0;
    
    while (x_coord < width && y_coord < height){
      x_prev = x_coord;
      y_prev = y_coord;
      
      x_coord += (int)(Math.random()*(1+width/75));
      y_coord += (int)(Math.random()*(1+height/75));
      
      strokeWeight((int)(Math.random()*5)+1);
      line(x_prev, y_prev, x_coord, y_coord);
    }
  } else if (picker == 1) {
    x_coord = width;
    y_coord = 0;
    
    while (x_coord > 0 && y_coord < height){
      x_prev = x_coord;
      y_prev = y_coord;
      
      x_coord -= (int)(Math.random()*(1+width/75));
      y_coord += (int)(Math.random()*(1+height/75));
      
      strokeWeight((int)(Math.random()*5)+1);
      line(x_prev, y_prev, x_coord, y_coord);
    }
  } else if (picker == 2) {
    x_coord = 0;
    y_coord = height;
    while (x_coord < width && y_coord > 0){
      x_prev = x_coord;
      y_prev = y_coord;
      
      x_coord += (int)(Math.random()*(1+width/75));
      y_coord -= (int)(Math.random()*(1+height/75));
      
      strokeWeight((int)(Math.random()*5)+1);
      line(x_prev, y_prev, x_coord, y_coord);
    }
  } else {
    x_coord = width;
    y_coord = height;
    
    while (x_coord > 0 && y_coord > 0){
      x_prev = x_coord;
      y_prev = y_coord;
      
      x_coord -= (int)(Math.random()*(1+width/75));
      y_coord -= (int)(Math.random()*(1+height/75));
      
      strokeWeight((int)(Math.random()*5)+1);
      line(x_prev, y_prev, x_coord, y_coord);
    }
  }
}


void mouseDragged() {
  if ((mouseX <= 250 || mouseX >= 750) && (mouseY >= 250 && mouseY <= 750))
    drawingside = true;
  
  else if ((mouseY <= 250 || mouseY >= 750) && (mouseX >= 250 && mouseX <= 750))
    drawingvert = true;
  
  else if ((mouseX >= 250 && mouseX <= 750) && (mouseY >= 250 && mouseY <= 750))
    drawingrandom = true;
  
  else
    drawingdiag = true;
  
  redraw();
}
