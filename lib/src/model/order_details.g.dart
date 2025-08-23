// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetails _$OrderDetailsFromJson(Map<String, dynamic> json) => OrderDetails(
  orderId: json['orderId'] as String,
  orderForUser: json['orderForUser'] as String,
  orderStatus: json['orderStatus'] as String,
  orderDate: json['orderDate'] as String,
  orderList: (json['orderList'] as List<dynamic>)
      .map((e) => OrderList.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OrderDetailsToJson(OrderDetails instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderForUser': instance.orderForUser,
      'orderStatus': instance.orderStatus,
      'orderDate': instance.orderDate,
      'orderList': instance.orderList,
    };

OrderList _$OrderListFromJson(Map<String, dynamic> json) => OrderList(
  id: json['id'] as String,
  productId: json['productId'] as String,
  medicineName: json['medicineName'] as String,
  productImageUrl: json['productImageUrl'] as String,
  productPrice: json['productPrice'] as String,
  productQnty: json['productQnty'] as String,
);

Map<String, dynamic> _$OrderListToJson(OrderList instance) => <String, dynamic>{
  'id': instance.id,
  'productId': instance.productId,
  'medicineName': instance.medicineName,
  'productImageUrl': instance.productImageUrl,
  'productPrice': instance.productPrice,
  'productQnty': instance.productQnty,
};
