import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:moc_4_2026/models/product.dart';
import 'package:moc_4_2026/repositories/products_data_source/products_data_source.dart';

final class ApiProductsDataSource extends ProductsDataSource {
  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products'),
    );

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final productsJson = json['products'] as List<dynamic>;
      final products = productsJson.map((e) => Product.fromJson(e as Map<String, dynamic>)).toList();
      return products;
    }

    throw Exception();
  }
}
