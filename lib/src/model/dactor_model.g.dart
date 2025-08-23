// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dactor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
  name: json['name'] as String,
  type: json['type'] as String,
  description: json['description'] as String,
  rating: (json['rating'] as num).toDouble(),
  goodReviews: (json['goodReviews'] as num).toDouble(),
  totalScore: (json['totalScore'] as num).toDouble(),
  satisfaction: (json['satisfaction'] as num).toDouble(),
  isFavourite: json['isFavourite'] as bool,
  image: json['image'] as String,
  education: json['education'] as String,
  location: json['location'] as String,
  constFee: json['constFee'] as String,
);

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'description': instance.description,
      'rating': instance.rating,
      'goodReviews': instance.goodReviews,
      'totalScore': instance.totalScore,
      'satisfaction': instance.satisfaction,
      'isFavourite': instance.isFavourite,
      'image': instance.image,
      'education': instance.education,
      'location': instance.location,
      'constFee': instance.constFee,
    };
