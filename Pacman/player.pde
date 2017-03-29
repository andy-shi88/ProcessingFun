class Player {
  private PVector loc;
  private PVector col_point;
  private PImage images[];
  private String image_path  = "sprite/pacman/";
  private String image_direction;
  private String image_prefix = "pacman-sprite_sheets_";
  private String image_format = ".png";
  private int image_count = 18;
  public int image_size = 32;
  Animation play_animate;
  Animation an_right;
  Animation an_down;
  Animation an_left;
  Animation an_up;
  public int curr_dir = Constants.DIR_RIGHT;
  private int xspeed = 1;
  private int yspeed = 0;
  private int scl;
  
  public Player() {
    this.generate();
  }
  
  public boolean canTurnHorizontal() {
    if(this.loc.y % 32 ==0) {
      return true;
    }else {
      return false;
    }
  }
  public boolean canTurnVertical() {
    if(this.loc.x % 32 ==0) {
      return true;
    }else {
      return false;
    }
  }
  
  
  public void reposition() {
    if(this.curr_dir == Constants.DIR_RIGHT || this.curr_dir == Constants.DIR_LEFT) {
      this.loc.x = round(this.loc.x / 32) * 32;
      System.out.println(this.loc.x);
      this.col_point.x = this.loc.x + 16;
    } else if (this.curr_dir == Constants.DIR_DOWN || this.curr_dir == Constants.DIR_UP) {
      this.loc.y = round(this.loc.y / 32) * 32; //<>//
      this.col_point.y = this.loc.y + 16;
    }
    System.out.println(this.loc.x + ", " + this.loc.y);
    
  }
  
  private void generate() {
    this.loc = new PVector(32, 32);
    this.col_point = new PVector(32 + 16, 32 + 16); //fix later
    this.an_right = new Animation(this.image_path + "right/" + this.image_prefix, this.image_count);
    this.an_down = new Animation(this.image_path + "down/" + this.image_prefix, this.image_count);
    this.an_left = new Animation(this.image_path + "left/" + this.image_prefix, this.image_count);
    this.an_up = new Animation(this.image_path + "up/" + this.image_prefix, this.image_count);
    this.image_direction = "up";
    this.scl = loadImage(this.image_path + "right/" + this.image_prefix + "01.png").width;
    this.play_animate = this.an_right;
  }
  
  public void update() {
    this.loc.x += this.xspeed;
    this.loc.y += this.yspeed;
    this.col_point.x += this.xspeed;
    this.col_point.y += this.yspeed;
  }
  
  public void show() {
    play_animate.display(this.loc.x, this.loc.y);
  }
  
  public void dir(int direction) {
     if(direction == Constants.DIR_UP) {
        this.curr_dir = Constants.DIR_UP;
        this.xspeed = 0;
        this.yspeed = -1;
        this.play_animate = this.an_up;
    } else if (direction == Constants.DIR_RIGHT) {
        this.curr_dir = Constants.DIR_RIGHT;
        this.xspeed = 1;
        this.yspeed = 0;
        this.play_animate = this.an_right;
    }else if (direction == Constants.DIR_DOWN) {
        this.curr_dir = Constants.DIR_DOWN;
        this.xspeed = 0;
        this.yspeed = 1;
        this.play_animate = this.an_down;
    }else if (direction == Constants.DIR_LEFT) {
        this.curr_dir = Constants.DIR_LEFT;
        this.xspeed = -1;
        this.yspeed = 0;
        this.play_animate = this.an_left;
    }else if (direction == Constants.DIR_STOP) {
        //this.curr_dir = Constants.DIR_STOP;
        this.xspeed = 0;
        this.yspeed = 0;
    }
  }
  
}