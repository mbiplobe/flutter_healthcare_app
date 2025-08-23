// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
  id: json['id'] as String,
  orderId: json['orderId'] as String,
  productId: json['productId'] as String?,
  productName: json['productName'] as String?,
  productQnty: (json['productQnty'] as num?)?.toInt(),
  productPrice: (json['productPrice'] as num?)?.toDouble(),
  orderStatus: json['orderStatus'] as String?,
  orderForUser: json['orderForUser'] as String?,
  orderDate: json['orderDate'] as String,
  updatedBy: json['updatedBy'] as String?,
  updatedAt: json['updatedAt'] == null
      ? null
      : DateTime.parse(json['updatedAt'] as String),
  imgUrl: json['imgUrl'] as String?,
);

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'id': instance.id,
  'orderId': instance.orderId,
  'productId': instance.productId,
  'productName': instance.productName,
  'productQnty': instance.productQnty,
  'productPrice': instance.productPrice,
  'orderStatus': instance.orderStatus,
  'orderForUser': instance.orderForUser,
  'orderDate': instance.orderDate,
  'updatedBy': instance.updatedBy,
  'updatedAt': instance.updatedAt?.toIso8601String(),
  'imgUrl': instance.imgUrl,
};
