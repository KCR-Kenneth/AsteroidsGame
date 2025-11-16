class Floater {
  //I Apologize for rewriting (or just starting from scratch) the Floater class... but I kinda have to
  // for 3D... sorry!
  protected float myX, myY, myZ, xV, yV, zV, accel, rot;
  protected int myC;
  protected float[] xActual, zActual;
  
  public Floater() {
    myX = (float)(Math.random()*2000-1000);
    myY = (float)(Math.random()*2000-1000);
    myZ = (float)(Math.random()*2000-1000);
    xActual = new float[4];
    zActual = new float[4];
  }
  
  public void move() {
    myX += xActual[direction];
    myY += yV;
    myZ += zActual[direction];
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
  
  public void reAxis() {
    xActual[0] = xV;
    xActual[1] = -zV; 
    xActual[2] = -xV; 
    xActual[3] = zV;
    zActual[0] = zV;
    zActual[1] = xV; 
    zActual[2] = -zV; 
    zActual[3] = -xV;
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
}
