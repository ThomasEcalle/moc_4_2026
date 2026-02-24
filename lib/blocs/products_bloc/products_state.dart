part of 'products_bloc.dart';

enum ProductsStatus {
  initial,
  loading,
  success,
}

final class ProductsState {
  final ProductsStatus status;
  final List<Product> products;

  ProductsState({
    this.status = ProductsStatus.initial,
    this.products = const [],
  });
}
