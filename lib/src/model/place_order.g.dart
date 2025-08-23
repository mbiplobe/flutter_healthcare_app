// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceOrder _$PlaceOrderFromJson(Map<String, dynamic> json) => PlaceOrder(
  userId: json['userId'] as String,
  productList: (json['productList'] as List<dynamic>)
      .map((e) => Cart.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PlaceOrderToJson(PlaceOrder instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'productList': instance.productList,
    };
