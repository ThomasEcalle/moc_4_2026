part of 'cart_bloc.dart';

enum CartStatus {
  addingProduct,
  errorAddingProduct,
  success,
}

final class CartState {
  final CartStatus status;
  final List<Product> products;

  CartState({
    this.status = CartStatus.success,
    this.products = const [],
  });
}
