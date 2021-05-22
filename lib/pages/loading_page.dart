import 'package:flutter/material.dart';
import 'package:sns_ec_app/components/progress.dart';

class LoadingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 本文
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Center(child: Progress()),
      ),
    );
  }
}
