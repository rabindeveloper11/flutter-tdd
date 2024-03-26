import 'package:equatable/equatable.dart';

class TourDetailEntity extends Equatable {
  final String id;

  final String title;
  final double rating;
  final String image;
  final String description;

  final LocalGuideEntity localGuide;
  final List<TourFeatureEntity> features;
  bool isFavorite;

  TourDetailEntity({
    required this.id,
    required this.title,
    required this.rating,
    required this.description,
    this.isFavorite = false,
    required this.image,
    required this.features,
    required this.localGuide,
  });

  // from Json
  factory TourDetailEntity.fromJson(Map<String, dynamic> json) {
    return TourDetailEntity(
      id: json['id'],
      title: json['title'],
      rating: json['rating'],
      description: json['description'],
      image: json['image'],
      localGuide: LocalGuideEntity.fromJson(json['localGuide']),
      features: (json['features'] as List)
          .map((e) => TourFeatureEntity.fromJson(e))
          .toList(),
    );
  }

  // toJson

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'rating': rating,
      'description': description,
      'image': image,
      'features': features.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [
        id,
        title,
        rating,
        description,
        image,
        localGuide,
        features,
      ];
}

class LocalGuideEntity {
  final String id;
  final String name;
  final String image;

  LocalGuideEntity({
    required this.id,
    required this.name,
    required this.image,
  });

  // from Json

  factory LocalGuideEntity.fromJson(Map<String, dynamic> json) {
    return LocalGuideEntity(
      id: json['id'],
      name: json['name'],
      image: json['image'],
    );
  }

  // toJson

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'image': image,
    };
  }
}

class TourFeatureEntity {
  final String id;
  final String title;
  final String image;

  TourFeatureEntity({
    required this.id,
    required this.image,
    required this.title,
  });

  // from Json

  factory TourFeatureEntity.fromJson(Map<String, dynamic> json) {
    return TourFeatureEntity(
      id: json['id'],
      title: json['title'],
      image: json['image'],
    );
  }

  // toJson

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'image': image,
    };
  }
}
