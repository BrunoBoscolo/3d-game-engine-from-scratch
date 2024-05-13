void drawTriangleOutline(triangle t) {
  PVector v0 = t.vertices.get(0);
  PVector v1 = t.vertices.get(1);
  PVector v2 = t.vertices.get(2);

  stroke(t.red, t.green, t.blue);
  triangle(v0.x, v0.y, v1.x, v1.y, v2.x, v2.y);
  stroke(0);
  line(v0.x, v0.y, v1.x, v1.y);
  line(v1.x, v1.y, v2.x, v2.y);
  line(v2.x, v2.y, v0.x, v0.y);
}

void drawTriangleFill(triangle t) {
  PVector v0 = t.vertices.get(0);
  PVector v1 = t.vertices.get(1);
  PVector v2 = t.vertices.get(2);
  
  fill(255);
  stroke(t.red, t.green, t.blue);
  line(v0.x, v0.y, v1.x, v1.y);
  line(v1.x, v1.y, v2.x, v2.y);
  line(v2.x, v2.y, v0.x, v0.y);
}

void rasterizeTriangle(triangle t) {
  PVector v0 = t.vertices.get(0);
  PVector v1 = t.vertices.get(1);
  PVector v2 = t.vertices.get(2);
  
  triangle(v0.x, v0.y, v1.x, v1.y, v2.x, v2.y);
  fill(255);
} 
