class Star {
  float x;
  float y;
  float z;
  float pz;
  float speed = 6;
  
  public Star() {
    this.x = random(0, width);
    this.y = random(0, height);
    this.z = random(width/2);
    this.pz = this.z;
  }
  
  public void update(){
     this.z -= this.speed;
     
     if(z < 1) {
       this.x = random(-width/2, width/2);
      this.y = random(-height/2, height/2);
      this.z = width/2;
      this.pz = z;
     }
    
  }
  
  public void show() {
    fill(255);
    noStroke();
    float sx = map(this.x / z, 0, 1, 0, width/2);
    float sy = map(this.y / z, 0, 1, 0, height/2);
    float r = map(this.z, 0, width/2, 8, 0);
    ellipse(sx, sy, r, r);
    //drawing tail
    float px = map(this.x / pz, 0, 1, 0, width/2);
    float py = map(this.y / pz, 0, 1, 0, height/2);;
    this.pz = this.z;
     
    stroke(255);
    line(px, py, sx, sy);
    
  }
  
  
  
}