import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:moc_4_2026/models/product.dart';
import 'package:moc_4_2026/repositories/products_data_source/products_data_source.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsDataSource productsDataSource;

  ProductsBloc({required this.productsDataSource}) : super(ProductsState()) {
    on<GetProducts>((event, emit) async {
      emit(ProductsState(status: ProductsStatus.loading));
      try {
        final products = await productsDataSource.getProducts();
        emit(ProductsState(products: products, status: ProductsStatus.success));
      } catch (error) {
        //TODO: Handle error
      }
    });
  }
}
