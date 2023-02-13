import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: "My app",
    home: MyScaffold(),
  ));
}

class MyAppBar extends StatelessWidget {
  MyAppBar({required this.title});

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56.0,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: BoxDecoration(color: Colors.blue[500]),
        child: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              tooltip: 'Navigation menu',
              onPressed: null,
            ),
            Expanded(
              child: title,
            ),
            IconButton(
              icon: Icon(Icons.search),
              tooltip: 'Search',
              onPressed: null,
            )
          ],
        ));
  }
}

class MyScaffold extends StatelessWidget {
  const MyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        MyAppBar(
          title: Text("this is title"),
        ),
        Expanded(
          child: Center(
            child: Text("Hello World"),
          ),
        )
      ],
    ));
  }
}
