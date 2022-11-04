Particle [] dots;
OddBall bob;
boolean mouseClicked = false;
void setup(){
  size(500,500);
}

void mouseClicked(){
  mouseClicked = true;
  dots = new Particle[100];
  bob = new OddBall();
  for(int i = 0; i < dots.length; i++){
   dots[i] = new Particle(); 
  }
 //redraw(); 
}

void draw(){
  background(0);
  if(mouseClicked == true){
   noStroke();
   for(int i = 0; i < dots.length; i++){
     dots[i].walk();
     dots[i].show();
    } 
   bob.walk();
   bob.boom();
  }
  //setting
  fill(66,129,40);
  rect(0,400,500,150);
  noStroke();
  fill(97,5,162);
  rect(223,340,25,70);
  fill(21,90,11);
  rect(273,340,25,70);
  fill(255,214,131);
  ellipse(235,330,30,30);
  fill(255,214,131);
  ellipse(285,330,30,30);

 
}


class Particle{
 double myX, myY, myAngle, mySpeed;
 int r, g, b;
 Particle(){
   myX = mouseX;
   myY = mouseY;
   myAngle = (Math.random()*3)*PI;
   mySpeed = (Math.random()*10)+1;
   r = (int)(Math.random()*226);
   g = (int)(Math.random()*226);
   b = (int)(Math.random()*226);
 }
 void walk(){
   myX = (Math.cos(myAngle)*mySpeed)+myX;
   myY = (Math.sin(myAngle)*mySpeed)+myY;
 }
 void show(){
   fill(r, g, b);
   ellipse((int)myX, (int)myY, 5, 5);
 } 
}


class OddBall extends Particle{
 void walk(){
  myX = myX + (int)(Math.random()*3)-1;
  myY = myY + (int)(Math.random()*3)-1;
 }
 void boom(){
   fill(255,0,0);
   textSize(30);
   text("BOOM", (int)myX-50, (int)myY);
 }
}
