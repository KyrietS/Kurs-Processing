float G = 25;

ArrayList< Ball > balls = new ArrayList();
ArrayList< Planet > planets = new ArrayList();

Point[] points = null;

void setup()
{
  fullScreen();
  planets.add( new Planet( width/2, height/2, 100000 ) );
}

void draw()
{
  background( 200 );

  for( Ball b : balls )
    b.show();

  if( tempBall != null )
  {
    tempBall.show();
    line( tempBall.pos.x, tempBall.pos.y, mouseX, mouseY );
  }

  for( Planet p : planets )
    p.show();
    
  if( points != null )
    for( int i = 0; i < points.length - 1; i++ )
      line( points[ i ].pos.x, points[ i ].pos.y, points[ i+1 ].pos.x, points[ i+1 ].pos.y );
}

Ball tempBall = null;

void mousePressed()
{
    tempBall = new Ball(mouseX, mouseY, 1);
    tempBall.frozen = true;
    points = new Point[ 10 ];
    for( int i = 0; i < points.length; i++ )
      points[ i ] = new Point( mouseX, mouseY, 1, (float)i/2 );
}

void mouseDragged()
{
  if( tempBall != null )
  {
    tempBall.v = new PVector( tempBall.pos.x - mouseX, tempBall.pos.y - mouseY );
    for( int i = 0; i < points.length; i++ )
    {
      points[ i ].v = tempBall.v.copy();
      points[ i ].predict();
    }
  }
}

void mouseReleased()
{
    Ball ball = new Ball( tempBall.pos.x, tempBall.pos.y, 1 );
    ball.v = tempBall.v;
    balls.add( ball );
    tempBall = null;
}
