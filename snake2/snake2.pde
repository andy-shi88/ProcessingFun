Snake player;
Food food;
PFont f;
int score = 0;

void setup() {
  frameRate(13);
  size(400, 400);
  player = new Snake(100, 100);  
  f = createFont("Arial",25,true);
  food = new Food();
  food.setLocation();
}

void draw() {
  background(0);
  if(checkCollision()) {
    //score increment
    score += food.score;
    //set food new location
    food.foodCount+=1;
    if(food.foodCount > 5) {//fixable code
      food.foodCount =0;
    }
    food.setLocation();
    //add tail
    player.addTail();
  }
  player.update();
  //check player condition
  if(player.death) {
    //stop moving
    //player.dir(Constants.DIR_STOP);
    //reset game
    player.resetSnake();
    score = 0;
    player.death = false;
  }
  //draw on window
  textFont(f, 25);
  text("score: " + score, width - 200, 40);
  player.show(); //<>//
  food.show();
  
}

public void mouseClicked() {
    player.addTail();
}

void keyPressed() {
  if(keyCode == UP) {
    if(player.curr_dir != Constants.DIR_DOWN)
      player.dir(Constants.DIR_UP);
  } else if (keyCode == RIGHT) {
    if(player.curr_dir != Constants.DIR_LEFT)
      player.dir(Constants.DIR_RIGHT);
  } else if (keyCode == DOWN) {
    if(player.curr_dir != Constants.DIR_UP)
      player.dir(Constants.DIR_DOWN);
  } else if (keyCode == LEFT) {
    if(player.curr_dir != Constants.DIR_RIGHT)
      player.dir(Constants.DIR_LEFT);
  }
}

boolean checkCollision() {
    boolean result = false;
    PVector foodLoc = food.getLocation();
    float distance = dist(player.getX(), player.getY(),foodLoc.x, foodLoc.y);
    if(distance < 1) {
      result = true;
    }
    return result;
}