// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cart _$CartFromJson(Map<String, dynamic> json) => Cart(
  id: json['id'] as String,
  productId: json['productId'] as String,
  productName: json['productName'] as String,
  productCategoryId: json['productCategoryId'] as String,
  productCategoryName: json['productCategoryName'] as String,
  productImageUrl: json['productImageUrl'] as String,
  productPrice: (json['productPrice'] as num).toDouble(),
  productQty: (json['productQty'] as num).toInt(),
  createdBy: json['createdBy'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
  cartStatus: json['cartStatus'] as String,
);

Map<String, dynamic> _$CartToJson(Cart instance) => <String, dynamic>{
  'id': instance.id,
  'productId': instance.productId,
  'productName': instance.productName,
  'productCategoryId': instance.productCategoryId,
  'productCategoryName': instance.productCategoryName,
  'productImageUrl': instance.productImageUrl,
  'productPrice': instance.productPrice,
  'productQty': instance.productQty,
  'createdBy': instance.createdBy,
  'createdAt': instance.createdAt?.toIso8601String(),
  'cartStatus': instance.cartStatus,
};
