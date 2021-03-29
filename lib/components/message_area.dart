import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

// メッセージエリア
class MessageArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MessageAreaState();
  }
}
class _MessageAreaState extends State<MessageArea>{
  @override
  Widget build(BuildContext context) {
    final message = WordPair.random();
    return Text("メッセージです。\n" + message.asString);
  }
}