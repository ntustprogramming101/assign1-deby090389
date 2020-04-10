PImage skyImg;
PImage groundImg;
PImage heartImg;
PImage groundhogImg;

//soldier
int soldierX;
int soldierY;
int speedY;
PImage soldierImg;

//robot
PImage robotImg;
int robotY;
float robotX;

//red light
float redLightXL; //start
float redLightXR; //end
float redLightY;
int redLightSpeed;

void setup() {
  
  size(640, 480, P2D);
  
  skyImg=loadImage("img/bg.jpg"); //sky
  groundImg=loadImage("img/soil.png");//ground
  heartImg=loadImage("img/life.png");//heart
  groundhogImg=loadImage("img/groundhog.png");//groundhog
  
  //soldier
  soldierImg=loadImage("img/soldier.png");
  soldierX=-80;
  soldierY=160;
  speedY=floor(random(4))*80;
  
  //robot
  robotImg=loadImage("img/robot.png");
  robotX=160+random(640-160-80);
  robotY=160;
  robotY+=floor(random(4))*80;
  
  //redLight
  redLightXL=robotX+25;
  redLightXR=robotX+25;
  redLightY=robotY+37;
  redLightSpeed+=-2;

}



void draw() {

 image(skyImg,0,0);//sky
 
 image(groundImg,0,160);//ground
 
 //heart
 image(heartImg,10,10);
 image(heartImg,80,10);
 image(heartImg,150,10);
 
 //grass
 fill(124,204,25);
 noStroke();
 rect(0,145,640,15);
 
 //groundhog
 image(groundhogImg,280,80);
 
 //sun
 stroke(255,255,0);
 strokeWeight(5);
 fill(253,184,19);
 ellipse(590,50,120,120);
 
 //soldier
 image(soldierImg,soldierX,soldierY+speedY);//soldier position
 soldierX+=3;//soldier how to move
 if(soldierX > width){
   soldierX=-80;
   image(soldierImg,soldierX,soldierY+speedY);
   soldierX+=3;
 }
  
 //red light
 redLightXL += redLightSpeed;
 
 if(redLightXR-redLightXL < 40){
   redLightXR = robotX+25;
   
 }else{
   redLightXR = redLightXL+40;
  }
 
 stroke(255,0,0);
 strokeWeight(10);
 line(redLightXL,redLightY,redLightXR,redLightY);
 
 if(redLightXL<=robotX+25-80*2){
        redLightXL=robotX+25;
        redLightY=robotY+37;
   }

  
 //robot
 image(robotImg,robotX,robotY);//robot position
 

}
