import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moc_4_2026/models/product.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
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

    await Future.delayed(const Duration(seconds: 6));

    //emit(CartState(status: CartStatus.errorAddingProduct));

    emit(
      CartState(
        status: CartStatus.success,
        products: [...actualProducts, product],
      ),
    );
  }
}
