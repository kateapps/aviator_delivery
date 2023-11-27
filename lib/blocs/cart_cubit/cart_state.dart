import 'package:aviator_delivery/data/models/product_model.dart';

class CartCubitState {
  final List<ProductModel> cartItems;

  CartCubitState(this.cartItems);
}
//повесить провайдеры с блоком над экранами, где использ корзина
//