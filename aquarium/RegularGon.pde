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
