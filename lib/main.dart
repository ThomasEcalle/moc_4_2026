import 'package:flutter/material.dart';
import 'package:moc_4_2026/models/product.dart';
import 'package:moc_4_2026/product_detail_screen/product_detail_screen.dart';
import 'package:moc_4_2026/products_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => ProductsScreen(),
      },
      onGenerateRoute: (settings) {
        Widget page = Container();

        switch (settings.name) {
          case '/productDetailScreen':
            final param = settings.arguments;
            if (param is Product) {
              page = ProductDetailScreen(product: param);
            }
        }

        return MaterialPageRoute(builder: (context) => page);
      },
    );
  }
}
