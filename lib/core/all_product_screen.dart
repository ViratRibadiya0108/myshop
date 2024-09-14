import 'package:flutter/material.dart';
import 'package:myshop/core/a.dart';
import 'package:myshop/core/product_service.dart';
 // Import your Product model

class AllProductsScreen extends StatefulWidget {
  @override
  _AllProductsScreenState createState() => _AllProductsScreenState();
}

class _AllProductsScreenState extends State<AllProductsScreen> {
  late Future<List<Product>> _futureProducts;
  final ProductService _productService = ProductService();

  @override
  void initState() {
    super.initState();
    _futureProducts = _productService.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("All Products"),
      ),
      body: FutureBuilder<List<Product>>(
        future: _futureProducts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No products available"));
          } else {
           return ListView.builder(
  itemCount: snapshot.data!.length,
  itemBuilder: (context, index) {
    final product = snapshot.data![index];
    return Card(
      child: ListTile(
        leading: product.thumbnail != null
            ? Image.network(product.thumbnail!)
            : Placeholder(), // Show placeholder if no image
        title: Text(product.title),
        subtitle: Text("Price: \$${product.price.toStringAsFixed(2)}"),
      ),
    );
  },
);

          }
        },
      ),
    );
  }
}
