class Ball{
  float x,y,r,xs,ys;//変数sはspeed
  color c;
  boolean hit;
  
  Ball(float x_, float y_, float r_){
    x = x_;
    y = y_;
    r = r_;
    xs = 2;
    ys = 2;
    c = color(255,255,255);
    hit = false;
  }
  
  void display(){
    fill(c);
    circle(x,y,r);
  }
  
  void move(){
    x += xs;
    y += ys;
  }
  
  void edge(){
    if(x + r/2 > width || x - r/2 < 0) xs *= -1;// 左右の壁に当たる時
    if(y - r/2 < 0) ys *= -1;// 上の壁に当たる時
  }
  
  void hit(Bar bar){
  if(!hit && x + r/2 > bar.x && bar.x - r/2 < bar.x + bar.w &&
      bar.y < y + r/2 && y + r/2 < bar.y + bar.h){
    ys *= -1;
  }
 }
 
 boolean isHit(Bar bar){
   if(!hit && x + r/2 > bar.x && bar.x - r/2 < bar.x + bar.w &&
     bar.y < y + r/2 && y + r/2 < bar.y + bar.h){
        hit = true;
        return true;
      }else{
        hit = false;
        return false;
      }
    }
}
