import 'package:flutter/material.dart';
import 'package:sns_ec_app/components/post_field.dart';

class PostPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  // ヘッダーに表示するアプリケーションバー
        title: Text("投稿"),  // タイトルを表示
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PostField(),
          ],
        )
      ),
    );
  }

}