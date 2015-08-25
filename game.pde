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
  PImage playButton;
  PImage instructionsPage;
  PImage ss;

  //controler car
  var controllerX;
  var controllerY;
  //obstacle car
  var obstacleX;
  var obstacleY;
  //text bubble
  var lives;
 
  var textX = 100;
  var textX2 = 100;
  var textX3 = 100;
  var textX4 = 100;
  var textX5 = 100;
  var textX6 = 100;
  var textX7 = 100;
  var textX8 = 100;
  var textX9 = 100;
  var textY = 100;

  var textNumber = 1;
  
  var keysTyped1 = 0;
var keysTyped2 = 0;
var keysTyped3 = 0;
var keysTyped4 = 0;
var keysTyped5 = 0;
var keysTyped6 = 0;
var keysTyped7 = 0;
var keysTyped8 = 0;
var keysTyped9 = 0;

  var HofS=0,s=0,m=0,h=0,Go=true;
  
  var gameStarted = 0;
  
  void setup(){
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
   c = loadImage("ControlerCar.png");
   k = loadImage("obstacle.png");
   randLanes = [80, 250, 400];    
  //text bubble
 t1 = loadImage("tbf1.png");
 t2 = loadImage("tbf2.png");
 t3 = loadImage("tbf3.png");
 t4 = loadImage("tbf4.png");
 t5 = loadImage("tbf5.png");
 t6 = loadImage("tbf6.png");
 t7 = loadImage("tbf7.png");
 t8 = loadImage("tbf8.png");
 t9 = loadImage("tbf9.png");
 es = loadImage("gameover.png");
  r = loadImage("replay.PNG");
 rd = loadImage("replaydown.PNG");
 playButton = loadImage("playbutton.png");
 instructionsPage = loadImage("instructions.png");
 ss = loadImage("startscreen.PNG")
  }
  void draw(){ 
    if ( gameStarted === 0) {
      image(ss,0,0,800,600);
      mouseClicked = function() {
      gameStarted = 1;
      };
     
  } else if ( gameStarted === 1) {
      image(instructionsPage,0,0,800,600);
      image(playButton,525, 510, 150, 50);
      mouseClicked = function() {
      gameStarted = 2;
      };
     
  } else {
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
   rect(600, 10, 175, 50);
   fill(77, 77, 255);
   stroke();
   strokeStyle = '##FFFFFF';
   rect(70, 10, 100, 50);
   numlives();
   time();
   

   
      if(Go===true){
        frameRate(100);
        fill(255);
        textSize(55);
        HofS++;
        if(s===59){m++;s=0;}
        if(HofS===99){s++;HofS=0;}
        if(m===59){h++;m=0;}
  }

   
   keyTyped = function() {
    if (textNumber === 1) {
      keysTyped1++;
    } else if (textNumber === 2){
      keysTyped2++;
    }else if (textNumber === 3){
      keysTyped3++;
    }else if (textNumber === 4){
      keysTyped4++;
    }else if (textNumber === 5){
      keysTyped5++;
    }else if (textNumber === 6){
      keysTyped6++;
    }else if (textNumber === 7){
      keysTyped7++;
    }else if (textNumber === 8){
      keysTyped8++;
    }else{
      keysTyped9++;
    }
    
   };
  
   if (roadScroller.getDashes() > 100 && roadScroller.getDashes() < 200) {
     var text = image(t1, textX, textY, 600, 300); 
      if (keysTyped1 > 19) {
         textX = textX + 20;
      }
   
   }
   else if (roadScroller.getDashes() > 200 && roadScroller.getDashes() < 400) {
  textNumber = 2;
     var text = image(t2, textX2, textY, 600, 300); 
      if (keysTyped2 > 19) {
         textX2 = textX2 + 20;
      }
   }
   
   else if (roadScroller.getDashes() > 400 && roadScroller.getDashes() < 600) {
   textNumber = 3;
     var text = image(t3, textX3, textY, 600, 300); 
      if (keysTyped3 > 19) {
         textX3 = textX3 + 20;
      }
   }
   
   else if (roadScroller.getDashes() > 600 && roadScroller.getDashes() < 800) {
     var text = image(t4, textX4, textY, 600, 300); 
      if (keysTyped4 > 19) {
         textX4 = textX4 + 20;
      }
   }
   
   else if (roadScroller.getDashes() > 800 && roadScroller.getDashes() < 1000) {
     var text = image(t5, textX5, textY, 600, 300); 
      if (keysTyped5 > 19) {
         textX5 = textX5 + 20;
      }
   }
   
   else if (roadScroller.getDashes() > 1000 && roadScroller.getDashes() < 1200) {
     var text = image(t6, textX6, textY, 600, 300); 
      if (keysTyped6 > 19) {
         textX6 = textX6 + 20;
      }
   }
   
     else if (roadScroller.getDashes() > 1200 && roadScroller.getDashes() < 1400) {
     var text = image(t7, textX7, textY, 600, 300); 
      if (keysTyped7 > 19) {
         textX7 = textX7 + 20;
      }
   }
     else if (roadScroller.getDashes() > 1400 && roadScroller.getDashes() < 1600) {
     var text = image(t8, textX8, textY, 600, 300); 
      if (keysTyped8 > 19) {
         textX8 = textX8 + 20;
      }
   }
  else {
     var text = image(t9, textX9, textY, 600, 300); 
      if (keysTyped9 > 19) {
         textX9 = textX9 + 20;
      }
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
  if ((obstacleY >= controllerY-110 && obstacleY <= controllerY+110) && (obstacleX >= controllerX-120 && obstacleX <= controllerX - 40) && lives>0){
    randomPosition = Math.round(Math.random() * 2);
    obstacleX = randLanes[randomPosition];
 obstacleY = -100;
 lives--;
}
  else if (lives < 1)
  {
 size(800, 600);
 image(es, 0, 0, 800, 600);
 image(r, 325, 390, 150, 75);
    mouseClicked = function() {
  document.location.reload(true);
  };
  }

 if (obstacleY > 700){
    randomPosition = Math.round(Math.random() * 2);
    obstacleX = randLanes[randomPosition];
    obstacleY = -100;
}
  obstacleY += 4;
  }
  }

   void numlives() {
  fill(#FFFFFF);
  textAlign(CENTER);
  text("LIVES", 170, 30);
  text(lives, 125, 45);
}

  void time() {
  fill(#FFFFFF);
  textAlign(CENTER);
  text(s, 740, 40);
  fill(#FFFFFF);
  text("TIMER", 735, 25);
  text(":", 690, 43);
  text(m, 640, 43);
  //text(":", 590, 43);
  //text(h, 540, 43);
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