ArrayList<Star> stars;
int n_stars = 500;


void setup() {
  stars = new ArrayList<Star>();
  size(800,600);
  for (int i = 0; i < n_stars; i++) {
    stars.add(new Star());
  }
}

void draw() {
  
  background(0);
  translate(width/2, height/2);
  for (int i = 0; i < n_stars; i++) {
    stars.get(i).update();
    stars.get(i).show();
  }
}