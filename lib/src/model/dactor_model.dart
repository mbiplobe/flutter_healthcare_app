import 'package:json_annotation/json_annotation.dart';

part 'dactor_model.g.dart';

@JsonSerializable()
class DoctorModel {
  final String name;
  final String type;
  final String description;
  final double rating;
  final double goodReviews;
  final double totalScore;
  final double satisfaction;
  final bool isFavourite;
  final String image;
  final String education;
  final String location;
  final String constFee;

  DoctorModel({
    required this.name,
    required this.type,
    required this.description,
    required this.rating,
    required this.goodReviews,
    required this.totalScore,
    required this.satisfaction,
    required this.isFavourite,
    required this.image,
    required this.education,
    required this.location,
    required this.constFee,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) => _$DoctorModelFromJson(json);

  Map<String, dynamic> toJson() => _$DoctorModelToJson(this);

  DoctorModel copyWith({
    String? name,
    String? type,
    String? description,
    double? rating,
    double? goodReviews,
    double? totalScore,
    double? satisfaction,
    bool? isFavourite,
    String? image,
    String? education,
    String? location,
    String? constFee,
  }) =>
      DoctorModel(
        name: name ?? this.name,
        type: type ?? this.type,
        description: description ?? this.description,
        rating: rating ?? this.rating,
        goodReviews: goodReviews ?? this.goodReviews,
        totalScore: totalScore ?? this.totalScore,
        satisfaction: satisfaction ?? this.satisfaction,
        isFavourite: isFavourite ?? this.isFavourite,
        image: image ?? this.image,
        education: education ?? this.education,
        location: location ?? this.location,
        constFee: constFee ?? this.constFee,
      );
}
