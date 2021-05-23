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
                  child: Text('ログイン'),
                  onPressed: () async {
                    try {
                      // メール/パスワードで認証
                      final FirebaseAuth auth = FirebaseAuth.instance;
                      await auth.signInWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      // ログインに成功した場合
                      // ホーム画面に遷移
                      await Navigator.of(context).pushNamed("/home");
                    } catch (e) {
                      switch (e.code) {
                        case "invalid-email":
                        case "user-not-found":
                        case "wrong-password":
                          setState(() {
                            infoText = "メールアドレスまたはパスワードが間違っています。";
                          });
                          break;
                        case "user-disabled":
                          setState(() {
                            infoText = "指定したユーザーのアカウントは凍結されています。";
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
              ),

              Container(
                  padding: EdgeInsets.all(8),
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed("/signup");
                    },
                    child: const Text('新規会員登録'),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
