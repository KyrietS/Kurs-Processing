float G = 10;

Ball b = new Ball(300,400, 1);
Ball b2 = new Ball( 700, 200, 2 );

Planet p = new Planet( 600, 400, 100000 );

void setup()
{
  size( 1200, 800 );
  b.v = new PVector( 25, -40 );
  b2.v = new PVector( -40, 27 ); 
}

void draw()
{
  background( 200 );
  b.show();
  b2.show();
  p.show();
}
