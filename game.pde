
  StopWatchTimer sw;
  var roadScroller;
  var sideScroller;
  PImage c;
  PImage k;
 PImage t1;
  PImage t2;
  PImage t3;
   PImage t4;
  PImage t5;
  PImage t6;
   PImage t7;
    PImage t8;
     PImage t9;
     PImage es;
    PImage r;
  PImage rd;
  //controler car
  var controllerX;
  var controllerY;
  //obstacle car
  var obstacleX;
  var obstacleY;
  //text bubble
  var lives;
  
  void setup(){
  sw = new StopWatchTimer();
  sw.start();
   //canvas set up
   size(800,600);
   background(0,0,0);
   // dashes and sidewalk called
   roadScroller = new Road();
   sideScroller = new Side();
   //controler called 
   controllerX = 320;
   controllerY = 375;
   obstacleX = 100;
   obstacleY = 0;
   lives = 3;
   //car images
   c = loadImage("FinalProject/ControlerCar.png");
   k = loadImage("FinalProject/obstacle.png");
   randLanes = [80, 250, 400];    
  //text bubble
 t1 = loadImage("FinalProject/tb1.png");
 t2 = loadImage("FinalProject/tb2.png");
 t3 = loadImage("FinalProject/tb3.png");
 t4 = loadImage("FinalProject/tb4.png");
 t5 = loadImage("FinalProject/tb5.png");
 t6 = loadImage("FinalProject/tb6.png");
 t7 = loadImage("FinalProject/tb7.png");
 t8 = loadImage("FinalProject/tb8.png");
 t9 = loadImage("FinalProject/tb9.png");
 es = loadImage("FinalProject/gameover.png");
  r = loadImage("FinalProject/replay.png");
 rd = loadImage("FinalProject/replaydown.png");
  
  }
  void draw(){ 
   background(0,0,0);
   roadScroller.drawDashes();
   roadScroller.moveDashes();
   sideScroller.drawSideWalks();
   sideScroller.moveSideWalks();
   fill(64,64,64);
   rect(0,0,3,600);
   rect(797, 0, 3, 600);
   rect(150, 0, 3, 600);
   rect(650, 0, 3, 600);
   image(k, obstacleX, obstacleY, 360, 250);
   image(c, controllerX, controllerY, 175, 250);
   fill(77, 77, 255);
   stroke();
   strokeStyle = '##FFFFFF';
   rect(490, 10, 300, 50);
   fill(77, 77, 255);
   stroke();
   strokeStyle = '##FFFFFF';
   rect(75, 10, 100, 50);
   numlives();
   time();



   if (roadScroller.getDashes() > 50 && roadScroller.getDashes() < 80) {
     image(t1, 100, 100, 600, 300);
   } 
   
   if (keyPressed == true){
 if (key == CODED) {
  if (keyCode == RIGHT){
   if (controllerX < 530) controllerX += 3;
  }
  else if (keyCode == LEFT){
   if (controllerX > 100) controllerX -= 3;
  }
 }
  }
  if ((obstacleY > controllerY-110 && obstacleY < controllerY+110) && (obstacleX > controllerX-110 && obstacleX < controllerX + 110) && lives>0){
    randomPosition = Math.round(Math.random() * 2);
    obstacleX = randLanes[randomPosition];
 obstacleY = -100;
 lives--;
}
  else if (lives < 1)
  {
 size(800, 600);
 image(es, 0, 0, 800, 600);
 alert("GAME OVER!");
 image(r, 325, 390, 150, 75);
 document.location.reload;
  }
 if (obstacleY > 700){
    randomPosition = Math.round(Math.random() * 2);
    obstacleX = randLanes[randomPosition];
    obstacleY = -100;
}
  obstacleY += 4;
  }

   void numlives() {
  fill(#FFFFFF);
  textAlign(CENTER);
  text("LIVES", 125, 30);
  text(lives, 125, 45);
}

  void time() {
  fill(#FFFFFF);
  textAlign(CENTER);
  // textFont(words, 50);
  text(second(), 740, 40);
  fill(#FFFFFF);
  text("TIMER", 635, 25);
  text(":", 690, 43);
  text(minute(), 640, 43);
  text(":", 590, 43);
  text(hour(), 540, 43);
}


class StopWatchTimer {
  int startTime = 0, stopTime = 0;
  boolean running = false; 
  void start() {
    startTime = millis();
    running = true;
  }
  void stop() {
    stopTime = millis();
    running = false;
  }
  int getElapsedTime() {
    int elapsed;
    if (running) {
      elapsed = (millis() - startTime);
    }
    else {
      elapsed = (stopTime - startTime);
    }
    return elapsed;
  }
  int second() {
    return (getElapsedTime() / 1000) % 60;
  }
  int minute() {
    return (getElapsedTime() / (1000*60)) % 60;
  }
  int hour() {
    return (getElapsedTime() / (1000*60*60)) % 24;
  }
}
  
  class Dash {
   var yPosition;
   Dash(y){
    yPosition = y;
   }
   void drawDash(){
    noStroke();
    fill(255,215,0);
    rect(300,yPosition, 5, 15);
 rect(500,yPosition, 5, 15);
   }
   void move(speed){
    yPosition += speed;
   }
  }
  class Road {
   var scrollEndY = 600;
   var dashes = new Array();
   Road(){
    currentHeight = 0;
    while(currentHeight < 600){
     dashes.push(new Dash(currentHeight));
     currentHeight += 20;
    }
    scrollEndY = 600 - currentHeight;
   }
   void drawDashes(){
    for(var i = 0; i < dashes.length; i++){
     dashes[i].drawDash();
    }
   }
   void moveDashes(){
    for(var i = 0; i < dashes.length; i++){
     dashes[i].move(2);
    }
    scrollEndY += 2;
    if(scrollEndY > 5){
     addDash(scrollEndY - 22);
    }
   }
   void addDash(yLocation){
    dashes.push(new Dash(yLocation));
    scrollEndY -= 20;
   }

   void getDashes() {
    return dashes.length;
   }
  }
    class SideWalk {
   var yPos;
   SideWalk(yy){
    yPos = yy;
   }
   void drawSideWalk(){
    noStroke();
    fill(220,220,220);
    rect(0,yPos, 150, 150);
 rect(650,yPos, 150, 150);
   }
   void move(s){
    yPos += s;
   }
  }
  class Side {
   var scrollEndYY = 600;
   var SideWalks = new Array();
   Side(){
   currentHeights = 0;
    while(currentHeights < 600){
     SideWalks.push(new SideWalk(currentHeights));
     currentHeights += 155;
    }
    scrollEndYY = 1000 - currentHeights;
   }
   void drawSideWalks(){
    for(var i = 0; i < SideWalks.length; i++){
     SideWalks[i].drawSideWalk();
    }
   }
   void moveSideWalks(){
    for(var i = 0; i < SideWalks.length; i++){
     SideWalks[i].move(2);
    }
    scrollEndYY += 2;
    if(scrollEndYY > 5){
     addSideWalk(scrollEndYY - 200);
    }
   }
   void addSideWalk(yLoc){
    SideWalks.push(new SideWalk(yLoc));
    scrollEndYY -= 151;
   }
  }

  class Bubble {
    var index;
    var bubbles = new Array();

    Bubble() {


      bubbles[0] = "t1.png";
      bubbles[1] = "t2.png";
      bubbles[2] = "t3.png";
      bubbles[3] = "t4.png";
      bubbles[4] = "t5.png";
      bubbles[5] = "t6.png";
      bubbles[6] = "t7.png";
      bubbles[7] = "t8.png";
      bubbles[8] = "t9.png";
    }

    void drawBubble(index) {
      if (index===0) {

      }
    }
  }
  