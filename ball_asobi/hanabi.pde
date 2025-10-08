class Firework{//ひとつの花火をあらわすクラス
  
  ArrayList<Spark> sparks = new ArrayList<>();//花火を構成する火花のリスト
 
 Firework(){//コンストラクタ
   PVector position = new PVector(random(width),random(height));
   // 花火が出現する位置をランダムに決める
   for (int i = 0; i < 400; i++){// 400個の火花を作ってリストに追加
     sparks.add(new Spark(position));
   }
 }
 
 void show(){ // すべての火花を描画する
   for (Spark s : sparks){
     s.show();
   }
 }
 
 void update(){//すべての火花の位置を更新し、まだ生きている（消えていない）ものだけ残す
   ArrayList<Spark> liveSparks = new ArrayList<>();// 生存中の火花を一時的に入れるリスト
   for (Spark s : sparks){//火花を動かす
     s.update();//まだ消えていないなら
     if (s.isAlive()){//残しておく
       liveSparks.add(s);
     }
   }
   sparks = liveSparks;//消えていない火花だけで更新
 }
 
 boolean isAlive(){ //すべての火花が生存中かどうか、火花が一つでも残っているか
   return !sparks.isEmpty();//sparksが空でなければ生きている
 }
}
