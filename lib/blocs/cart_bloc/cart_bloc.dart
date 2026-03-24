import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moc_4_2026/models/product.dart';
import 'package:moc_4_2026/repositories/cart_repository/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepository cartRepository;

  CartBloc({required this.cartRepository}) : super(CartState()) {
    on<AddToCart>(_onAddToCart);
  }

  Future<void> _onAddToCart(AddToCart event, Emitter<CartState> emit) async {
    final product = event.product;
    final actualProducts = state.products;

    emit(
      CartState(
        status: CartStatus.addingProduct,
        products: actualProducts,
      ),
    );

    try {
      final products = await cartRepository.addProduct(product);
      emit(
        CartState(
          status: CartStatus.success,
          products: products,
        ),
      );
    } catch (error) {
      emit(
        CartState(
          status: CartStatus.errorAddingProduct,
          products: actualProducts,
        ),
      );
      return;
    }
  }
}
