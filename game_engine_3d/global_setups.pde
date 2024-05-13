mesh meshCube = new mesh();
mat4x4 projectionMatrix = new mat4x4();
mat4x4 zRotMat = new mat4x4();
mat4x4 xRotMat = new mat4x4();

PVector camera = new PVector(0,0,0);

float xtheta=0, ztheta=0;

final float screenWidth = 1280.0f;
final float screenHeight = 720.0f;

float tx = 0;
float ty = 0;
float tz = 50;
