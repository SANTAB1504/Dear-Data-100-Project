Health myHealth;
Health Heart2;
Heart Heart3;
PImage Jevil;
PImage spamton;
PImage back_Button;
color heartColour;
int PlayState = 0;
  void setup(){
  size(600,600);
  Jevil = loadImage("jevil2.png");
  spamton = loadImage("Spamton.png");
  back_Button =  loadImage("Back Button.png");
  myHealth = new Health(100,100,25);
  Heart3 = new Heart(50,2);
  

}
void draw(){
background(0,0,0);
ScreenChange();

}



class Heart { 
  //Heart Pos
  int Xpos = 0;
  int Ypos = -10;
  int[][] PixelMap= {
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,0,0,0,0,0,0,0},
    {0,0,0,1,1,0,1,1,0,0},
    {0,0,1,1,1,1,1,1,1,0},
    {0,0,1,1,1,1,1,1,1,0},
    {0,0,0,1,1,1,1,1,0,0},
    {0,0,0,0,1,1,1,0,0,0},
    {0,0,0,0,0,1,0,0,0,0}
    
   
     
  };
  Heart(int Xpos,int Ypos){
  this.Xpos = Xpos;
  this.Ypos = Ypos;
  }
 void display(){
  for (int column = 0; column<10; column+=1){
    for (int rows = 0; rows<10; rows = rows +1){
    if (PixelMap[rows][column] == 1){
     fill(heartColour);}
     else{
       fill(0);
         }
    noStroke();
    rect(Xpos+column*5,Ypos+rows*5,5,5);
    }
  
   }
  }
 }
class Health{
int HPposX = 30;
int HPposy = 40;
int HealthVal = 40;
 Health(int HPposX,int HPposy, int HealthVal){
    this.HPposX = HPposX;
    this.HPposy = HPposy;
    this.HealthVal = HealthVal;
}
void display() {
for (int square =0; square<100; square += 1){
if(square< HealthVal){
fill(0,255,0);}
else{
fill(255,0,0);
    }
rect(HPposX+square*1,HPposy,1,20);
    }
  }
}
void ScreenChange(){
int XPosImgJ = 30;
int YposImgJ = 200;
int XPosImgS = 200;
int YPosImgS = 200;
int Xbutton = -15; 
int Ybutton = height - 60;
if (PlayState == 0){
image(Jevil,XPosImgJ,YposImgJ,150,150);
image(spamton,XPosImgS,YPosImgS,150,150);
if(mousePressed && mouseX>XPosImgJ && mouseX<XPosImgJ+150 && mouseY>YposImgJ && mouseY<YposImgJ +150){
  PlayState= 1;}
if(mousePressed && mouseX>XPosImgS && mouseX<XPosImgS+150 && mouseY>YPosImgS && mouseY<YPosImgS +150){
  PlayState= 2;}  
  

}
if (PlayState == 1){
rect(2,3,400,300);
image(back_Button,Xbutton,Ybutton,100,100);
heartColour = color(255,0,0);
Heart3.display();
if(mousePressed && mouseX>Xbutton && mouseX<Xbutton+100 && mouseY>Ybutton && mouseY<Ybutton+100){
PlayState = 0;
}

}
if (PlayState == 2){
rect(2,3,400,300);
heartColour = color(247,255,23);
Heart3.display();
image(back_Button,Xbutton,Ybutton,100,100);
if(mousePressed && mouseX>Xbutton && mouseX<Xbutton+100 && mouseY>Ybutton && mouseY<Ybutton+100){
PlayState = 0;
}
}


}
