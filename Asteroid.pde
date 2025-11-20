class Asteroid extends Floater {
  protected float[][][] points;
  public Asteroid() {
    super(2, PI/64);
    myC = color(100,100,100);
    surfaces = 60;
    points = new float[surfaces][3][3];
    //Through surfaces
    for (int i = 0; i < surfaces; i++) {
      //Through planes
      for (int j = 0; j < 3; j++) {
        //Through coordinates
        for (int k = 0; k < 3; k++) {
          points[i][j][k] = (float)(Math.random()*40-20);
        }
      }
    }
  }
  
  public void move() {
    myX += xV;
    myY += yV;
    myZ += zV;
    turn();
  }
  
  public void show() {
    pushMatrix();
      translate(myX, myY, myZ);
      rotateX(xO);
      rotateY(yO);
      rotateZ(zO);
      fill(myC);
      stroke(20);
      //Through surfaces
      for (int i = 0; i < surfaces; i++) {
        beginShape();
          for (int j = 0; j < 3; j++) {
            vertex(points[i][j][0], points[i][j][1], points[i][j][2]);
          }
        endShape(CLOSE);
      }
      sphere(20);
      noStroke();
    popMatrix();
  }
}



