import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sns_ec_app/modules/loading_dialog.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/settings"),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("設定"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/error"),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("エラー画面"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/signup"),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("ユーザー登録"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/email-confirm"),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("メール確認中"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.of(context).pushNamed("/login"),
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("ログイン"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
          GestureDetector(
            onTap: () async{
              // 読み込みダイアログを開く
              LoadingDialog.show(context);

              final FirebaseAuth auth = FirebaseAuth.instance;
              await auth.signOut();

              // 読み込みダイアログを閉じる
              Navigator.of(context).pop();
              // ログイン画面へ
              Navigator.of(context).pushNamed("/login");
            },
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text("ログアウト"),
              trailing: Icon(Icons.arrow_forward),
            ),
          ),
        ],
      ),
    );
  }
}
