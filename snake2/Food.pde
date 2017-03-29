class Food {
  private PVector loc;
  public boolean isSpecial;
  public int foodCount = 0;
  private int foodSize = 10;
  public int score = 10;  
  
  public Food() {
    
  }
  
  public Food(int x, int y, boolean spec) { 
    this.loc = new PVector(x, y);
    this.isSpecial = spec;
  }
  
  //getter
  public PVector getLocation() {
    return this.loc;
  }
  
  public void setLocation() {
    int _x = (int) random(floor(width/foodSize));
    int _y = (int) random(floor(height/foodSize));
    this.loc = new PVector(_x * this.foodSize, _y * this.foodSize);
  }
  
  public Food (PVector loc, boolean spec) {
    this.loc = loc;
    this.isSpecial = spec;
  }
  
  public void show() {
   //special food
   if(foodCount > 4) {
     fill(255, 80, 20);
     this.score = 50;
   }else {//normal food
     fill(255);
     this.score = 10;
   }
   rect(this.loc.x, this.loc.y, this.foodSize, this.foodSize);
  }
  
  
}