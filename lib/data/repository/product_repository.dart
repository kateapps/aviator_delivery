import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/product_model.dart';

class ProductRepository {
  static final ProductRepository _productRepository =
      ProductRepository._internal();

  factory ProductRepository() {
    return _productRepository;
  }

  ProductRepository._internal();

  List<ProductModel> _listOfItems = [];

  final CollectionReference collection =
      FirebaseFirestore.instance.collection('menu_items');

  Future<List<ProductModel>> fetchData() async {
    _listOfItems = [];
    QuerySnapshot querySnapshot = await collection.get();

    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      _listOfItems.add(ProductModel.fromJson(data));
    }
    return _listOfItems;
  }
}
