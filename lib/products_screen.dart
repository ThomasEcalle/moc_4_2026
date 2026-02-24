import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moc_4_2026/blocs/cart_bloc/cart_bloc.dart';
import 'package:moc_4_2026/blocs/products_bloc/products_bloc.dart';
import 'package:moc_4_2026/cart_screen/cart_screen.dart';
import 'package:moc_4_2026/models/product.dart';
import 'package:moc_4_2026/product_detail_screen/product_detail_screen.dart';
import 'package:moc_4_2026/product_list_item.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    //final productsBloc = BlocProvider.of<ProductsBloc>(context);
    final productsBloc = context.read<ProductsBloc>();
    productsBloc.add(GetProducts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: BlocBuilder<CartBloc, CartState>(
              buildWhen: (prev, next) {
                final previousProductsLength = prev.products.length;
                final nextProductsLength = next.products.length;
                return previousProductsLength != nextProductsLength;
              },
              builder: (context, state) {
                print('Building Cart Icon');
                final nbItems = state.products.length;
                return IconButton(
                  onPressed: _onCartTap,
                  icon: Badge(
                    label: Text('$nbItems'),
                    child: const Icon(Icons.shopping_cart_outlined),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return switch (state.status) {
            ProductsStatus.initial || ProductsStatus.loading => _buildLoading(),
            ProductsStatus.success => _buildList(state.products),
          };
        },
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  //
  // Widget _buildError(String message) {
  //   return Center(
  //     child: Padding(
  //       padding: const EdgeInsets.all(32),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Icon(
  //             Icons.error_outline,
  //             size: 64,
  //             color: Theme.of(context).colorScheme.error,
  //           ),
  //           const SizedBox(height: 16),
  //           Text(
  //             'Oops, something went wrong!',
  //             style: Theme.of(context).textTheme.titleMedium,
  //             textAlign: TextAlign.center,
  //           ),
  //           const SizedBox(height: 8),
  //           Text(
  //             _error!,
  //             style: Theme.of(context).textTheme.bodyMedium?.copyWith(
  //               color: Theme.of(context).colorScheme.onSurfaceVariant,
  //             ),
  //             textAlign: TextAlign.center,
  //           ),
  //           const SizedBox(height: 24),
  //           FilledButton.tonalIcon(
  //             onPressed: _fetchProducts,
  //             icon: const Icon(Icons.refresh),
  //             label: const Text('Retry'),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  Widget _buildList(List<Product> produtcs) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 12,
        horizontal: 16,
      ),
      itemCount: produtcs.length,
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemBuilder: (context, index) {
        final product = produtcs[index];
        return ProductListItem(
          product: product,
          onTap: () => _onProductTap(product),
        );
      },
    );
  }

  void _onProductTap(Product product) {
    ProductDetailScreen.navigateTo(context, product);
  }

  void _onCartTap() {
    CartScreen.navigateTo(context);
  }
}
