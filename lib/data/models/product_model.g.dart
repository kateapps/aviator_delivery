// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      name: json['name'] as String,
      description: json['description'] as String,
      price: json['price'] as String,
      picture: json['picture'] as String,
      foodType: $enumDecode(_$FoodTypeEnumMap, json['foodType']),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'picture': instance.picture,
      'foodType': _$FoodTypeEnumMap[instance.foodType]!,
    };

const _$FoodTypeEnumMap = {
  FoodType.burger: 'burger',
  FoodType.salad: 'salad',
  FoodType.pizza: 'pizza',
  FoodType.sushi: 'sushi',
};
