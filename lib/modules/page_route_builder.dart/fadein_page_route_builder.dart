import 'package:flutter/cupertino.dart';

// フェードインで開くページのビルダー
class FadeinPageRouteBuilder extends PageRouteBuilder {
  final Widget widget;

  FadeinPageRouteBuilder(this.widget): super(
    pageBuilder: (_, __, ___) => widget,
    transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
  );  
}