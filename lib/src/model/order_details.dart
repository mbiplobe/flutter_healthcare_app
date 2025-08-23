import 'package:json_annotation/json_annotation.dart';

part 'order_details.g.dart';

@JsonSerializable()
class OrderDetails {
  final String orderId;
  final String orderForUser;
  final String orderStatus;
  final String orderDate;
  final List<OrderList> orderList;

  OrderDetails({
    required this.orderId,
    required this.orderForUser,
    required this.orderStatus,
    required this.orderDate,
    required this.orderList,
  });

  factory OrderDetails.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$OrderDetailsToJson(this);
}

@JsonSerializable()
class OrderList {
  final String id;
  final String productId;
  final String medicineName;
  final String productImageUrl;
  final String productPrice;
  final String productQnty;

  OrderList({
    required this.id,
    required this.productId,
    required this.medicineName,
    required this.productImageUrl,
    required this.productPrice,
    required this.productQnty,
  });

  factory OrderList.fromJson(Map<String, dynamic> json) =>
      _$OrderListFromJson(json);

  Map<String, dynamic> toJson() => _$OrderListToJson(this);
}
