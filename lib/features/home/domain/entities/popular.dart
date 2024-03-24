import 'package:equatable/equatable.dart';

class PopularEntity extends Equatable {
  final String id;
  final String title;
  final double rating;
  bool isFavorite;
  final String image;

  PopularEntity({
    required this.id,
    required this.title,
    required this.rating,
    this.isFavorite = false,
    required this.image,
  });

  @override
  List<Object?> get props => [id, title, rating, isFavorite, image];
}
