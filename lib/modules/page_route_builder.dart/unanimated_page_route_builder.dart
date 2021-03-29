import 'package:flutter/cupertino.dart';

// アニメーションなしで開くページのビルダー
class UnanimatedPageRouteBuilder extends PageRouteBuilder {
  final Widget widget;

  UnanimatedPageRouteBuilder(this.widget): super(
    pageBuilder: (_, __, ___) => widget,
    transitionDuration: Duration(seconds: 0),
  );  
}