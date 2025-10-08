class Bar{
  float x,y,w,h;
  
  Bar(float x_,float y_,float w_,float h_){
    x = x_;
    y = y_;
    w = w_;
    h = h_;
  }
  
  void display(){
    rect(x,y,w,h);
  }
  
  void move(){
    if(keyPressed == true){ //キーが押されたとき
    if(keyCode == LEFT) x -= 4;
    if(keyCode == RIGHT) x += 4;
    }
  }
}
