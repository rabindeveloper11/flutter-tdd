import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart'; 

part 'popular.g.dart';

@HiveType(typeId: 111) 
class PopularEntity extends Equatable {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final double rating;
  @HiveField(3)
  bool isFavorite;
  @HiveField(4)
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

  PopularEntity copyWith({
    int? id,
    String? title,
    double? rating,
    bool? isFavorite,
    String? image,
  }) {
    return PopularEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      rating: rating ?? this.rating,
      isFavorite: isFavorite ?? this.isFavorite,
      image: image ?? this.image,
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
