part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

final class AddToCart extends CartEvent {
  final Product product;

  AddToCart(this.product);
}
