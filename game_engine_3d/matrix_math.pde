PVector MatrixVectorMultiplication(PVector v, mat4x4 projMat) {
  PVector vOut = new PVector(0,0,0);
  
  vOut.x = (v.x * projMat.get(0, 0)) + (v.y * projMat.get(1, 0)) + (v.z * projMat.get(2, 0)) + (projMat.get(3, 0));
  vOut.y = (v.x * projMat.get(0, 1)) + (v.y * projMat.get(1, 1)) + (v.z * projMat.get(2, 1)) + (projMat.get(3, 1));
  vOut.z = (v.x * projMat.get(0, 2)) + (v.y * projMat.get(1, 2)) + (v.z * projMat.get(2, 2)) + (projMat.get(3, 2));
  float w = (v.x * projMat.get(0, 3)) + (v.y * projMat.get(1, 3)) + (v.z * projMat.get(2, 3)) + (projMat.get(3, 3));
  
  if(w!=0) { //We do not want a divison by 0
    vOut.x = vOut.x/w;
    vOut.y = vOut.y/w;
    vOut.z = vOut.z/w;
  }
  return vOut;
}

void xRotationMatrixSetup(float xtheta){
  xRotMat.set(0,0,1);
  xRotMat.set(1,1,cos(xtheta*0.5f));
  xRotMat.set(1,2,sin(xtheta*0.5f));
  xRotMat.set(2,1,-sin(xtheta*0.5f));
  xRotMat.set(2,2,cos(xtheta*0.5f));
  xRotMat.set(3,3,1);
}

void zRotationMatrixSetup(float ztheta){
  zRotMat.set(0,0,cos(ztheta*0.5f));
  zRotMat.set(0,1,sin(ztheta*0.5f));
  zRotMat.set(1,0,-sin(ztheta*0.5f));
  zRotMat.set(1,1,cos(ztheta*0.5f));
  zRotMat.set(2,2,1);
  zRotMat.set(3,3,1);
}
