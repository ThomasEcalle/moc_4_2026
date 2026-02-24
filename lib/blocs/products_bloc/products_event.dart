part of 'products_bloc.dart';

@immutable
sealed class ProductsEvent {}

final class GetProducts extends ProductsEvent {}
