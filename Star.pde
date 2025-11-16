class Star extends Floater{
  public Star() {
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
