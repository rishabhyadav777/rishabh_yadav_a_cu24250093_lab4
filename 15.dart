import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: DismissScreen(),
  ));
}

class DismissScreen extends StatefulWidget {
  @override
  State<DismissScreen> createState() => _DismissScreenState();
}

class _DismissScreenState extends State<DismissScreen> {
  final items = ['Apple', 'Banana', 'Mango', 'Orange'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Swipe to Delete')),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(items[index]),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            background: Container(color: Colors.red),
            child: ListTile(
              title: Text(items[index]),
            ),
          );
        },
      ),
    );
  }
}