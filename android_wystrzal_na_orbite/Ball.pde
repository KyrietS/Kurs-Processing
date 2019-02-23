class Ball
{
  float m; // masa
  PVector pos = new PVector(0,0);
  PVector f = new PVector(0,0); // siła
  PVector a = new PVector(0,0); // przyspieszenie
  PVector v = new PVector(0,0); // prędkość
  boolean frozen = false;
  
  Ball( float x, float y, float m )
  {
    this.pos = new PVector(x,y);
    this.m = m;
  }
  void show()
  {
    if( !frozen )
      move();
    fill( #ecff21 );
    ellipse(pos.x, pos.y, 50, 50);
  }
  void move()
  {
    f = new PVector( 0, 0 );
    for( Planet p : planets )
    {
      PVector r = PVector.sub( this.pos, p.pos );
      float rmag = ( r.mag() < 50 ? 50 : r.mag() );
      f.add( r.mult(-G * m*p.m / (rmag * rmag * rmag) ) );
    }
    
    a = new PVector(f.x / m, f.y / m);
    v = v.add( a.div(frameRate) );
    pos.x = pos.x + v.x / frameRate;
    pos.y = pos.y + v.y / frameRate;
  }
}
