Particle particles[][];
PImage bg;

void setup(){
  size(800, 500, P3D);
  bg = loadImage("trees.jpg");
  bg.resize(width, height);
  image(bg, 0, 0);
  //particles = new Particle[bg.width][bg.height];
  particles = new Particle[500][500];
  for(int i = 0; i < particles.length; i++){
    for(int j = 0; j < particles[0].length; j++){
       particles[i][j] = new Particle(new PVector(random(0, bg.width), random(0, bg.height), random(-500, 500))); 
    }
  }
   background(220);
}

void update(){
  for(int i = 0; i < particles.length; i++){
    for(int j = 0; j < particles[0].length; j++){
       particles[i][j].update(); 
    }
  }
}

void draw(){

 update(); 
 camera(width/2, height/2, 1000, // eyeX, eyeY, eyeZ
         width/2, height/2, 0, // centerX, centerY, centerZ
         0.0, 1.0, 0.0); // upX, upY, upZ
  for(int i = 0; i < particles.length; i++){
    for(int j = 0; j < particles[0].length; j++){
       particles[i][j].display(); 
    }
  }
 pushMatrix();
 noFill();
 translate(width/2, height/2, 0);
 //box(width, height, 1000);
 popMatrix();
}