import '../../data/models/product_model.dart';

abstract class ProductsEvent {}

class InitEvent extends ProductsEvent {}

class FetchDataEvent extends ProductsEvent {
  FetchDataEvent();
}

class AddToCartEvent extends ProductsEvent {
  final List<ProductModel> itemList;
  AddToCartEvent(this.itemList);
}
