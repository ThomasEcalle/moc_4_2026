import '../../models/product.dart';
import 'products_data_source/products_data_source.dart';

final class ProductsRepository {
  final ProductsDataSource remoteDataSource;

  //final ProductsDataSource localDataSource;

  const ProductsRepository({
    required this.remoteDataSource,
    //required this.localDataSource,
  });

  Future<List<Product>> getProducts() async {
    try {
      return remoteDataSource.getProducts();
    } catch (error) {
      //return localDataSource.getProducts();
      rethrow;
    }
  }
}
