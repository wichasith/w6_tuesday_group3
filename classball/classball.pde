float eachblockarea, eachcirarea, allcir = 0, allsqr = 0 , allarea;
int n = 5;
Ball[] nextBall;
Sqr[] nextSqr;
void setup()
{
  size(1000, 800);
  nextBall = new Ball[n];
  nextSqr= new Sqr[n];
  for(int i = 0; i < n; i++)
  {
    float r_width = random(150, 850);
    float r_height = random(150, 650);
    float r_size = random(50, 300);
    nextBall[i] = new Ball(r_width, r_height, r_size);
    nextSqr[i] = new Sqr(r_width, r_height, r_size,r_size);
    eachcirarea = nextBall[i].getBallArea();
    eachblockarea = nextSqr[i].getBlockArea();
    allcir = allcir + eachcirarea;
    allsqr = allsqr + eachblockarea;
    allarea = allcir + allsqr ;
  }
    println("Total ball area : " + allcir);
    println("Total square area : " + allsqr);
    println("All Total is : " + allarea) ;
}
void draw()
{
  background(255);
   for(int p = 0; p < 5; p++)
   {
     delay(20) ;
    if(nextBall[p].show)
      {
      color randomcolor = color(random(255), random(255), random(255)) ;
      fill(randomcolor);
        nextBall[p].draw();
      }
     if(nextSqr[p].show)
      {
      color randomcolor = color(random(255), random(255), random(255)) ;
      fill(randomcolor);
       nextSqr[p].draw();
      }
   } 
}
void mousePressed()
{
  for(int p = 0; p < n ; p++)
  {
    if(dist(mouseX, mouseY, nextBall[p].position_x, nextBall[p].position_y) < (nextBall[p].size / 2))
    {
      delay(150);
      if(nextBall[p].show == true)
      {
        allcir = allcir - nextBall[p].getBallArea();
      }
      nextBall[p].show = false; 
    }
    else if(nextSqr[p].startx < mouseX && mouseX < (nextSqr[p].startx + nextSqr[p].sqrwidth) && nextSqr[p].starty < mouseY && mouseY < (nextSqr[p].starty+nextSqr[p].sqrheight))
    {
      delay(150);
      if(nextSqr[p].show == true)
      {
        allsqr = allsqr - nextSqr[p].getBlockArea();
      }
      nextSqr[p].show = false;
    }
    allarea = allcir + allsqr ;
  }
println("\nBall area left " + allcir); 
println("Block area left " + allsqr);
println("All Total left : " + allarea) ;
}
public class Ball
{
  boolean show = true;
  float position_x;
  float position_y;
  float size;
  color randomcolor = color(random(255), random(255), random(255)) ; 
  public Ball(float position_x, float position_y, float size)  // Constructor
  {
    this.position_x = position_x;
    this.position_y = position_y;
    this.size = size;
  }
  void draw()
  {
    ellipse(position_x, position_y, size, size);
    fill(randomcolor) ;
  }
  public float getBallArea()
   {
     float ballarea;
     ballarea = (this.size/2) * (this.size/2) * PI;
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
  public float getBlockArea()
   {
     float blockarea;
     blockarea=this.sqrwidth*this.sqrheight;
     return blockarea;
   }
}
