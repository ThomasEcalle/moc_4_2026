import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';
import 'package:moc_4_2026/models/product.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  ProductsBloc() : super(ProductsState()) {
    on<GetProducts>((event, emit) async {
      await Future.delayed(const Duration(seconds: 2));
      final response = await http.get(
        Uri.parse('https://dummyjson.com/products'),
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as Map<String, dynamic>;
        final productsJson = json['products'] as List<dynamic>;
        final products = productsJson.map((e) => Product.fromJson(e as Map<String, dynamic>)).toList();
        emit(ProductsState(products: products));
      }
    });
  }
}
