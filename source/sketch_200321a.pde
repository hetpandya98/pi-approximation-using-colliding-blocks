int collisions = 0;
int digits = 4;
int steps = 6000;
boolean doneColliding = false;
long startTime = -1, endTime;

class CreateBox{
  float x, y, w, h, m, v;
  CreateBox(float x, float y, float w, float h, float m, float v){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.m = m;
    this.v = v;
  }
  void DrawBox(){
    fill(102, 153, 255);
    rect(this.x, this.y, this.w, this.h);
  }
  void Update(){
    this.x-=this.v;   
  }
  void CheckCollison(float x, float y, float w, float h, float m, float v){
    if(this.x <= 0){
      this.v = -this.v;
      collisions++;
    }
    if(this.x + this.w >= x && this.x <= x + w){
      float u1=this.v;
      float u2=v;
      collisions++;
      this.v = ((this.m - m) * u1) / (this.m + m) + (2 * m * u2) / (this.m + m);
      b2.v = (2 * this.m * u1) / (this.m + m) + ((m - this.m) * u2) / (this.m + m);
    }
  }
}

CreateBox b1 = new CreateBox(400, 650, 50, 50, 1, 0);
CreateBox b2 = new CreateBox(700, 600, 100, 100, (int)Math.pow(100,digits), 5/(float)steps);


void setup(){
  size(1800, 700);
}
 
void draw(){ 
  background(0,0,0);
  for(int i = 0; i < steps; i++){
    b1.Update();
    b2.Update();
    b1.CheckCollison(b2.x,b2.y,b2.w,b2.h, b2.m, b2.v);
    textSize(32);
    text("Collisions:", 300, 200);
    text(collisions, 470, 200);
  }
  b1.DrawBox();
  b2.DrawBox();
  if(b1.v < 0 && b2.v < 0 && b1.v > b2.v && startTime==-1){
    doneColliding = true;
    startTime = System.currentTimeMillis();
  }
  if(doneColliding){
    endTime = System.currentTimeMillis();
    if(endTime-startTime>10000){
      exit();
    }
  }
}
