class Tendril
{
  public final static int SEG_LENGTH = 8; //length of each segment in the tendril
  public int myNumSegments, myX, myY;
  public double startX, startY, endX, endY;
  public double myAngle;

  /**
   Class constructor
   len is how many segments in this tendril (each a fixed length, 4 is a good start)
   theta is tendril starting angle in radians 
   x, y  is the starting (x,y) coordinate
   */
  public Tendril(int len, double theta, int x, int y)
  {
    myNumSegments = len;
    myAngle = theta;
    myX = x;
    myY = y;
  }
  public void show()
  {
    int endX= myX;
    int endY= myY;
    int startX = myX;
    int startY = myY;
    for (int i = 0; i < myNumSegments; i++) {
      myAngle += (double)((int)(Math.random()*3)-2)/10;
      endX = startX+(int)(Math.cos(myAngle)*SEG_LENGTH);
      endY = startY+(int)(Math.sin(myAngle)*SEG_LENGTH);
      line(startX, startY, endX, endY);
      startX = endX;
      startY = endY;
    }
    if (myNumSegments > 10)
      stroke(250, 3, 3);
    else
      stroke(116, 43, 43);

    if (myNumSegments >= 3) {
      Cluster joe = new Cluster(myNumSegments/8, (int)endX, (int)endY);
    }
  }
}
