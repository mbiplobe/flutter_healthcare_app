import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

@JsonSerializable()
class Order {
  final String id;
  final String orderId;
  final String? productId;
  final String? productName;
  final int? productQnty;
  final double? productPrice;
  final String? orderStatus;
  final String? orderForUser;
  final String orderDate;
  final String? updatedBy;
  final DateTime? updatedAt;
  final String? imgUrl;

  Order({
    required this.id,
    required this.orderId,
    this.productId,
    this.productName,
    this.productQnty,
    this.productPrice,
    this.orderStatus,
    this.orderForUser,
    required this.orderDate,
    this.updatedBy,
    this.updatedAt,
    this.imgUrl,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
