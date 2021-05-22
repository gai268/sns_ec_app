import 'package:flutter/material.dart';

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
        ],
      ),
    );
  }
}
