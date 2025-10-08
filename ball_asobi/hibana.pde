class Spark{//ひとつの火花をあらわすクラス
  PVector position;//現在位置
  PVector move;//ランダムな方向をもつ（移動方向とスピードを表す）ベクトル
  float life = random(50,255);//ライフポイント（火花の寿命、透明度のようなもの）
  color col = color(128,random(107,255),186);//火花の色
  
  Spark(PVector position){//コンストラクタ //@param position 開始位置
    this.position = position.copy();// 渡された位置をコピーして保持
    move = PVector.random2D();// ランダムな方向を設定
    move.mult(random(5,25));// スピードをランダムに調整
  }
  
  void show(){
    fill(col,life);//色と寿命（透明度）を設定
    noStroke();//線なしで塗りつぶす
    circle(position.x, position.y, 3); //円を描画し火花を描く
  }
  
  void update(){//位置を更新
    position.add(move);//現在位置に移動量を加える
    move.mult(0.95);//だんだん減速させる
    life -= random(0,5);//寿命を少しずつ減らす（消えていく）
  }
  
  boolean isAlive(){//まだ生存しているかどうか
    return 0 <= life;
  }
}
