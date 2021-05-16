import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

// ログイン画面用Widget
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // メッセージ表示用
  String infoText = '';
  // 入力したメールアドレス・パスワード
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ロゴ
              Center(
                child: SvgPicture.asset(
                  'images/logo.svg',
                  width: 150,
                  height: 150,
                ),
              ),

              // メールアドレス入力
              TextFormField(
                decoration: InputDecoration(labelText: 'メールアドレス'),
                onChanged: (String value) {
                  setState(() {
                    email = value;
                  });
                },
              ),
              // パスワード入力
              TextFormField(
                decoration: InputDecoration(labelText: 'パスワード'),
                obscureText: true,
                onChanged: (String value) {
                  setState(() {
                    password = value;
                  });
                },
              ),
              Container(
                padding: EdgeInsets.all(8),
                // メッセージ表示
                child: Text(infoText,
                    style: TextStyle(color: Theme.of(context).errorColor)),
              ),
              Container(
                width: double.infinity,
                // ユーザー登録ボタン
                child: ElevatedButton(
                  child: Text('登録'),
                  onPressed: () async {
                    try {
                      // メール/パスワードでユーザー登録
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      await auth.createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      // ユーザー登録に成功した場合
                      // ホーム画面に遷移
                      await Navigator.of(context).pushNamed("/home");
                    } catch (e) {
                      switch (e.code) {
                        case "email-already-in-use":
                          setState(() {
                            infoText = "既に使用されているメールアドレスです。";
                          });
                          break;
                        case "missing-email":
                          setState(() {
                            infoText = "メールアドレスを入力してください。";
                          });
                          break;
                        case "invalid-email":
                          setState(() {
                            infoText = "無効なメールアドレスです。";
                          });
                          break;
                        case "weak-password":
                          setState(() {
                            infoText = "安全性が低いパスワードです。";
                          });
                          break;
                        default:
                          setState(() {
                            infoText = "予期しないエラーが発生しました。";
                          });
                          throw e;
                      }
                    }
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
