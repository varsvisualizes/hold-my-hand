import processing.serial.*;

String[] headlines = {
  "thank you thank you thank you thank you thank you thank you thank you.", 
  "bless you bless you bless you bless you bless you bless you bless you.",
};

String[] secondLine = {
  "bless you bless you bless you bless you bless you bless you bless you.",
  "thank you thank you thank you thank you thank you thank you thank you.", 
};

Serial myPort;
static String val;
int sensor = 0;

PGraphics pg;
PFont font;

float m;
int index = 0;
int tSize = 36;


void setup() {
  
  myPort = new Serial(this, Serial.list()[1], 9600);
  
  size(500, 500, P2D);
  
  pg = createGraphics(800, 800, P2D);
  
  m = width;
  
}

void draw() {
  
  background(255, 212, 230);

  if(myPort.available() > 0) {
    val = myPort.readStringUntil('\n');
    try {
      sensor = Integer.valueOf(val.trim());
    }
    catch(Exception e) {
    ;
  }
  println(sensor);
  }
  
  if(sensor > 50) {
  
    for(int y = 0; y < height; y += (2*tSize)+10) {
      thanks(y);
    }
    for (int y = 40; y < height; y += (2*tSize)+10) {
      bless(100, y); 
    }
    
  }
  else {
    starter();
  }
  
}

void starter() {

  pg.beginDraw();
  pg.background(255, 212, 230);
  pg.fill(255);
  pg.textSize(150);
  pg.pushMatrix();
  pg.translate(width/2, height/2);
  pg.textAlign(CENTER, CENTER);
  pg.text("hello <3",0,0);
  pg.popMatrix();
  pg.endDraw();
  
  image(pg,0,0);
  
  int tilesX = 16;
  int tilesY = 16;
  
  int tileW = int(width/tilesX);
  int tileH = int(height/tilesY);
  
  for (int y = 0; y < tilesY; y++) {
    for (int x = 0; x < tilesX; x++) {
      
      int wave = int(sin(frameCount * 0.1 * (x)*0.05)*100);
    
      int sx = x*tileW;
      int sy = y*tileH + wave;
      int sw = tileW;
      int sh = tileH;
      
      int dx = x*tileW;
      int dy = y*tileH;
      int dw = tileW;
      int dh = tileH;
      
      copy(pg, sx, sy, sw, sh, dx, dy, dw, dh);
      
      
    }
  }
  
}

void thanks(int pos) {

  fill(255);

  // Display headline at x location
  textAlign (LEFT);
  textSize(tSize);

  // A specific String from the array is displayed according to the value of the "index" variable.
  text(headlines[index], m, pos); 

  // Decrement x
  m = m - 0.2;

  // If x is less than the negative width, then it is off the screen
  // textWidth() is used to calculate the width of the current String.
  float w = textWidth(headlines[index]); 
  if (m < -w) {
    m = width;
    // index is incremented when the current String has left the screen in order to display a new String.
    index = (index + 1) % headlines.length;
  }
  
}

void bless(int posX, int posY) {

  fill(255);

  // Display headline at x location
  textAlign (LEFT);
  textSize(tSize);

  // A specific String from the array is displayed according to the value of the "index" variable.
  text(secondLine[index], m+posX, posY); 

  // Decrement x
  m = m - 0.4;

  // If x is less than the negative width, then it is off the screen
  // textWidth() is used to calculate the width of the current String.
  float w = textWidth(secondLine[index]); 
  if (m < -w) {
    m = width;
    // index is incremented when the current String has left the screen in order to display a new String.
    index = (index + 1) % secondLine.length;
  }
  
}
