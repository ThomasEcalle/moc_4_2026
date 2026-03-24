import 'package:moc_4_2026/models/product.dart';
import 'package:moc_4_2026/repositories/cart_repository/cart_data_source/cart_data_source.dart';

final class FakeCartDataSource extends CartDataSource {
  final List<Product> _products = [];

  @override
  Future<List<Product>> addProduct(Product product) async {
    await Future.delayed(const Duration(seconds: 1));
    _products.add(product);
    return [..._products];
  }

  @override
  Future<void> clear() async {
    await Future.delayed(const Duration(seconds: 1));
    _products.clear();
  }

  @override
  Future<List<Product>> removeProduct(Product product) async {
    await Future.delayed(const Duration(seconds: 1));
    _products.remove(product);
    return _products;
  }
}
