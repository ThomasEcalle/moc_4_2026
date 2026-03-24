import 'package:moc_4_2026/models/product.dart';

abstract class ProductsDataSource {
  Future<List<Product>> getProducts();
}
