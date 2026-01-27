import 'package:flutter/material.dart';
import 'package:moc_4_2026/models/product.dart';

class ProductDetailScreen extends StatelessWidget {
  static Future<void> navigateTo(BuildContext context, Product product) {
    return Navigator.of(context).pushNamed(
      '/productDetailScreen',
      arguments: product,
    );
  }

  const ProductDetailScreen({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name ?? ''),
      ),
    );
  }
}
