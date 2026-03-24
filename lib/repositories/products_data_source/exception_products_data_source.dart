import 'package:moc_4_2026/models/product.dart';
import 'package:moc_4_2026/repositories/products_data_source/products_data_source.dart';

final class ExceptionProductsDataSource extends ProductsDataSource {
  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 3));
    throw Exception();
  }
}
