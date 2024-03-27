import 'package:flutter_assesment/features/home/domain/entities/popular.dart';

class PopularModel extends PopularEntity {
  final int id;
  final String title;
  final double rating;
  bool isFavorite;
  final String image;

  PopularModel({
    required this.id,
    required this.title,
    required this.rating,
    this.isFavorite = false,
    required this.image,
  }) : super(
          id: id,
          title: title,
          rating: rating,
          isFavorite: isFavorite,
          image: image,
        );

  factory PopularModel.fromJson(Map<String, dynamic> json) {
    return PopularModel(
      id: json['id'],
      title: json['title'],
      rating: json['rating'],
      isFavorite: json['isFavorite'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'rating': rating,
      'isFavorite': isFavorite,
      'image': image,
    };
  }
}
