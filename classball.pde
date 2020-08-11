void setup()
{
  int n = 5;
  fill(255);
  size(1000, 800);
  Ball[] nextBall;
  {
    nextBall = new Ball[n];
    for(int i=0; i<n; i++)
    {
        float r_width = random(1, 999);
        float r_height = random(1, 799);
        float r_size = random(50, 300);
      nextBall[i] = new Ball(r_width, r_height, r_size);
      nextBall[i].draw();
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
    fill(randomColor) ;
  }
}
