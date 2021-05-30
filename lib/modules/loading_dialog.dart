import 'package:flutter/material.dart';
// 読込中ダイアログ
class LoadingDialog {
  // ダイアログを表示
  static Future<void> show(BuildContext context) async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(content: Container(
          height: 100,
          child: Center(
              child: Container(
                child: SizedBox(
                  child: CircularProgressIndicator(),
                  height: 50.0,
                  width: 50.0,
                ))),
        ));
    });
  }
}
