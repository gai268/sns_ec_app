import 'package:flutter/material.dart';

class Footer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _FooterState();
  }
}

class _FooterState extends State<Footer> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar = BottomNavigationBar(
      currentIndex: _selectedIndex,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'ホーム',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.add_box,
            color: Colors.red,
            size: 60,
            ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle),
          label: 'マイページ',
        ),
      ],
      onTap: (index) => _handleOnTap(context, index),
    );
    return bottomNavigationBar;
  }

  void _handleOnTap(BuildContext context, int index){
    debugPrint("footer tapped. index is $index");
    // setState(() {
    //   _selectedIndex = index;
    // });
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed("/home");
        break;
      case 1:
        Navigator.of(context).pushNamed("/post");
        break;
      case 2:
        Navigator.of(context).pushNamed("/mypage");
        break;
      default:
        return;
    }
  }
}