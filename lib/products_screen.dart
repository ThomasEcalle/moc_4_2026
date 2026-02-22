import 'package:flutter/material.dart';
import 'package:moc_4_2026/cart_screen/cart_screen.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: IconButton(
              onPressed: _onCartTap,
              icon: Badge(
                label: const Text('0'),
                child: const Icon(Icons.shopping_cart_outlined),
              ),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        itemCount: _products.length,
        separatorBuilder: (context, index) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
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

  void _onCartTap() {
    CartScreen.navigateTo(context);
  }
}
