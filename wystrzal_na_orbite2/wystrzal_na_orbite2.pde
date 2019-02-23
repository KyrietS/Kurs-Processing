float G = 40;

ArrayList<Ball> balls = new ArrayList();
Ball tempBall = null;

Point[] points = null;

ArrayList< Planet > planets = new ArrayList();

public void setup()
{
  size( 1200, 800 );
  planets.add( new Planet(600, 400, 100000 ) );
  planets.add( new Planet( 900, 400, 100000 ) );
}

public void draw()
{
  background( 200 );
  
  for( int i = 0; i < balls.size(); i++ )
    balls.get( i ).show();
  
  if( tempBall != null )
  {
    fill( 0xffecff21 );
    ellipse( tempBall.pos.x, tempBall.pos.y, 50, 50 );
    line( tempBall.pos.x, tempBall.pos.y, tempBall.pos.x - tempBall.v.x, tempBall.pos.y - tempBall.v.y );
  }
  
  for( Planet p : planets )
    p.show();
  
  if( points != null )
    for( int i = 0; i < points.length - 1; i++ )
      line( points[ i ].pos.x, points[ i ].pos.y, points[ i+1 ].pos.x, points[ i+1 ].pos.y );
      //points[ i ].show();
}

void mousePressed()
{  
  if( mouseButton == RIGHT )
    planets.add( new Planet( mouseX, mouseY, 100000 ) );
  if( mouseButton == LEFT )
  {
    if( tempBall == null )
    {
      tempBall = new Ball( mouseX, mouseY, 1 );
      points = new Point[ 100 ];
      for( int i = 0; i < points.length; i++ )
        points[ i ] = new Point( mouseX, mouseY, 1, (float)i / 25 + 0.04f );
    }
  }
}

public void mouseDragged()
{
  tempBall.v = new PVector( tempBall.pos.x - mouseX, tempBall.pos.y - mouseY);
  for( int i = 0; i < points.length; i++ )
  {
    points[ i ].v = tempBall.v.copy();
    points[ i ].predict();
  }
  
}

public void mouseReleased()
{
  if( mouseButton == LEFT )
  {
    Ball ball = new Ball( tempBall.pos.x, tempBall.pos.y, 1 );
    ball.v = tempBall.v;
    balls.add( ball );
    tempBall = null;
  }
}
