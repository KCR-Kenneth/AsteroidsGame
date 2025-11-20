class Star extends Floater{
  public Star() {
    super(0, 0);
    xV = 0;
    yV = 0;
    zV = 0;
    xR = 0;
    yR = 0;
    zR = 0;
    myC = color((int)(Math.random()*30+200), 200,200);
  }
  
  public void show() {
    pushMatrix();
      fill(myC);
      noStroke();
      translate(myX, myY, myZ);
      sphere(10);
    popMatrix();
  }
  
}
