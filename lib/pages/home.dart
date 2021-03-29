import 'package:flutter/material.dart';
import 'package:sns_ec_app/components/footer.dart';

class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  // ヘッダーに表示するアプリケーションバー
        title: Text("ホーム"),  // タイトルを表示
        automaticallyImplyLeading: false, // 戻るボタン非表示
      ),
      body: SingleChildScrollView(
        
        child: Container(
          height: 300,
          child: Center(child: Text("作成中")),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }

}