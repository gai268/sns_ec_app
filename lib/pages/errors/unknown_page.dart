import 'package:flutter/material.dart';
import 'package:sns_ec_app/components/footer.dart';

class UnknownPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  // ヘッダーに表示するアプリケーションバー
        title: Text(""),  // タイトルを表示
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 300,
          child: Center(child: Text("ページが見つかりません。")),
        ),
      ),
      bottomNavigationBar: Footer(),
    );
  }

}