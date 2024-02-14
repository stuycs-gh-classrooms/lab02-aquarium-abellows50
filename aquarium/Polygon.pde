class Polygon extends PathShape {

  PVector center;
  int radius;

  Polygon(int np, int cx, int cy, int ss) {
    super(np, cx, cy, ss);
    
  }//Polygon

  void makeRandomShape(PVector center) {
    points = new ArrayList<PVector>();
    radius = shapeSize/2;
    for(int p=0; p < numPoints; p++) {
      float theta = radians((float(p)/numPoints) * 360);
      int r = int(random(radius));
      int x = int(r * cos(theta) + center.x);
      int y = int(r * sin(theta) +  center.y);
      points.add(new PVector(x, y));
    }//generate points loop
  }//makeRandomShape
  

  
  String toString(){
    return "Polygon: " + points.size();
  }
 

}//Polygon
