import 'package:flutter/material.dart';

class PostsGridList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        Card(
          child: InkWell(
            splashColor: Colors.red.withAlpha(30),
            onTap: () {},
            child: Text('A card that can be tapped'),
          ),
        ),
        Card(
          child: InkWell(
            splashColor: Colors.red.withAlpha(30),
            onTap: () {},
            child: Text('A card that can be tapped'),
          ),
        ),
        Card(
          child: InkWell(
            splashColor: Colors.red.withAlpha(30),
            onTap: () {},
            child: Text('A card that can be tapped'),
          ),
        ),

      ],
    );
  }
  
}