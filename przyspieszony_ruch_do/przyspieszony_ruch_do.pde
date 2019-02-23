/*
** Ruch jednostajnie przyspieszony w kierunku kursora.
*/
void setup()
{
  size( 800, 800 );
  frameRate( 120 );
}

float x = 400;
float y = 400;

float n = 1;

float vx = 30;
float vy = 0;

void draw()
{
  background( 200 );
  circle( x, y, 50 );
  
  float c = sqrt((mouseX-x)*(mouseX-x) + (mouseY - y)*(mouseY - y));
  
  float a = n * (mouseX - x)/c;
  float b = n * (mouseY - y)/c;
  
  vx += a;    // zwiększenie prędkości poziomej
  vy += b;    // większenie prędkości pionowej
  
  x = x + vx/frameRate;    // zmiana położenia w zależności od prędkości
  y = y + vy/frameRate;    // zmiana położenia w zależności od prędkości
}
