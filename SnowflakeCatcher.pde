SnowFlake [] snow;
void setup()
{
  frameRate(60);
  size(300,300);
  background(0);
  snow = new SnowFlake[150];
  for(int i=0; i<snow.length; i++)
  {
    snow[i] = new SnowFlake();
  }
}
void draw()
{
  for(int i=0; i<snow.length; i++)
  {
      snow[i].erase();
      snow[i].lookDown();
      snow[i].move();
      snow[i].wrap();
      snow[i].show();
  }
}
void mouseDragged()
{
  if(mousePressed == true && mouseButton == LEFT)
  {
      fill(0,255,0);
      noStroke();
      ellipse(mouseX,mouseY,10,10);
  }
  if(mousePressed == true && mouseButton == RIGHT)
  {
      fill(0);
      noStroke();
      ellipse(mouseX,mouseY,20,20);
  }
} 
class SnowFlake
{
  int x , y;
  boolean isMoving;
  SnowFlake()
  {
    x = (int)(Math.random()*301);
    y = (int)(Math.random()*301);
    isMoving = true;
  }
  void show()
  {
    fill(255);
    stroke(0);
    ellipse(x,y,5,5);
  }
  void lookDown()
  {
    if(get (x,y+4) != color(0))
      isMoving = false;
    else    
      isMoving = true;
  }
  void erase()
  {
    fill(0);
    ellipse(x,y,7,7);
  }
  void move()
  {
    if(isMoving == true)
    y = y + 1;
  }
  void wrap()
  {
    if(y>295)
      y = 0;
  }
}


