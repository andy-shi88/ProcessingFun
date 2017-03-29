Player player1;
Map map;
int wall_thickness = 8;
/*map value 
* 0: food
* 1: wall
* 2: path
*/
int[][] map_value = {{1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
                  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                  {1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1},
                  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1},
                  {1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1},
                  {1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1}, 
                  {1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
                  {0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0},
                  {1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
                  {1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1},
                  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1}, 
                  {1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 0, 1, 0, 1, 1},
                  {1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1},
                  {1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1},
                  {0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0},
                  {1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1}, 
                  {1, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 1},
                  {1, 0, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1, 1},
                  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1},
                  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1}};

PFont f;
int score;
void setup() {
  //frameRate(8);
  f = createFont("Arial",25,true);
  score = 0;
  size(640, 640);
  player1 = new Player();
  //initialize map
  map = new Map(map_value);
  //adding food
}

void draw() {
  background(0);
  //draw map
  map.show();
  //draw player
  player1.update();
  player1.show();
  if(isCollideWall()) {
    player1.dir(Constants.DIR_STOP);
    player1.reposition();
  }
  checkCollideFood();
  
  //draw on window
  textFont(f, 25);
  fill(0);
  text("score: " + score, width - 200, 23);
}

boolean isCollideWall() {
  ArrayList<Wall> temp_walls = map.getWall();
  for(int i = 0; i < temp_walls.size(); i++) {
    if(temp_walls.get(i).isCollided(player1)) {
      return true;
    }
  }
  return false;
}

void checkCollideFood() {
  ArrayList<Food> temp_foods = map.getFood();
  for(int i = 0; i < temp_foods.size(); i++) {
    if(checkFoodCollision(player1, temp_foods.get(i))) { //if food and player collided
       score+= temp_foods.get(i).score; //increment score
       map.removeFood(i);
      break;
    }
  }
}

boolean checkWallCollision(Player player, Wall wall) {
  float distance = dist(player.col_point.x, player.col_point.y, wall.col_point.x, wall.col_point.y);
  if(distance < 32) {
    return true;
  } else {
    return false;
  }
}

boolean checkFoodCollision(Player player, Food food) {
  float distance = dist(player.col_point.x, player.col_point.y, food.loc.x, food.loc.y);
  if(distance <= 14) {
    return true;
  } else {
    return false;
  }
}

void keyPressed() {
  if(keyCode == UP) {
    //x%32 have to be 0 for vertical turn
    if(player1.canTurnVertical()) {
      player1.dir(Constants.DIR_UP);
    }
  } else if (keyCode == RIGHT) {//y%32 have to be 0 for horizontal turn
    if(player1.canTurnHorizontal()) {
      player1.dir(Constants.DIR_RIGHT);
    }
  } else if (keyCode == DOWN) {
    if(player1.canTurnVertical()) {
      player1.dir(Constants.DIR_DOWN);
    }
  } else if (keyCode == LEFT) {
    if(player1.canTurnHorizontal()) {
      player1.dir(Constants.DIR_LEFT);
    }
  }
}