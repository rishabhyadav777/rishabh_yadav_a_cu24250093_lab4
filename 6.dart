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
      appBar: AppBar(title: Text('Horizontal List')),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            color: Colors.blue,
            child: Text(
              items[index],
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}