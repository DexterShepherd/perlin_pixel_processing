class Particle{
   PVector loc, delta;
   float angle, step_size, noise_scale, noise_max;
   boolean outside;
   color col;
   
   Particle(PVector l){
     //loc = new PVector(random(0, width), random(0, height), random(-500, 500));
     loc = l;
     step_size = random(0.1, 3);
     noise_scale = 0.04; //change these to change the noise character
     noise_max = 10; //change this too
     outside = false;
     col = bg.get(int(loc.x), int(loc.y));
   }
   
   void update(){
     if(outside){
       loc = new PVector(random(0, bg.width), random(0, bg.height), random(-500, 500));
       col = bg.get(int(loc.x), int(loc.y));
       outside = false;
     }
     angle = noise(loc.x * noise_scale, loc.y * noise_scale, loc.z * noise_scale) * noise_max;
     delta = new PVector(cos(angle)*step_size, sin(angle) * step_size, cos(loc.z) * sin(loc.z) * step_size);
     loc.add(delta);
     
     if((loc.x < 0) || (loc.x > bg.width)){
       outside = true;
     }else if((loc.y < 0) || (loc.y > bg.height)){
       outside = true; 
     }
   }
   
   void display(){
     fill(col);
     noStroke();
     pushMatrix();
     translate(loc.x, loc.y, loc.z);
     box(1);
     popMatrix();
   }
}