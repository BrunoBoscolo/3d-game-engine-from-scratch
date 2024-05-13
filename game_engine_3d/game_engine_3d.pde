void setup(){
  size(1280,720);
  // Projection matrix parameters;
  float near = 0.1f;
  float far = 1000.0f;
  float fov = 90.0f;
  float aspectRatio = screenHeight/screenWidth;
  float fovRad = 1.0f / (tan((fov*0.5f)/(180.0f*3.14159f))); //FOV in radians
  
  // Projection matrix setup;
  projectionMatrix.set(0,0,(aspectRatio*fovRad));
  projectionMatrix.set(1,1,fovRad);
  projectionMatrix.set(2,2,(far/(far-near)));
  projectionMatrix.set(3,2,((-far*near)/(far-near)));
  projectionMatrix.set(2,3,1.0f);
  projectionMatrix.set(3,3,0.0f);
  
  //Mesh Setup
  
  meshCubeSetup("a");
  
  /*String filename = "C:/Users/bruno/Desktop/3d-engine-processing/game_engine_3d/objects/VideoShip.obj";
  boolean success = meshCube.loadObjectFile(filename);
  if (success) {
      println("Object file loaded successfully.");
      // Now, you can do something with the loaded data if needed
  } else {
      println("Failed to load object file: " + filename);
      meshCube.printMesh();
  }*/
 
}

void draw() {
  background(0);
  
  directionalLight(255, 255, 255, 0, 0, -1);
  translate(screenWidth/2, screenHeight, 0);
  
  if (keyPressed) {
    if (key == 'a' || key == 'A') {
      ztheta -= 0.1;
    }
    if (key == 'd' || key == 'D') {
      ztheta += 0.1;
    }
    if (key == 'w' || key == 'W') {
      xtheta -= 0.1;
    }
    if (key == 's' || key == 'S') {
      xtheta += 0.1;
    }
    if (key == 'z' || key == 'Z') {
      tz -= 1;
    }
    if (key == 'x' || key == 'X') {
      tz += 1;
    }
  }
  
  zRotationMatrixSetup(ztheta);
  xRotationMatrixSetup(xtheta);
  
  ArrayList<triangle> triangles = new ArrayList<>();
  
  for (triangle t : meshCube.tris) {
   meshProjectionSetup(t, triangles);
  }
  
  sortTrianglesByMedianZ(triangles);
  
  for (triangle t : triangles) {
   rasterizeTriangle(t);
  }
  
  
 
}
