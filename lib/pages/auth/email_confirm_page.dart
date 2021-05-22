import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ユーザー登録時のメールアドレス確認中画面Widget
class EmailConfirmPage extends StatefulWidget {
  @override
  _EmailConfirmPageState createState() => _EmailConfirmPageState();
}

class _EmailConfirmPageState extends State<EmailConfirmPage> {
  // メッセージ表示用
  String infoText = '';
  // 入力したメールアドレス・パスワード
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ヘッダー
      appBar: AppBar(
        title: Text("メールアドレスの確認"),
      ),

      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ロゴ
              Center(
                child: Icon(
                  Icons.email,
                  color: Colors.grey,
                  size: 80,
                ),
              ),

              Container(
                padding: EdgeInsets.all(8),
                child: Text(
                    "ご登録いただいたメールアドレスに、確認用のメールを送りました。メール内容を確認して認証を済ましてください。"),
              ),
              Container(
                width: double.infinity,
                // 確認メールの再送信ボタン
                child: ElevatedButton(
                  child: Text('確認メールを再送信する'),
                  onPressed: () async {
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    // ユーザー情報を取得
                    User user = auth.currentUser;
                    // 確認メールを送信する。
                    user.sendEmailVerification();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
