import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:myshop/core/a.dart';
import 'package:myshop/domain/product.dart';
// import 'product.dart'; // Import your Product model

class ProductService {
  final String _baseUrl = "https://dummyjson.com/products";

  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> productList = jsonDecode(response.body)["products"];
      return productList.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception("Failed to load products");
    }
  }
}
