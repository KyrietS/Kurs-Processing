void setup()
{
  size( 800, 800 );
  frameRate( 120 );
}

float x = 400;
float y = 400;

float n = 100; // prędkość ruchu (długość skoku w kierunku kursora)

void draw()
{
  background( 200 );
  circle( x, y, 50 );
  
  float c = sqrt((mouseX-x)*(mouseX-x) + (mouseY - y)*(mouseY - y));
  
  float a = n * (mouseX - x)/c;
  float b = n * (mouseY - y)/c;
  
  x = x + a / frameRate;
  y = y + b / frameRate;
}
