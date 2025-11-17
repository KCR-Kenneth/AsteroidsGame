int direction = 0;
int oldD;
int tic = 0;
boolean rotating = false;
float orient = 0;
Spaceship MC = new Spaceship();
Floater[] ETObjects = new Floater[40];

void setup() {
  size(500,500,P3D);
  frameRate(120);
  for (int i = 0; i < ETObjects.length; i++) {
    ETObjects[i] = new Star();
  }
}

void draw() {
  background(0);
  translate(250,250,0);
  MC.show();
  /*if (rotating){
    if (direction == 0) {
      if (oldD == 3) {
        orient += PI/240;
      } else {
        orient -= PI/240;
      }
    } else if (direction == 1) {
      if (oldD == 0) {
        orient += PI/240;
      } else {
        orient -= PI/240;
      }
    } else if (direction == 2) {
      if (oldD == 1) {
        orient += PI/240;
      } else {
        orient -= PI/240;
      }
    } else if (direction == 3) {
      if (oldD == 2) {
        orient += PI/240;
      } else {
        orient -= PI/240;
      }
    }
    
    if (orient > 2*PI) {
      orient = 0;
    } else if (orient < 0) {
      orient = 2*PI;
    }
    
    if (orient > PI/2*direction-PI/240 && orient < PI/2*direction+PI/240 ) {
      rotating = false;
    }
    
    rotateY(orient);
    translate(MC.getX(), MC.getY(), MC.getZ());
  } else */{
    orient = PI/2*direction;
    rotateY(orient);
    translate(MC.getX(), MC.getY(), MC.getZ());
    MC.turn();
    MC.accelerate();
    MC.reAxis();
    MC.move();
    tic++;
    if (tic > 20){
      tic = 0;
    }
    if (keyPressed && tic == 20) {
      MC.hyperspace();
      oldD = direction;
      if (key == 'q') {
        direction--;
        rotating = true;
      }
      if (key == 'e') {
        direction++;
        rotating = true;
      }
      if (direction < 0) {
        direction = 3;
      } else if (direction > 3) {
        direction = 0;
      }
    }
  }
  
  decorate();
}

void decorate() {
  for (int i = 0; i < ETObjects.length; i++) {
    ETObjects[i].show();
  }
  pushMatrix();
    constructGrid(1000);
    rotateY(PI/2);
    constructGrid(1000);
    rotateY(PI/2);
    constructGrid(1000);
    rotateY(PI/2);
    constructGrid(1000);
    rotateX(PI/2);
    constructGrid(1000);
    rotateX(PI);
    constructGrid(1000);
  popMatrix();
}

// Following function makes a grid AFTER centered on 3D space AND rotation has been made
void constructGrid(int distance) {
  pushMatrix();
    stroke(0,255,0,30);
    strokeWeight(1);
    translate(0,0,-distance);
    for (int i = -distance; i <= distance; i+=100) {
      line(i,distance,i,-distance);
    }
    for (int i = -distance; i <= distance; i+=100) {
      line(-distance, i, distance, i);
    }
  popMatrix();
}

// Source: apex_nd on processing.org forums
// https://forum.processing.org/one/topic/draw-a-cone-cylinder-in-p3d.html
void cylinder(float top, float bottom, float h, int sides)
{
  pushMatrix();
  
  translate(0,h/2,0);
  
  float angle;
  float[] x = new float[sides+1];
  float[] z = new float[sides+1];
  
  float[] x2 = new float[sides+1];
  float[] z2 = new float[sides+1];
 
  //get the x and z position on a circle for all the sides
  for(int i=0; i < x.length; i++){
    angle = TWO_PI / (sides) * i;
    x[i] = sin(angle) * bottom;
    z[i] = cos(angle) * bottom;
  }
  
  for(int i=0; i < x.length; i++){
    angle = TWO_PI / (sides) * i;
    x2[i] = sin(angle) * top;
    z2[i] = cos(angle) * top;
  }
 
  //draw the bottom of the cylinder
  beginShape(TRIANGLE_FAN);
 
  vertex(0,   -h/2,    0);
 
  for(int i=0; i < x.length; i++){
    vertex(x[i], -h/2, z[i]);
  }
 
  endShape();
 
  //draw the center of the cylinder
  beginShape(QUAD_STRIP); 
 
  for(int i=0; i < x.length; i++){
    vertex(x[i], -h/2, z[i]);
    vertex(x2[i], h/2, z2[i]);
  }
 
  endShape();
 
  //draw the top of the cylinder
  beginShape(TRIANGLE_FAN); 
 
  vertex(0,   h/2,    0);
 
  for(int i=0; i < x.length; i++){
    vertex(x2[i], h/2, z2[i]);
  }
 
  endShape();
  
  popMatrix();
}


