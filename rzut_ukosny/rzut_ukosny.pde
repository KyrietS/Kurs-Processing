void setup()
{
  size( 800, 800 );
  frameRate( 120 );
}

float x = 100;
float y = 700;

float vx = 120;    // prędkość początkowa w poziomie (stała)
float vy= -300;    // prędkość początkowa w pionie (rośnie)

float a = 1;       // przyspieszenie (wpływa na zmianę 'vy')

void draw()
{
  background( 200 );
  circle( x, y, 50 );
  
  x += vx / frameRate;
  y += vy / frameRate;
  
  vy += a;          // zwiększ prędkość w pionie
}
