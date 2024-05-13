triangle scaleTriangle(triangle t, float sX, float sY, float sZ){
  PVector vOut0 = new PVector(0,0,0);
  PVector vOut1 = new PVector(0,0,0);
  PVector vOut2 = new PVector(0,0,0);
  
  PVector v0 = t.vertices.get(0);
  PVector v1 = t.vertices.get(1);
  PVector v2 = t.vertices.get(2);
  
  vOut0.x = v0.x*sX; vOut0.y = v0.y*sY; vOut0.z = v0.z*sZ;
  vOut1.x = v1.x*sX; vOut1.y = v1.y*sY; vOut1.z = v1.z*sZ;
  vOut2.x = v2.x*sX; vOut2.y = v2.y*sY; vOut2.z = v2.z*sZ;
  
  
  triangle tScaled = new triangle(vOut0, vOut1, vOut2);
  
  return tScaled;
}

triangle rotateTriangle(triangle t){
  PVector vOut0 = new PVector(0,0,0);
  PVector vOut1 = new PVector(0,0,0);
  PVector vOut2 = new PVector(0,0,0);
  
  PVector v0 = t.vertices.get(0);
  PVector v1 = t.vertices.get(1);
  PVector v2 = t.vertices.get(2);
  
  vOut0 = MatrixVectorMultiplication(v0, zRotMat);
  vOut1 = MatrixVectorMultiplication(v1, zRotMat);
  vOut2 = MatrixVectorMultiplication(v2, zRotMat);
  
  vOut0 = MatrixVectorMultiplication(vOut0, xRotMat);
  vOut1 = MatrixVectorMultiplication(vOut1, xRotMat);
  vOut2 = MatrixVectorMultiplication(vOut2, xRotMat);
  
  
  triangle tRotated = new triangle(vOut0, vOut1, vOut2);
  
  return tRotated;
}

triangle translateTriangle(triangle t, float tx, float ty, float tz) {
  PVector vOut0 = new PVector(0,0,0);
  PVector vOut1 = new PVector(0,0,0);
  PVector vOut2 = new PVector(0,0,0);
  
  PVector v0 = t.vertices.get(0);
  PVector v1 = t.vertices.get(1);
  PVector v2 = t.vertices.get(2);
  
  vOut0.x = v0.x + tx ; vOut0.y = v0.y + ty ; vOut0.z = v0.z + tz;
  vOut1.x = v1.x + tx ; vOut1.y = v1.y + ty ; vOut1.z = v1.z + tz;
  vOut2.x = v2.x + tx ; vOut2.y = v2.y + ty ; vOut2.z = v2.z + tz;
  
  triangle tTranslated = new triangle(vOut0, vOut1, vOut2);
  
  return tTranslated;
}
