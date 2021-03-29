import 'package:flutter/material.dart';

class ListArea extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ListAreaState();
  }
}
class _ListAreaState extends State<ListArea>{
  @override
  Widget build(BuildContext context) {
    final List<String> entries = <String>['A', 'B', 'C','A', 'B', 'C','A', 'B', 'C','A', 'B', 'C','A', 'B', 'C','A', 'B', 'C''A', 'B', 'C'];
    
    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(8),
      itemCount: entries.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          child: Center(child: Text('Entry ${entries[index]}')),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(color: Colors.black);
      },
    );
  }
}