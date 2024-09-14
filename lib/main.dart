import 'package:flutter/material.dart';
import 'package:myshop/core/all_product_screen.dart';
// import 'all_products_screen.dart'; // Import the screen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Product App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AllProductsScreen(), // Set AllProductsScreen as the home
    );
  }
}
