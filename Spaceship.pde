class Spaceship extends Floater {
  boolean accelerating;
  public Spaceship() {
    myX = 0;
    myY = 0;
    myZ = 0;
    xV = 0;
    yV = 0;
    accel = 0.1;
    accelerating = false;
    rot = 0;
    myC = color(100);
  }
  
  public void turn() {
    if (keyPressed) {
      if (key == 'a') {
        rot-=PI/128;
      }
      if (key == 'd') {
        rot+=PI/128;
      }
    }
  }
  
  public void accelerate() {
    if (keyPressed) {
      if (key == 'w') {
        xV-=cos(rot)*accel;
        yV-=sin(rot)*accel;
        accelerating = true;
      }
      if (key == 's') {
        xV+=cos(rot)*accel;
        yV+=sin(rot)*accel;
        accelerating = true;
      }
    }
  }
  
  public void hyperspace() {
    if (keyPressed && key == 'h') {
      xV = 0;
      yV = 0;
      zV = 0;
      direction = (int)(Math.random()*4);
      rot = (float)(Math.random()*2*PI);
      myX = (float)Math.random()*2000-1000;
      myY = (float)Math.random()*2000-1000;
      myZ = (float)Math.random()*2000-1000;
      background(255,255,255,50);
    }
  }
  
  public void show() {
    fill(myC);
    noStroke();
    pushMatrix();
    rotateZ(rot);
      beginShape();
        vertex(-25,-20,-5);
        vertex(50,0,-5);
        vertex(-15,0,5);
        vertex(-15,0,5);
      endShape(CLOSE);
      beginShape();
        vertex(-25,20,-5);
        vertex(50,0,-5);
        vertex(-15,0,5);
        vertex(-15,0,5);
      endShape(CLOSE);
      fill(0,0,255);
      sphere(10);
      if (accelerating) {
        fill(255,0,0);
        stroke(200,200,0);
        //Following function is NOT mine (refer to asteroids tab)
        translate (-15,10,0);
        rotateZ(PI/2);
        cylinder(10,1,20,10);
        translate (-20,0,0);
        cylinder(10,1,20,10);
        accelerating = false;
      }
    popMatrix();
  }
  
}
