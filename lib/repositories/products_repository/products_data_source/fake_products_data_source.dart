import 'package:moc_4_2026/models/product.dart';

import 'products_data_source.dart';

final class FakeProductsDataSource extends ProductsDataSource {
  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 3));
    return [
      Product(id: 01, name: 'Mo faux produit', price: 23.5),
    ];
  }
}
