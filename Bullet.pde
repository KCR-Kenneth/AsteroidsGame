class Bullet extends Floater {
  public Bullet() {
    super(50,0);
    myX = MC.getX();
    myY = MC.getY();
    myZ = MC.getZ();
    xV = 50 * cos(MC.getzO());
    yV = 50 * sin(MC.getzO());
  }
  
  public void checkBoundary(int i) {
    if (myX > 1000 || myX < -1000 || myY > 1000 || myY < -1000 || myZ > 1000 || myZ < -1000) {
      france.remove(i);
    }
  }
  
  public void move() {
    myX += xActual[direction];
    myY += yV;
    myZ += zActual[direction];
  }
  
  public void show() {
    pushMatrix();
      translate(myX, myY, myZ);
      fill(255,255,0);
      sphere(10);
    popMatrix();
  }
}
