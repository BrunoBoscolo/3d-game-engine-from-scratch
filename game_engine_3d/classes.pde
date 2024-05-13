// Classes

public class vec3d {
  public float x;
  public float y;
  public float z;
  
  public vec3d(float x, float y, float z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
}

public class triangle {
  public ArrayList<PVector> vertices;
  
  public int red;
  public int green;
  public int blue;
  
  public triangle(PVector v1, PVector v2, PVector v3) {
    vertices = new ArrayList<PVector>();
    vertices.add(v1);
    vertices.add(v2);
    vertices.add(v3);
  }
  
  public float getMedianZ() {
    float medianZ = 0.0f;
    for (PVector vertex : vertices) {
        medianZ += vertex.z;
    }
    return medianZ / vertices.size();
  }
    
}

public class mesh {
  public ArrayList<triangle> tris;
  
  boolean loadObjectFile(String filename){

  ArrayList<PVector> vertexes = new ArrayList<PVector>();
    
    try {
        BufferedReader reader = new BufferedReader(new FileReader(filename));
        String line;

        while (reader.ready()) {
            line = reader.readLine();
            String[] pieces = line.trim().split("\\s+");
            
            if (pieces[0].equals("v")) {
                PVector vector = new PVector(0,0,0);
                vector.x = Float.parseFloat(pieces[1]);
                vector.y = Float.parseFloat(pieces[2]);
                vector.z = Float.parseFloat(pieces[3]);
                vertexes.add(vector);
            }
            
            if (pieces[0].equals("f")) {
                int v1Index = Integer.parseInt(pieces[1]) - 1;
                int v2Index = Integer.parseInt(pieces[2]) - 1;
                int v3Index = Integer.parseInt(pieces[3]) - 1;
                
                PVector v1 = vertexes.get(v1Index);
                PVector v2 = vertexes.get(v2Index);
                PVector v3 = vertexes.get(v3Index);
                
                tris.add(new triangle(v1, v2, v3)); // Add the triangle to the tris ArrayList of the mesh
                  }
              }
              reader.close();
              
          } catch (Exception e) {
              println("Error loading object file: " + e.getMessage());
              return false;
          }
          
          return true;
      }    
      
  public mesh() {
    tris = new ArrayList<triangle>();
  }
  
  public void addTriangle(triangle t){
    tris.add(t);
  }
  
  public void printMesh() {
        println("Mesh contains " + tris.size() + " triangles:");
        for (int i = 0; i < tris.size(); i++) {
            println("Triangle " + (i + 1) + ": " + tris.get(i));
        }
    }

}

public class mat4x4 {
    public float[][] matrix;

    // Constructor to initialize the matrix
    public mat4x4() {
        matrix = new float[4][4];
        // Initialize all values as 0
        for (int i = 0; i < 4; i++) {
            for (int j = 0; j < 4; j++) {
                matrix[i][j] = 0.0f;
            }
        }
    }
    
    public float get(int row, int col) {
        if (row >= 0 && row < 4 && col >= 0 && col < 4) {
            return matrix[row][col];
        } else {
            println("Invalid row or column index.");
            return 0.0f; // Return 0 if the indices are invalid
        }
    }

    // Method to set the value of a specific element in the matrix
    public void set(int row, int col, float value) {
        if (row >= 0 && row < 4 && col >= 0 && col < 4) {
            matrix[row][col] = value;
        } else {
            println("Invalid row or column index.");
        }
    }
}
