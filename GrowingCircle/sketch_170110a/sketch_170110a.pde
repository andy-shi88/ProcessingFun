//coding challenge growing circles

ArrayList<Circle> circles;
int n_circles = 800;
int counter = 0;
void setup() {
//  size(1366, 720);
fullScreen();
  circles = new ArrayList<Circle>();  
  frameRate(20);
}

void draw() {
  background(0);
  if(counter < n_circles) {
    //check position
    float newX = random(0, width);
    float newY = random(0, height);
    boolean isValid = true;
    for(Circle c: circles){
      float distance = dist(newX, newY, c.x, c.y);
      if(distance < c.rad + 5){
          isValid = false;
          break;
      }
    }
    if(isValid){
      circles.add(new Circle(newX, newY));
      counter++;
    }
    
  }
  for (Circle c : circles) {
    //check colision
    boolean isCollide = false;
    for (Circle cc: circles) {
      if (cc != c) {
        float distance = dist(c.x, c.y, cc.x, cc.y);
        if(distance < c.rad + cc.rad) {
          isCollide = true;
          break;
        }
      }
    }
    if(!isCollide) {
      c.grow();
    }else{
      c.rad = 1;
    }
    c.show();
  }
}