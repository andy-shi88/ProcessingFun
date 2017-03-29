class Snake {
  public int curr_dir = Constants.DIR_RIGHT;
  private int x;
  private int y;
  private int xspeed;
  private int yspeed;
  private int scl;
  private int total = 1;
  private ArrayList<PVector> tail;
  public boolean death = false;
  
  public Snake(int x, int y) {
    this.x = x;
    this.y = y;
    this.xspeed = 1;
    this.yspeed = 0;
    this.scl = 10;
    this.tail = new ArrayList<PVector>();
    this.tail.add(new PVector(this.x + (this.xspeed * this.scl * -1), this.y + (this.yspeed * scl * -1)));
  }
  public void resetSnake() {
    this.total = 1;
    this.x = 100;
    this.y = 100;
    this.curr_dir = Constants.DIR_RIGHT;
    this.xspeed = 1;
    this.yspeed = 0;
    this.scl = 10;
    this.tail = new ArrayList<PVector>();
    this.tail.add(new PVector(this.x + (this.xspeed * this.scl * -1), this.y + (this.yspeed * scl * -1)));
  }
  public void checkDeath() {
    for(int i = 0; i < total - 1; i++) {
      float distance = dist(this.x, this.y, this.tail.get(i).x, this.tail.get(i).y);
      if(distance < 1) {
         this.death = true; 
      } 
    }
  }
  
  //getter
  public int getX() {
    return this.x;
  }
  public int getY() {
    return this.y;
  }

  public void addTail() {
    this.total++;
    System.out.println(this.total);
    if(this.tail.size() < 1) {
      this.tail.add(new PVector(this.x + (this.xspeed * this.scl * -1), this.y + (this.yspeed * scl * -1)));
    }else {
      PVector lastTail = this.tail.get(this.tail.size() - 1);
      this.tail.add(new PVector(lastTail.x + (this.xspeed * this.scl * -1), lastTail.y + (this.yspeed * scl * -1)));
    }
  }
  
  public void update () {
    //moving the rest of the tail //<>//
    for (int i = this.total - 1; i >= 1; i--) {
        this.tail.get(i).x = this.tail.get(i-1).x;
        this.tail.get(i).y = this.tail.get(i-1).y;
    }
    //move first tail
    this.tail.get(0).x  = this.x;
    this.tail.get(0).y = this.y;
    //get next head location
    int nextX = this.x + this.xspeed * this.scl;
    int nextY = this.y + this.yspeed * this.scl;
    //check head location
    if(nextX > width) { //goback to left most (x = 0)
      nextX = 0;
    } else if (nextX < 0) { //go to x == width of window
       nextX = width - this.scl;
    }else if (nextY < 0) { //go to top of window
       nextY = height - this.scl;
    }else if (nextY > height) { //go to x == width of window
       nextY = 0;
    }
    //move head
    this.x = nextX;
    this.y = nextY;
    
    //check death condition
    checkDeath(); //<>// //<>// //<>//
  }
  
  public void show() {
    fill(255);
    rect(this.x, this.y, this.scl, this.scl);
    for (int i = 0; i < this.total - 1; i++ ) {
      rect(this.tail.get(i).x, this.tail.get(i).y, this.scl, this.scl);
    }
  }
  
  public void dir(int direction) {
    if(direction == Constants.DIR_UP) {
        this.curr_dir = Constants.DIR_UP;
        this.xspeed = 0;
        this.yspeed = -1;
    } else if (direction == Constants.DIR_RIGHT) {
        this.curr_dir = Constants.DIR_RIGHT;
        this.xspeed = 1;
        this.yspeed = 0;
    }else if (direction == Constants.DIR_DOWN) {
        this.curr_dir = Constants.DIR_DOWN;
        this.xspeed = 0;
        this.yspeed = 1;
    }else if (direction == Constants.DIR_LEFT) {
        this.curr_dir = Constants.DIR_LEFT;
        this.xspeed = -1;
        this.yspeed = 0;
    }else if (direction == Constants.DIR_STOP) {
        this.curr_dir = Constants.DIR_STOP;
        this.xspeed = 0;
        this.yspeed = 0;
    }
  }
}