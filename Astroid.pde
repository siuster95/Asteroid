class Astroid
{
 
  PImage enemy,smallenemy;
  PVector location,dimension,dir,velocity,ALcenter,AScenter,acceleration;
  float accelerationrate;
  ArrayList<Astroid> astroidlist;
  Astroid Ast,Astcopy,Ast2;
  boolean active;
  boolean small;
 
  
  Astroid(float sizex,float sizey, boolean size)
  {
      float rando = random(0,2);
      if(rando<=.5)
      {
      location = new PVector(0,random(0,height));
      }
      else if(rando<=1)
      {
        location = new PVector(random(0,width),0);
      }
      else if(rando<=1.5)
      {
        location = new PVector(width,random(0,height));
      }
      else if(rando<2)
      {
       location = new PVector(random(0,width),height); 
      }
      dimension = new PVector(sizex,sizey);
      enemy = loadImage("Enemy.png");
      smallenemy=loadImage("Enemysmall.png");
      dir = new PVector(0,0);
      velocity = new PVector(0,0);
      accelerationrate=.1;
      enemy.resize(30,30);
      active=true;
      small = size;
      ALcenter=new PVector(0,0);
      AScenter= new PVector(0,0);
      acceleration=new PVector(0,0);
  }
  
  void createlist(int y)
  {
      astroidlist= new ArrayList<Astroid>();
      for(int x =0;x<y;x++)
      {
         Ast = new Astroid(30,30,true);
        astroidlist.add(Ast);
      }
    
  }
  

  void move()
  {
    
    for(int x =0;x<astroidlist.size();x++)
    {
     Astcopy = astroidlist.get(x);
     Astcopy.dir = PVector.sub(ship.loc,Astcopy.location);
     Astcopy.dir.normalize();
     Astcopy.acceleration=Astcopy.dir.mult(accelerationrate);
     Astcopy.velocity.add(Astcopy.acceleration);
     Astcopy.velocity.limit(.7);
     Astcopy.location.add(Astcopy.velocity);
     boolean hittingA=Astcopy.hitB(ship.bulletlist);
     boolean hittingS= Astcopy.hitS(ship);
    if(hittingA==true&&Astcopy.small==true)
    {
      PVector nloc = Astcopy.location.copy();
      astroidlist.remove(x);
      Ast = new Astroid(20,20,false);
      Ast.location=nloc.copy();
      Ast2 = new Astroid(20,20,false);
      Ast2.location=nloc.copy();
      Ast2.location.x=Ast2.location.x+20;
      Ast2.location.y=Ast2.location.y+20;
      astroidlist.add(Ast2);
      astroidlist.add(Ast);
    }
    if(hittingA==true&&Astcopy.small==false)
    {
     astroidlist.remove(x); 
    }
    if(hittingS==true)
    {
      ship.Active=false; 
    }
   
   if(Astcopy.small==true)
   {
    //rect(Astcopy.location.x,Astcopy.location.y,30,30);
   image(enemy,Astcopy.location.x,Astcopy.location.y);
   }
   else if(Astcopy.small==false)
   {
     //rect(Astcopy.location.x,Astcopy.location.y,10,10);
     image(smallenemy,Astcopy.location.x,Astcopy.location.y);
   }
    
  if(Astcopy.location.x<0)
  {
    Astcopy.location.x=width;
  }
  if(Astcopy.location.x>width)
  {
    Astcopy.location.x=0; 
  }
  if(Astcopy.location.y<0)
  {
    Astcopy.location.y=height;
  }
  if(Astcopy.location.y>height)
  {
    Astcopy.location.y=0; 
  }
 
  }
  }
  Boolean hitB(ArrayList<Bullet> Blist)
{ 
  for(int x =0;x<Blist.size();x++)
  {
    Bullet B = Blist.get(x);
    ALcenter.x =this.location.x+15;
    ALcenter.y = this.location.y+15;
    float distanceB = PVector.dist(B.location,ALcenter);
    if(this.small==true&&B.fired==true)
    {
     if(distanceB<=16) 
     {
       B.fired=false;
       return true;
     }
    }
    if(this.small==false&&B.fired==true)
    {
      AScenter.x=this.location.x+5;
      AScenter.y=this.location.y+5;
      distanceB = PVector.dist(B.location,AScenter);
      if(distanceB<=6)
      {
        B.fired=false; 
        return true;
      }
    }
   
  
  }
  return false;
}
   Boolean hitS(Ship ship)
{     
    ALcenter.x =this.location.x+15;
    ALcenter.y = this.location.y+15;

   
    float distanceS =PVector.dist(ALcenter,ship.loc);
    if(this.small==true)
    {
      if(distanceS<=35)
      {
        return true; 
      }
    }
    if(this.small==false)
    {
      AScenter.x=this.location.x+5;
      AScenter.y=this.location.y+5;
      distanceS =PVector.dist(ship.loc,AScenter);
      if(distanceS<=25)
      {
        return true; 
      }
    }
  return false;
} 
  
}