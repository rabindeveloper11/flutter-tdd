import 'package:flutter_assesment/features/tour/domain/entities/tour_detail_entity.dart';

class TourDetailModel extends TourDetailEntity {
  final String id; 
  final String title;
  final double rating;
  final String image;
  final String description;
  final LocalGuideModel localGuide;

  final List<TourFeatureModel> features;

  bool isFavorite;

  TourDetailModel({
    required this.id,
    required this.title,
    required this.rating,
    required this.description,
    this.isFavorite = false,
    required this.localGuide,
    required this.features,
    required this.image,
  }) : super(
            description: description,
            features: features,
            id: id,
            image: image,
            localGuide: localGuide,
            rating: rating,
            title: title,
            isFavorite: isFavorite);

  // from Json
  factory TourDetailModel.fromJson(Map<String, dynamic> json) {
    return TourDetailModel(
      id: json['id'],
      title: json['title'],
      rating: json['rating'],
      description: json['description'],
      image: json['image'],
      localGuide: LocalGuideModel.fromJson(json['localGuide']),
      features: (json['features'] as List)
          .map((e) => TourFeatureModel.fromJson(e))
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

class LocalGuideModel extends LocalGuideEntity {
  final String id;
  final String name;
  final String image;

  LocalGuideModel({
    required this.id,
    required this.name,
    required this.image,
  }) : super(id: id, image: image, name: name);

  // from Json

  factory LocalGuideModel.fromJson(Map<String, dynamic> json) {
    return LocalGuideModel(
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

class TourFeatureModel extends TourFeatureEntity {
  final String id;
  final String title;
  final String image;

  TourFeatureModel({
    required this.id,
    required this.image,
    required this.title,
  }) : super(id: id, image: image, title: title);

  // from Json

  factory TourFeatureModel.fromJson(Map<String, dynamic> json) {
    return TourFeatureModel(
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
