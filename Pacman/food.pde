class Food { 
  PVector loc;
  private int size = 8;
  public int score = 2;
  public boolean eaten = false;
  
  public Food(PVector loc) {
    this.loc = loc;
  }
  
  public void show() {
    fill(255);
    ellipse(this.loc.x, this.loc.y, this.size, this.size);
  }    
  public void hide() {
    fill(0);
    ellipse(this.loc.x, this.loc.y, this.size, this.size);
  }
  
}