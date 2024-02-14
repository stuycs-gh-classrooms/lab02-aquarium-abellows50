/* ===================================
RegularGon

A ReularGon is a Polygon but when the
points are generated they are all the
same distance from the center point.

The center should always be in the middle
of the square region defined by the
corner and shapeSize instance vairables.

Whem making a new RegularGon, the radius
should be a random number in the range
[20, shapeSize) divided by 2.

A valid RegularGon is once with an area
that is larger than (shapeSize^2)/4.

toString should return "Regulragon" and the
number of points.

Write the entire RegularGon class, only
overriding the necessary methods to create
a RegularGon as described above.
=================================== */

class RegularGon extends Polygon{
  RegularGon(int np, int cx, int cy, int ss) {
    super(np, cx, cy, ss);
    
  }//RegularGon
  
  void makeRandomShape() {
    center = new PVector(corner.x + shapeSize/2, corner.y + shapeSize/2);
    int r = (int) random(20,shapeSize)/2;
    radius = r;
    for(int p=0; p < numPoints; p++) {
      float theta = radians((float(p)/numPoints) * 360);
      int x = int(r * cos(theta) + center.x);
      int y = int(r * sin(theta) +  center.y);
      points.add(new PVector(x, y));
    }//generate points loop
  }//makeRandomShape
  
  String toString(){
    return "Regulargon; " + points.size();
  }
  
  
  boolean isValidShape(){
    return area > shapeSize*shapeSize/4;
  }
}
