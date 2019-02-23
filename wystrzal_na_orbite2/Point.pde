class Point extends Ball
{
  float seconds;
  PVector initPos;
  Point( float x, float y, float m, float seconds )
  {
    super( x, y, m );
    initPos = new PVector( x, y );
    this.seconds = seconds;
  }
  
  public void predict()
  {
    this.pos = new PVector( initPos.x, initPos.y );
    for( int i = 0; i < seconds * frameRate; i++ )
      move();
  }
  
  public void show()
  {
    fill( 0 );
    ellipse( pos.x, pos.y, 10, 10 );
  }
}
