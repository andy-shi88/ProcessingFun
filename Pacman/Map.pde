class Map {
  private int[][] map_value;
  private ArrayList<Wall> walls;
  private ArrayList<Food> foods;
  
  public Map(int[][] map_array) {
    this.map_value = map_array;
    //initialize map array
    this.walls = new ArrayList<Wall>();
    //initialize food array
    this.foods = new ArrayList<Food>();
    //generate map / walls
    this.generateMap();
    //generate foods
    this.generateFood();
  }
  
  private void generateMap() {
    for(int i = 0; i < this.map_value.length; i++) {
      for(int j =0; j < this.map_value[0].length; j++) {
        if(this.map_value[i][j] == Constants.MAP_WALL) { //add wall
          this.walls.add(new Wall(new PVector(j*32, i*32)));
        }
      }
    }
  }
  private void generateFood() {
    for(int i = 0; i < this.map_value.length; i++) {
      for(int j =0; j < this.map_value[0].length; j++) {
        if(this.map_value[i][j] == Constants.MAP_FOOD) { //add wall
          this.foods.add(new Food(new PVector(j*32 + 16, i*32 + 16)));
        }
      }
    }
  }
  
  public ArrayList<Wall> getWall() {
    return this.walls;
  }
  
  public ArrayList<Food> getFood() {
    return this.foods;
  }
  public void show() {
    //draw wall
    for(int i = 0; i < this.walls.size(); i++) {
      this.walls.get(i).show();
    }
    //draw food
    for(int i = 0; i < this.foods.size(); i++) {
      this.foods.get(i).show();
    }
  }
  
  public void removeFood(int index) {
    this.foods.remove(index);
  }
  
}