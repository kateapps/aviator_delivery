import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product_model.dart';

class CartRepository {
  static final CartRepository _cartRepository = CartRepository._internal();

  factory CartRepository() {
    return _cartRepository;
  }
  CartRepository._internal();

  final List<ProductModel> _cartItems = [];

  void addProduct(ProductModel productModel) => _cartItems.add(productModel);
  void removeProduct(ProductModel productModel) =>
      _cartItems.remove(productModel);
  void removeAllSimilar(ProductModel productModel) =>
      _cartItems.removeWhere((e) => e == productModel);
  List<ProductModel> get cartItems => _cartItems;
}
