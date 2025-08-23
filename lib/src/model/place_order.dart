import 'package:json_annotation/json_annotation.dart';
import 'cart.dart';

part 'place_order.g.dart';

@JsonSerializable()
class PlaceOrder {
  final String userId;
  final List<Cart> productList;

  PlaceOrder({
    required this.userId,
    required this.productList,
  });

  factory PlaceOrder.fromJson(Map<String, dynamic> json) =>
      _$PlaceOrderFromJson(json);

  Map<String, dynamic> toJson() => _$PlaceOrderToJson(this);
}
