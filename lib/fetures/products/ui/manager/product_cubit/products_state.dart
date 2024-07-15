part of 'products_cubit.dart';

@immutable
abstract class ProductsState {}

class ProductsInitial extends ProductsState {}


class ProductsLoading extends ProductsState {}

class ProductsFailure extends ProductsState {
  final String errMessage;

   ProductsFailure(this.errMessage);
}

class ProductsSuccess extends ProductsState {
  final List<Product> products;

  ProductsSuccess(this.products);

}