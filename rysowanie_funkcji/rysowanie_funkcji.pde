void setup()
{
  size( 800, 800 );
  strokeWeight( 3 );
  frameRate( 120 );
}

float f( float x )
{
  return 200.0/(0.05*(x-400)) + 400;
}

float x1 = 0;
float y1 = 0;

float x2 = 1;
float y2 = 0;

void draw()
{
  y1 = f(x1);
  y2 = f(x2);
  line(x1, height-y1, x2, height-y2 );
  
  x1 += 1;
  x2 += 1;
}
