import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moc_4_2026/blocs/cart_bloc/cart_bloc.dart';
import 'package:moc_4_2026/blocs/products_bloc/products_bloc.dart';
import 'package:moc_4_2026/cart_screen/cart_screen.dart';
import 'package:moc_4_2026/models/product.dart';
import 'package:moc_4_2026/product_detail_screen/product_detail_screen.dart';
import 'package:moc_4_2026/products_screen.dart';
import 'package:moc_4_2026/string_extensions.dart';

void main() {
  'toto'.areAllLettersA();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProductsBloc(),
        ),
        BlocProvider(
          create: (context) => CartBloc(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.deepPurple,
          useMaterial3: true,
          appBarTheme: const AppBarTheme(
            centerTitle: true,
          ),
        ),
        routes: {
          '/': (context) => const ProductsScreen(),
        },
        onGenerateRoute: (settings) {
          Widget page = Container();

          switch (settings.name) {
            case '/productDetailScreen':
              final param = settings.arguments;
              if (param is Product) {
                page = ProductDetailScreen(product: param);
              }
            case '/cartScreen':
              page = const CartScreen();
          }

          return MaterialPageRoute(builder: (context) => page);
        },
      ),
    );
  }
}
