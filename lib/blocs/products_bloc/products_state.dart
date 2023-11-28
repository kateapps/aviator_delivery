import '../../data/models/product_model.dart';

abstract class ProductsState {}

class InitState extends ProductsState {}

class HasDataState extends ProductsState {
  final List<ProductModel> itemList;

  HasDataState(this.itemList);
}

class AddedToCartState extends ProductsState {
  final List<ProductModel> itemList;

  AddedToCartState(this.itemList);
}

class LoadingState extends ProductsState {}
