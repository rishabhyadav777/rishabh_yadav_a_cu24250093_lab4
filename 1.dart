import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatelessWidget {
  final items = ['Apple', 'Banana', 'Mango', 'Orange', 'Grapes'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Five Items')),
      body: ListView(
        children: items.map((item) => ListTile(
          title: Text(item),
        )).toList(),
      ),
    );
  }
}