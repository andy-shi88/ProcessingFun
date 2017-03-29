class Circle {
  float rad = 1;
  float x ;
  float y ;
  float growth = 1;
  
  Circle(float _x, float _y) {
      this.x = _x;
      this.y = _y;
  }
  
  private void show() {
    noFill();
    stroke(255);
    if(this.checkEdges()){
      //this.growth = 0;
      this.rad = 1;
    } 
    ellipse(this.x, this.y, this.rad*2, this.rad*2);
  }
  
  private void grow() {
    this.rad += this.growth;
  }
  
  private boolean checkEdges() {
    boolean result = false;
    if((this.x + this.rad) > width || (this.x - this.rad) < 0 || (this.y - this.rad) < 0 || (this.y + this.rad) > height){
      result = true;
    }
    return result;
  }
  
  
}