static boolean UP_KEY_PRESSED,LEFT_KEY_PRESSED,SPACEBAR_PRESSED,RIGHT_KEY_PRESSED,PLAY_KEY_PRESSED;
Ship ship;
Astroid astroid;
int gamestate,ALsize,levelchecker;
PImage titlescreen,background,gameover;
float value,map;
void setup(){
  size(600,600);
  ALsize=3;
  astroid = new Astroid(60,60,true);
  astroid.createlist(ALsize);
  ship = new Ship();
  gamestate=0;
  titlescreen = loadImage("title_screen.png");
  background = loadImage("play_background.png");
  gameover=loadImage("game_over.png");
  levelchecker=1;
}

void draw(){
 if(gamestate==0)
 {
   background(255);
   println(gamestate);
   image(titlescreen,0,0);
   println(PLAY_KEY_PRESSED);
   if(PLAY_KEY_PRESSED==true)
   {
      gamestate=1; 
   }
   
 }
  else if(gamestate==1)
  {
  background(255);
  image(background,0,0);
 if(ship.bulletlist.size()==0)
  {
    gamestate=2; 
  }
  if(UP_KEY_PRESSED==true)
  {
    ship.moving(); 
  }
  if(LEFT_KEY_PRESSED==true)
  {
    ship.rotateleft(); 
  }
  if(RIGHT_KEY_PRESSED==true)
  {
    ship.rotateright(); 
  }
  if(SPACEBAR_PRESSED==true)
  {
    ship.shipfiring();
  }
  value=ship.bulletlistnum;
  map = map(value,0,100,0,width);
  fill(255);
  rect(0,570,map,30);
  ship.display();
  astroid.move();
  if(ship.Active==false)
  {
    gamestate=2; 
  }
 
  }
  else if(gamestate==2)
  {
    background(255);
    println("GAME OVER");
    image(gameover,0,0);
    textSize(96);
    fill(255,0,0);
    if(levelchecker<=5)
    {
    text("F",150,400);
    }
    else if(levelchecker<=10)
    {
      text("D",150,400);
    }
    else if(levelchecker<=15)
    {
      text("C",150,400);
    }
    else if(levelchecker<=20)
    {
      text("B",150,400); 
    }
    else if(levelchecker>20)
    {
      text("A",150,400);
    }
  }
    if(astroid.astroidlist.size()==0)
  {
    ALsize=ALsize+2;
    astroid.createlist(ALsize);
    ship = new Ship();
    gamestate=1;
    levelchecker=levelchecker+1;
  }
  
}

void keyPressed()
{
  if(key==' ')
  {
     SPACEBAR_PRESSED=true;
  }
  if(key=='p')
  {
     PLAY_KEY_PRESSED=true;
  }
  
 if(key==CODED)
 {
   if(keyCode==UP)
   {
     UP_KEY_PRESSED=true;
   }
   if(keyCode==LEFT)
   {
     LEFT_KEY_PRESSED=true;
   }
   if(keyCode==RIGHT)
   {
     RIGHT_KEY_PRESSED=true;
   }
    
     
 }
}

void keyReleased()
{
  if(key==' ')
  {
     SPACEBAR_PRESSED=false;
  }
    if(key=='p')
  {
     PLAY_KEY_PRESSED=false;
  }
  
 if(key==CODED)
 {
   if(keyCode==UP)
   {
     UP_KEY_PRESSED=false;
   }
   if(keyCode==LEFT)
   {
     LEFT_KEY_PRESSED=false;
   }
   if(keyCode==RIGHT)
   {
     RIGHT_KEY_PRESSED=false;
   }
   
 }
}