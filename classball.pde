float allareacir;
Ball[] nextBall;
Sqr[] nextSqr;
int n = 5;
void setup()
{
  size(1000, 800);
  nextBall = new Ball[n];
  nextSqr= new Sqr[n];
  for(int i=0; i<n; i++)
  {
    float r_width = random(150, 850);
    float r_height = random(150, 650);
    float r_size = random(50, 300);
    nextBall[i] = new Ball(r_width, r_height, r_size);
    nextSqr[i]= new Sqr(r_width, r_height, r_size,r_size);
    nextBall[i].getArea();
 }
}
void draw()
{
 
  background(255);
   for(int p=0;p<5;p++)
   {
    allareacir=0+nextBall[p].ballarea;
    if(nextBall[p].show)
      {
       nextBall[p].draw();
      }
     if(nextSqr[p].show)
      {
      nextSqr[p].draw();
      }
   } 
 
}
void mousePressed()
{
  for(int p=0;p<n;p++)
  {
    if(dist(nextBall[p].position_x,nextBall[p].position_y,mouseX,mouseY)<(nextBall[p].size/2))
    {
      nextBall[p].show=false;
    }
    if(nextSqr[p].startx<mouseX&&mouseX<(nextSqr[p].startx+nextSqr[p].sqrwidth)&&nextSqr[p].starty<mouseY&&mouseY<(nextSqr[p].starty+nextSqr[p].sqrheight))
    {
    nextSqr[p].show=false;
    }
  }
}  
public class Ball
{
  boolean show=true;
  float position_x;
  float position_y;
  float size;
  float ballarea;
  //color randomColor = color(random(255), random(255), random(255)) ;
  public Ball(float position_x, float position_y, float size)  // Constructor
  {
    this.position_x = position_x;
    this.position_y = position_y;
    this.size = size;
  }
  void draw()
  {
    ellipse(position_x,position_y,size,size);
  }
  public float getArea()
   {
     float ballarea;  
     ballarea=(this.size/2)*(this.size/2)*3.14;
     print(ballarea+" ");
     this.ballarea=ballarea;
     return ballarea;
     
   }
}
public class Sqr
{
  boolean show=true;
  float startx;
  float starty;
  float sqrwidth;
  float sqrheight;
  public Sqr(float startx,float starty,float sqrwidth,float sqrheight)
  {
    this.startx=startx;
    this.starty=starty;
    this.sqrwidth=sqrwidth;
    this.sqrheight=sqrheight;
  } 
  void draw()
  {
    rect(this.startx,this.starty,this.sqrwidth,this.sqrheight);
  }
}
