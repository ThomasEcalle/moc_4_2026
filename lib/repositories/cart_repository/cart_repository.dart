import '../../models/product.dart';
import 'cart_data_source/cart_data_source.dart';

final class CartRepository {
  final CartDataSource dataSource;

  const CartRepository({
    required this.dataSource,
  });

  Future<List<Product>> addProduct(Product product) async {
    try {
      return await dataSource.addProduct(product);
    } catch (error) {
      rethrow;
    }
  }

  Future<List<Product>> removeProduct(Product product) async {
    try {
      return await dataSource.removeProduct(product);
    } catch (error) {
      rethrow;
    }
  }

  Future<void> clear() async {
    try {
      await dataSource.clear();
    } catch (error) {
      rethrow;
    }
  }
}
