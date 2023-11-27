import 'package:aviator_delivery/data/repository/cart_repository.dart';
import 'package:bloc/bloc.dart';

import '../../data/models/product_model.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartCubitState> {
  CartCubit(this.cartRepository)
      : super(CartCubitState(cartRepository.cartItems));
  final CartRepository cartRepository;

  void addProduct(ProductModel productModel) {
    cartRepository.addProduct(productModel);

    emit(CartCubitState(cartRepository.cartItems));
  }

  void removeProduct(ProductModel productModel) {
    cartRepository.removeProduct(productModel);
    emit(CartCubitState(cartRepository.cartItems));
  }

  void removeAllSimilarProduct(ProductModel productModel) {
    cartRepository.removeProduct(productModel);
    emit(CartCubitState(cartRepository.cartItems));
  }
}
