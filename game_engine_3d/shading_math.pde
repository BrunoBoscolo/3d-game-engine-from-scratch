int getTriangleShading(triangle t) {
  PVector v0t = t.vertices.get(0);
  PVector v1t = t.vertices.get(1);
  PVector v2t = t.vertices.get(2);
  
  PVector line1 = new PVector(v0t.x, v0t.y, v0t.z);
  PVector line2 = new PVector(v0t.x, v0t.y, v0t.z);
  
  line1.x = v1t.x - v0t.x;
  line1.y = v1t.y - v0t.z;
  line1.z = v1t.z - v0t.z;
  
  line2.x = v2t.x - v0t.x;
  line2.y = v2t.y - v0t.z;
  line2.z = v2t.z - v0t.z;
  
  PVector pvNormal = line1.cross(line2);
  
  pvNormal.normalize();
  
  println("Normal values" + " " + pvNormal.x + " " + pvNormal.y + " " + pvNormal.z);
  
  PVector lightPvector = new PVector(0, 0, -1);
  
  lightPvector.normalize();
  
  println("Normal light" + " " + lightPvector.x + " " + lightPvector.y + " " + lightPvector.z);
  
  float dp = pvNormal.dot(lightPvector);
  
  println("Dp" + " " + dp);
  
  int shading = (int)(dp * 100) + 100;
  
  println("shading" + " " + shading);
  
  return shading;
}
