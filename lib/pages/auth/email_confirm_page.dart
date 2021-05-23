import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// ユーザー登録時のメールアドレス確認中画面Widget
class EmailConfirmPage extends StatefulWidget {
  @override
  _EmailConfirmPageState createState() => _EmailConfirmPageState();
}

class _EmailConfirmPageState extends State<EmailConfirmPage> {
  // メッセージ表示用
  String infoText = '';

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
                  padding: EdgeInsets.all(8),
                  child: TextButton(
                    onPressed: () async {
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      // ユーザー情報を取得
                      User user = auth.currentUser;
                      // 確認メールを送信する。
                      user.sendEmailVerification();
                    },
                    child: const Text('> 確認メールを再送信する'),
                  )),

              Container(
                padding: EdgeInsets.all(8),
                // メッセージ表示
                child: Text(infoText,
                    style: TextStyle(color: Theme.of(context).errorColor)),
              ),

              Container(
                width: double.infinity,
                child: ElevatedButton(
                  child: Text('メールアドレスを確認しました。'),
                  onPressed: () async {
                    final FirebaseAuth auth = FirebaseAuth.instance;
                    // ユーザー情報を取得
                    User user = auth.currentUser;
                    user.reload();

                    // メールアドレス認証済みの場合
                    if (user.emailVerified) {
                      await Navigator.of(context).pushNamed("/home");
                    } else {
                      setState(() {
                        infoText = "メールアドレスの認証が済んでいません。";
                      });
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
