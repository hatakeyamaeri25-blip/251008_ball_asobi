ArrayList<Firework> fireworks = new ArrayList<>();//花火をまとめて管理するリスト

Ball ball;
Bar bar;

void setup(){
  size(500,500);
  ball = new Ball(250,250,100);
  bar = new Bar(200,400,100,30);
}

void draw(){
  background(28,29,47);
  stroke(0);//図形の枠線を表示
  
  ball.move();//ボールを動かす
  ball.edge();//壁に当たるときの処理（跳ね返り）
  ball.hit(bar);//バーに当たった時の処理（反射）
  ball.display();//ボールの描画
  
  bar.move();//バーを動かす
  bar.display();//バーの描画
  
  if(ball.isHit(bar)){//バーに当たった時（trueの時）の処理
  ball.c = color(random(140,255),random(140,255),random(140,255));
  //いい感じの色合いの範囲をランダムで表示、当たるたびに変わる
  
  for(int i = 0; i < 5; i++){//花火を五つ追加してリストに追加
    fireworks.add(new Firework());//Firework()は花火一つ分の表示・動きを担当するクラス
  }
}
 
  ArrayList<Firework> liveFireworks = new ArrayList<>();
  // liveFireworks は「表示中の花火」だけを一時的に保存するリスト
  
  for (Firework firework : fireworks){// すべての花火を順番に更新・描画
    firework.update();// 花火の動きを更新
    firework.show();// 花火を画面に描画
    
    if (firework.isAlive()){// まだ消えていない花火だけを残す（isAlive() が true）
      liveFireworks.add(firework);
    }
  }
  fireworks = liveFireworks;
  // fireworks リストを「まだ生きている（消えていない）花火のリスト」で置き換える
  //これで消えた花火はメモリから削除され、メモリが節約できる
}
