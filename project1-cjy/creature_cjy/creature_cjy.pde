PVector position, target;
boolean isRunning = false;
PImage FEPP, fire, screw1, screw2;

void setup() { 
  size(1000, 800, P2D);
  
  position = new PVector(width/2, height/2);
  target = new PVector(random(width), random(height));  
  
  
  FEPP = loadImage("FEPP.JPG");
  FEPP.resize(FEPP.width/6, FEPP.height/6);
  fire = loadImage("fire.png");
  fire.resize(fire.width, fire.height);
  screw1 = loadImage("screw1.png");
  screw1.resize(screw1.width, screw1.height);
  screw2 = loadImage("screw2.png");
  screw2.resize(screw2.width, screw2.height);
  imageMode(CENTER);
}

void draw() {
  background(144, 180, 234);
  image(screw1,30,30,150,150);
  image(screw2,900,500,200,200);
  image(fire, 50,550,150,150);
  
  PVector mousePos = new PVector(mouseX, mouseY);
  isRunning = position.dist(mousePos) < 100;
  
  if (isRunning) {
    position = position.lerp(target, 0.09);
    if (position.dist(target) < 5) {
      target = new PVector(random(width), random(height));
    }
  }
  
  image(FEPP, position.x, position.y);
}
