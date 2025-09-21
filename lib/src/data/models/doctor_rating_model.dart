class DoctorRatingModel 
{
  final int id;
  final int doctor_id;
  final int? rating;
  final String? review;
  final String? created_at;
  final String? created_by;

  DoctorRatingModel({
    required this.id,
    required this.doctor_id,
    this.rating,
    this.review,
    this.created_at,
    this.created_by,
  });

  factory DoctorRatingModel.fromJson(Map<String, dynamic> json) {
    return DoctorRatingModel(
      id: json['id'],
      doctor_id: json['doctor_id'],
      rating: json['rating'],
      review: json['review'],
      created_at: json['created_at'],
      created_by: json['created_by'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'doctor_id': doctor_id,
      'rating': rating,
      'review': review,
      'created_at': created_at,
      'created_by': created_by,
    };
  }

}