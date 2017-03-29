//purple rain challenge

ArrayList<Drop> d;
int total_rain = 500;
void setup() {
  size(800, 400);
  d = new ArrayList<Drop>();
  for (int i = 0; i < total_rain; i++){
    d.add(new Drop());
  }
}


void draw(){
  background(0);
  for (int i = 0; i < total_rain; i++){
    d.get(i).fall();
    d.get(i).show();
  }
}