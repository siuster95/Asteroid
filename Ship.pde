class Ship
{
PImage hero;
PVector loc, dimension,dir,velocity,acceleration;
float rotation,accelerationrate;
ArrayList<Bullet> bulletlist;
Bullet bullet;
Bullet bulletf;
Bullet bulletd;
int bulletlistnum;
int buffer;
boolean flying;
boolean Active;

Ship() {
 loc = new PVector(width/2,height/2);
  dimension = new PVector(40,40);
  velocity = new PVector(0,0);
  acceleration= new PVector(0,0);
  dir = new PVector(0,1);
  accelerationrate=3;
  rotation=0;
  hero=loadImage("hero.png");;
  this.flying=false;
  this.Active = true;
  bulletlist = new ArrayList<Bullet>();
  
  
  for(int x =0;x<astroid.astroidlist.size()*3+3;x++)
  {
   bullet = new Bullet();
   bulletlist.add(bullet);
  }
  bulletlistnum=bulletlist.size()-1;
  buffer=6;
}



    

  
   //firing the bullet
     void shipfiring()
    {
      if(buffer>=4)
     {
       
      if(bulletlistnum>=0)
      {
      bulletf = bulletlist.get(bulletlistnum);
      if(bulletf.fired==false) //<>//
        {
      bulletf.Fire();
      bulletf.location=loc.copy();
      bulletf.direction=dir.copy();
      bulletf.direction.normalize();
      //println(bulletlistnum);
      
      if(bulletlistnum>0||bulletlistnum==1)
          {
       bulletlistnum=bulletlistnum-1; 
          }
      else
            {
         
            }
        }
      }
      buffer=0;
     }
     buffer=buffer+1;
    }
    
    void moving() //<>//
    {
       
        
          this.flying = true;
    }

       
       
     void rotateleft()
     {

      rotation = rotation+.08;
      dir.rotate(.08);
     
    
     }
     void rotateright()
     {

      rotation = rotation-.08; 
      dir.rotate(-.08);
      
   }
    
    
     
    
     
  
       void display()
       {
         //up arrow
       if(flying == true)
       {
       dir.normalize();
       acceleration=dir.mult(accelerationrate);
       velocity.add(acceleration);
       velocity.limit(6); //<>//
       loc.add(velocity); //<>//
       
       }
       //up arrow released(drift)
        else if(flying==false)
       {
       
        velocity.mult(.95);
        loc.add(velocity);
        
       }
       //if the ship wasn't destroyed
      if(Active==true)
      {
     pushMatrix();
     translate(loc.x,loc.y);
     rotate(rotation);
     image(hero,-20,-20);
     popMatrix();
     
      }
      else
      {
        
      }
     
     flying=false;
    //display bullets
  for(int x =0;x<bulletlist.size();x++)
  {
    bulletd=bulletlist.get(x);
 if(bulletd.fired==true)
 {
   
  bulletd.display(); //<>//
  boolean falsify=bulletd.Check();
  if(falsify==false)
  {
    bulletlist.remove(x);
  }
  
 }
  }
  //wrapping of ship
  if(loc.x<0)
  {
    loc.x=width;
  }
  if(loc.x>width)
  {
    loc.x=0; 
  }
  if(loc.y<0)
  {
    loc.y=height;
  }
  if(loc.y>height)
  {
    loc.y=0; 
  }
}


}