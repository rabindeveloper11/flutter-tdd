import 'package:flutter_assesment/features/tour/domain/entities/tour_detail_entity.dart';

final tourDetailData = TourDetailEntity(
  id: '1',
  title: 'teting',
  rating: 4.6,
  description: 'This is cool tour guys you are gonna love it',
  image: '',
  localGuide:
      LocalGuideEntity(id: '1', name: 'John Doe', image: 'This is image'),
  features: [
    TourFeatureEntity(id: '1', title: 'Feature 1', image: 'This is feature 1'),
    TourFeatureEntity(id: '1', title: 'Feature 2', image: 'This is feature 2'),
  ],
);

final tourDetailJson = {
  "id": "1",
  "title": "teting",
  "rating": 4.6,
  "description": "This is cool tour guys you are gonna love it",
  "image": "",
  "localGuide": {"id": "1", "name": "John Doe", "image": "This is image"},
  "features": [
    {"id": "1", "title": "Feature 1", "image": "This is feature 1"},
    {"id": "1", "title": "Feature 2", "image": "This is feature 2"}
  ]
};
