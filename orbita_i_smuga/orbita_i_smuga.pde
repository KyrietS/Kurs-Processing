/*
** Ruch jednostajnie przyspieszony w kierunku punktu.
** Uwaga: to NIE jest przykład orbity z siłą grawitacji, bo w tej symulacji
** przyspieszenie jest stałe w każdej odległości od planety i wynosi 'n'.
** Dlatego orbity wychodzą takie dziwne :)
*/
void setup()
{
  size( 800, 800 );
  frameRate( 120 );
}

float x = 400;
float y = 200;

float n = 1;             // wartość przyspieszenia w kierunku planety

float vx = 100;          // prędkość początkowa (zmień, aby ustawić orbitę)
float vy = 0;

float xPlanety = 400;
float yPlanety = 400;

ArrayList<Float> drogaX = new ArrayList<Float>();
ArrayList<Float> drogaY = new ArrayList<Float>();

void draw()
{
  background( 200 );
  
  fill( #4280f4 );     // zmiana kolory wypełnienia na niebieski
  circle( x, y, 50 );  // rysowanie piłeczki
  
  fill( #f4b343 );     // zmiana koloru wypełnienie na pomarańczowy
  circle( xPlanety, yPlanety, 50 );  // rysowanie planety
  
  float c = sqrt((xPlanety-x)*(xPlanety-x) + (yPlanety - y)*(yPlanety - y));
  float a = n * (xPlanety - x)/c;
  float b = n * (yPlanety - y)/c;
  
  vx += a;    // zwiększenie prędkości poziomej
  vy += b;    // większenie prędkości pionowej
  
  x = x + vx/frameRate;    // zmiana położenia w zależności od prędkości
  y = y + vy/frameRate;    // zmiana położenia w zależności od prędkości
  
  drogaX.add(x);  // zapamiętaj obecne współrzędne
  drogaY.add(y);  // zapamiętaj obecne współrzędne
  
  // rysowanie przebytej drogi
  for( int i = 0; i < drogaX.size()-1; i++ )
    line( drogaX.get(i), drogaY.get(i), drogaX.get(i+1), drogaY.get(i+1) );
  
}
