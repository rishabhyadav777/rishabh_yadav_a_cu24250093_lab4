import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  final items = [
    ['Rishabh', 'BCA Student', Icons.person],
    ['Rahul', 'B.Tech Student', Icons.school],
    ['Aman', 'MCA Student', Icons.computer],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Students')),
      body: ListView(
        children: items.map((item) => ListTile(
          leading: Icon(item[2] as IconData),
          title: Text(item[0] as String),
          subtitle: Text(item[1] as String),
        )).toList(),
      ),
    );
  }
}