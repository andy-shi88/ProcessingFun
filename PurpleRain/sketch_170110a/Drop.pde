class Drop{
  float x = random(0, width);
  float y = random(-200, -100);
  float z = random(1, 4);
  float _length = random(10, 20);
  float y_speed = random(1, 3);
 
  Drop(){
  
  }
  
  
  private void show() {
    if(this.IsOutOfFrame()){
      this.y = random(-100, -200);
    }else {
      strokeWeight(this.z);
      stroke(138, 43, 226);
      line(this.x, this.y, this.x, this.y+this._length);
    }
  }
  
  
  private boolean IsOutOfFrame() {
    boolean result = false;
    if(this.y > height) {
      result = true;
    }else {
      result = false;
    }
   return result;
  }
  
  private void fall() {
    this.y = this.y + this.y_speed;
  }
}