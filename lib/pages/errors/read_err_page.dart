import 'package:flutter/material.dart';

class ReadErrPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ヘッダー
      appBar: AppBar(  // ヘッダーに表示するアプリケーションバー
        title: Text("エラー"),  // タイトルを表示
      ),

      // 本文
      body: Container(
          padding: const EdgeInsets.all(8),
          child: Center(child: Text("読み込みに失敗しました。もう一度お試しください。")),
        ),

    );
  }

}