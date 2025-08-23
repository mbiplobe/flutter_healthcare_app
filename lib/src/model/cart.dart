import 'package:json_annotation/json_annotation.dart';

part 'cart.g.dart';

@JsonSerializable()
class Cart {
  final String id;
  final String productId;
  final String productName;
  final String productCategoryId;
  final String productCategoryName;
  final String productImageUrl;
  final double productPrice;
  final int productQty;
  final String? createdBy;
  final DateTime? createdAt;
  final String cartStatus;

  Cart({
    required this.id,
    required this.productId,
    required this.productName,
    required this.productCategoryId,
    required this.productCategoryName,
    required this.productImageUrl,
    required this.productPrice,
    required this.productQty,
    this.createdBy,
    this.createdAt,
    required this.cartStatus,
  });

  factory Cart.fromJson(Map<String, dynamic> json) => _$CartFromJson(json);
  Map<String, dynamic> toJson() => _$CartToJson(this);
}
