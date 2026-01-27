import 'package:flutter/material.dart';
import 'package:moc_4_2026/models/product.dart';
import 'package:moc_4_2026/product_detail_screen/product_detail_screen.dart';
import 'package:moc_4_2026/product_list_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _products = List.generate(100, (index) {
      return Product(index, 'Product $index', index.toDouble());
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: screenHeight > 800 ? Colors.amber : Colors.pink,
      appBar: AppBar(
        title: Text('Products $screenHeight'),
      ),
      body: ListView.separated(
        itemCount: _products.length,
        separatorBuilder: (context, index) => const SizedBox(height: 20),
        itemBuilder: (context, index) {
          print('Building item $index');
          final product = _products[index];
          return ProductListItem(
            product: product,
            onTap: () => _onProductTap(product),
          );
        },
      ),
    );
  }

  void _onProductTap(Product product) {
    ProductDetailScreen.navigateTo(context, product);
  }
}






























