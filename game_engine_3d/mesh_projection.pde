void meshProjectionSetup(triangle t, ArrayList<triangle> triangles) {
  // Rotate vertices
  
  triangle rotatedTriangle = rotateTriangle(t);
  
  // Translate vertices
  //triangle translatedTriangle = translateTriangle(rotatedTriangle, tx, ty, tz);
  PVector v0r = rotatedTriangle.vertices.get(0);
  PVector v1r = rotatedTriangle.vertices.get(1);
  PVector v2r = rotatedTriangle.vertices.get(2);
  
  v0r.z += tz; v1r.z+=tz; v2r.z+=tz;
  
  triangle translatedTriangle = new triangle(v0r,v1r,v2r);
  
  boolean isVisible  = NormalTriangle(translatedTriangle);
  
  if (isVisible==true) {
      int shading = getTriangleShading(translatedTriangle);
      
      translatedTriangle.red = shading;
      translatedTriangle.green = shading;
      translatedTriangle.blue = shading;
        
      // Project vertices using the projection matrix
      triangle projectedTriangle = new triangle(
      MatrixVectorMultiplication(translatedTriangle.vertices.get(0), projectionMatrix),
      MatrixVectorMultiplication(translatedTriangle.vertices.get(1), projectionMatrix),
      MatrixVectorMultiplication(translatedTriangle.vertices.get(2), projectionMatrix));
     
      projectedTriangle.red = translatedTriangle.red;
      projectedTriangle.green = translatedTriangle.green;
      projectedTriangle.blue = translatedTriangle.blue;
      
      //triangle scaledTriangle = scaleTriangle(projectedTriangle, 40, 40, 40);
      
      PVector v0 = projectedTriangle.vertices.get(0);
      PVector v1 = projectedTriangle.vertices.get(1);
      PVector v2 = projectedTriangle.vertices.get(2);
      
      v0.x +=1; v0.y+=1; v0.z+=1;
      v1.x +=1; v1.y+=1; v1.z+=1;
      v2.x +=1; v2.y+=1; v2.z+=1;
      
      v0.x *= (0.5*screenWidth);
      v1.x *= (0.5*screenWidth);
      v2.x *= (0.5*screenWidth);
      
      v0.y *= (0.5*screenHeight);
      v1.y *= (0.5*screenHeight);
      v2.y *= (0.5*screenHeight);
      
      triangle scaledTriangle = new triangle(v0,v1,v2);
      
      scaledTriangle.red = shading;
      scaledTriangle.green = shading;
      scaledTriangle.blue = shading;
      
      // Draw the projected triangle outline
      triangles.add(scaledTriangle);
    }
}
