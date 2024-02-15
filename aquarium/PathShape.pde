class PathShape {

  ArrayList<PVector> points;
  int numPoints;
  PVector corner;
  int shapeSize;
  color inside;
  float area;
  PVector centroid;


  PathShape(int np, int cx, int cy, int ss) {
    numPoints = np;
    corner = new PVector(cx, cy);
    shapeSize = ss;
    inside = #FFFF00;
    points = new ArrayList<PVector>();
    area = 0;
    makeRandomShape();
    setArea();
    setCentroid();

  }

  PathShape(int np) {
    this(np, 0, 0, width);
  }//num points constructor

  PathShape() {
    this(int(random(3, 20)));
  }//default constructor



  boolean isValidShape() {
    return centroid.x < corner.x+shapeSize && centroid.x > corner.x &&
           centroid.y < corner.y+shapeSize && centroid.y > corner.y;
  }//isValidShape




  String toString() {
    return "Pathshape: " + points.size();
  }//toString


  void display() {
    fill(inside);
    // stroke(border);
    beginShape();
    for (int p=0; p < numPoints; p++) {
      vertex(points.get(p).x, points.get(p).y);
    }//loop over vertices
    endShape(CLOSE);
    fill(255);
  }//display



  void makeRandomShape() {
    for (int p=0; p < numPoints; p++) {
      points.add( makeRandomPoint() );
    }
  }//makePoints

 
  PVector makeRandomPoint() {
    PVector newPoint = new PVector();
    newPoint.x = int(random(shapeSize)) + corner.x;
    newPoint.y = int(random(shapeSize)) + corner.y;
    return newPoint;
  }//makeRandomPoint

  
  void setArea() {
    area = 0;
    for (int p=0; p < numPoints; p++) {
      PVector p0 = points.get(p);
      PVector p1;
      if (p < numPoints - 1) {
        p1 = points.get(p+1);
      }
      else {
        p1 = points.get(0);
      }
      area+= (p0.x * p1.y) - (p1.x * p0.y);
    }//loop over points
    area = area/2;
  }//setArea

  void setCentroid() {
    float sumX = 0;
    float sumY = 0;
    for (int i=0; i < numPoints; i++) {
      PVector p0 = points.get(i);
      PVector p1;
      //use point 0 if at the end of the list.
      if (i == numPoints - 1) {
        p1 = points.get(0);
      }
      else {
        p1 = points.get(i+1);
      }
      sumX += (p0.x + p1.x) * ((p0.x * p1.y) - (p1.x * p0.y));
      sumY += (p0.y + p1.y) * ((p0.x * p1.y) - (p1.x * p0.y));
    }
    centroid = new PVector(sumX / (6*area), sumY / (6*area));
  }//setCentroid

  void setSize(int s){
    this.shapeSize = s;
  }

}//PathShape
