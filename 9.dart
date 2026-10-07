import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProductScreen(),
  ));
}

class Product {
  String name;
  double price;

  Product(this.name, this.price);
}

class ProductScreen extends StatelessWidget {
  final products = [
    Product('Laptop', 50000),
    Product('Mobile', 20000),
    Product('Keyboard', 1500),
    Product('Mouse', 800),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Products')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            trailing: Text('₹${products[index].price}'),
          );
        },
      ),
    );
  }
}