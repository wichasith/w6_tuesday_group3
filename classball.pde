//Test
void setup()
{
  int n = 5;
  fill(255);
  size(1000, 800);
  Ball[] nextBall;
  Sqr[] nextSqr;
  {
    nextSqr= new Sqr[n];
    nextBall = new Ball[n];
    for(int i=0; i<n; i++)
    {
        float r_width = random(1, 999);
        float r_height = random(1, 799);
        float r_size = random(50, 300);
      nextBall[i] = new Ball(r_width, r_height, r_size);
      nextSqr[i]= new Sqr(r_width, r_height, r_size,r_size);
      nextBall[i].draw();
      nextSqr[i].draw();
  }
  }
}

class Ball
{
  float position_x;
  float position_y;
  float size;
  color randomColor = color(random(255), random(255), random(255)) ;

  Ball(float position_x, float position_y, float size)  // Constructor
  {
    this.position_x = position_x;
    this.position_y = position_y;
    this.size = size;
   
  }

  void draw()
  {
    ellipse(this.position_x, this.position_y, this.size, this.size);

 
  }
}

class Sqr
{
  float startx;
  float starty;
  float sqrwidth;
  float sqrheight;
  Sqr(float startx,float starty,float sqrwidth,float sqrheight)
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
