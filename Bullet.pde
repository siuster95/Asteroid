class Bullet{
PVector direction, location, dimension,velocity,acceleration;
float accelerationrate;
boolean fired;
PShape bullet;

Bullet(){
location = new PVector(0,0);
dimension = new PVector(2,2);
direction= new PVector(1,1);
velocity= new PVector(0,0);
acceleration=new PVector(0,0);
accelerationrate=3;
fired=false;
bullet = createShape(ELLIPSE,0,0,dimension.x,dimension.y);
}
  void Fire() //<>//
  {
    if(fired==false)
  {
   fired=true; 
  }
  }
  
  
void display()
{
   direction.normalize();
  acceleration=direction.mult(accelerationrate);
  velocity.add(acceleration);
  velocity.limit(5);
  location.add(velocity);
  shape(bullet,location.x,location.y);
  
}
  
Boolean Check()
{
 if(location.x<0||location.x>width||location.y<0||location.y>height)
 {
  fired=false; 
  return false;
 }
 return true;
}



}
  
  
  
  
  
  
  