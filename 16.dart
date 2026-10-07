import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SearchScreen(),
  ));
}

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final names = ['Rishabh', 'Rahul', 'Aman', 'Mohit', 'Vikas'];
  List<String> filteredNames = [];

  @override
  void initState() {
    super.initState();
    filteredNames = names;
  }

  void search(String value) {
    setState(() {
      filteredNames = names
          .where((name) =>
          name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search Names')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              onChanged: search,
              decoration: InputDecoration(
                hintText: 'Search name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredNames[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}