import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  final icons = [
    Icons.home,
    Icons.person,
    Icons.settings,
    Icons.email,
    Icons.phone,
    Icons.camera,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Icon Grid')),
      body: GridView.count(
        crossAxisCount: 2,
        children: icons.map((icon) {
          return Card(
            child: Icon(icon, size: 50),
          );
        }).toList(),
      ),
    );
  }
}