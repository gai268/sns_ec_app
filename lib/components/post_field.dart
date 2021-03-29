
import 'package:flutter/material.dart';

class PostField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PostFieldState();
  }
}
class _PostFieldState extends State<PostField> {
  String _text = '';

  void _handleText(String event) {
    setState(() {  // 状態を保持する変数を変更する処理は、setState内に記述する
      _text = event;
    });
  }

  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "$_text",
              style: TextStyle(
                color:Colors.blueAccent,
                fontSize: 30.0,
              ),
            ),
            TextField(  // テキストを表示
              style: TextStyle(color: Colors.black87),
              onChanged: _handleText,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: '何が起こりましたか？',
                contentPadding:
                    const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
            ),
          ],
        )
    );
  }
}