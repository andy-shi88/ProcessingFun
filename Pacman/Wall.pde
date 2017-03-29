class Wall {
  PVector loc;
  //size of wall
  private int wall_size = 32;
  //collision point of wall, (center of wall)
  public PVector col_point;
  
  
  public Wall(PVector loc) {
    this.loc = loc;
  }
  
  public void show() {
    fill(100, 60, 150);
    rect(this.loc.x, this.loc.y, this.wall_size, this.wall_size);
    this.col_point = new PVector((int) this.loc.x + floor(wall_size / 2), (int) this.loc.y + floor(wall_size / 2));
  }
  
  public boolean isCollided(Player player) {
    PVector pcp = player.col_point;
    if(pcp.x + 16 > this.col_point.x - 16) { //left side collision
      return true;
    }else if (pcp.x - 16 < this.col_point.x + 16) { //right side collision
      return true;
    }else if (pcp.y + 16 > this.col_point.y - 16) { //bottom side collision
      return true;
    }else if (pcp.y - 16 < this.col_point.y + 16) { //top side collision
      return true;
    }else {
      return false;
    }
  }
  
}