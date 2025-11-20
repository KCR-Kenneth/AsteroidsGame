class Floater {
  //I Apologize for rewriting (or just starting from scratch) the Floater class... but I kinda have to
  // for 3D... sorry!
  protected float myX, myY, myZ, xV, yV, zV, accel, xR, yR, zR, xO, yO, zO;
  protected int myC, surfaces;
  protected float[] xActual, zActual;
  
  public Floater(float vS, float rS) {
    myX = (float)(Math.random()*2000-1000);
    myY = (float)(Math.random()*2000-1000);
    myZ = (float)(Math.random()*2000-1000);
    xV = (float)(Math.random()*vS-vS/2);
    yV = (float)(Math.random()*vS-vS/2);
    zV = (float)(Math.random()*vS-vS/2);
    xR = (float)(Math.random()*rS-rS/2);
    yR = (float)(Math.random()*rS-rS/2);
    zR = (float)(Math.random()*rS-rS/2);
    xO = 0;
    yO = 0;
    zO = 0;
    xActual = new float[4];
    zActual = new float[4];
  }
  
  public void move() {
    myX += xV;
    myY += yV;
    myZ += zV;
  }
  
  public void turn() {
    xO += xR;
    yO += yR;
    zO += zR;
  }
  
  public void checkBoundary() {
    if (myX > 1000) {
      myX = -1000;
    } else if (myX < -1000) {
      myX = 1000;
    }
    if (myY > 1000) {
      myY = -1000;
    } else if (myY < -1000) {
      myY = 1000;
    }
    if (myZ > 1000) {
      myZ = -1000;
    } else if (myZ < -1000) {
      myZ = 1000;
    }
  }
  
  public void show() {
    
  }
  
  public float getX() {
    return myX;
  }
  public float getY() {
    return myY;
  }
  public float getZ() {
    return myZ;
  }
  
  public void setC(int c) {
    myC = c;
  }
}
