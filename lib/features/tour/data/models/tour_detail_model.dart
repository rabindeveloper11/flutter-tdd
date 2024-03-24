class TourDetailModel {
  final String id;
  final String title;
  final double rating;
  bool isFavorite;
  final String image;
  final String description;
  final List<TourModelFeature> features;

  TourDetailModel({
    required this.id,
    required this.title,
    required this.rating,
    required this.description,
    this.isFavorite = false,
    required this.image,
    required this.features,
  });

  // from Json
  factory TourDetailModel.fromJson(Map<String, dynamic> json) {
    return TourDetailModel(
      id: json['id'],
      title: json['title'],
      rating: json['rating'],
      description: json['description'],
      image: json['image'],
      features: (json['features'] as List)
          .map((e) => TourModelFeature.fromJson(e))
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
}

class LocalGuideModel {
  final String id;
  final String name;
  final String image;

  LocalGuideModel({
    required this.id,
    required this.name,
    required this.image,
  });

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

class TourModelFeature {
  final String id;
  final String title;
  final String image;

  TourModelFeature({
    required this.id,
    required this.image,
    required this.title,
  });

  // from Json

  factory TourModelFeature.fromJson(Map<String, dynamic> json) {
    return TourModelFeature(
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
