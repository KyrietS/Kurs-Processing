class Planet
{
  float m;
  PVector pos;
  Planet( float x, float y, float m )
  {
    this.pos = new PVector(x,y);
    this.m = m;
  }
  void show()
  {
    fill( #f47442 );
    ellipse( pos.x, pos.y, 100, 100 );
  }
}
