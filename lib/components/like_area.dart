
import 'package:flutter/material.dart';

class LikeArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LikeAreaState();
  }
}
class _LikeAreaState extends State<LikeArea> {
  int _count = 0;

  void _handlePressed() {
    setState(() {  // 状態を保持する変数を変更する処理は、setState内に記述する
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "$_count",
            style: TextStyle(
                color:Colors.blueAccent,
                fontSize: 30.0,
              )
          ),
          Ink(
            decoration: const ShapeDecoration(
              shape: CircleBorder(),
            ),
            child: IconButton(
              onPressed: _handlePressed,
              icon: const Icon(Icons.favorite_border),
              color: Colors.grey,
            ),
          ),
        ]
      ),
    );
  }
}

