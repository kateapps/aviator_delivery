import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

enum FoodType {
  @JsonValue('burger')
  burger,
  @JsonValue('salad')
  salad,
  @JsonValue('pizza')
  pizza,
  @JsonValue('sushi')
  sushi,
}

extension FoodTypeX on FoodType {
  String getPicture() {
    return 'assets/categories/$name.jpg';
  }
}

@JsonSerializable()
class ProductModel extends Equatable {
  final String name;
  final String description;
  final String price;
  final String picture;
  final FoodType foodType;

  ProductModel({
    required this.name,
    required this.description,
    required this.price,
    required this.picture,
    required this.foodType,
  });

  @override
  List<Object> get props => [name, description, price, picture, foodType];

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}
