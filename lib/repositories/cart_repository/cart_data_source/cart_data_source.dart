import 'package:moc_4_2026/models/product.dart';

abstract class CartDataSource {
  Future<List<Product>> addProduct(Product product);

  Future<List<Product>> removeProduct(Product product);

  Future<void> clear();
}
