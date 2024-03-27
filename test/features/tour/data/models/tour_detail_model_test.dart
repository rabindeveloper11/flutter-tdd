import 'package:flutter_assesment/config/dummy_data/tour_detail_dummy_data.dart';
import 'package:flutter_assesment/features/tour/data/models/tour_detail_model.dart';
import 'package:flutter_assesment/features/tour/domain/entities/tour_detail_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final tourDetailData = TourDetailModel(
    id: '1',
    title: 'teting',
    rating: 4.6,
    description: 'This is cool tour guys you are gonna love it',
    image: '',
    localGuide:
        LocalGuideModel(id: '1', name: 'John Doe', image: 'This is image'),
    features: [
      TourFeatureModel(id: '1', title: 'Feature 1', image: 'This is feature 1'),
      TourFeatureModel(id: '1', title: 'Feature 2', image: 'This is feature 2'),
    ],
  );

  group('Testing the model for TourDetailModel', () {
    test('TourDetailModel should be the subtype of TourDetailEntity', () {
      /// assert
      expect(tourDetailData, isA<TourDetailEntity>());
    });

    test(
        'TourDetailModel should be able to convert from Json and give the instance of the TourDetailModel',
        () {
      /// arrange
      final Map<String, dynamic> json = tourDetailJson;

      /// act
      final result = TourDetailModel.fromJson(json);

      /// assert
      expect(result, isA<TourDetailModel>());
    });

    test(
        "TourDetailModel.toJson() should be able to conver the model into json data",
        () {
      /// act
      final Map<String, dynamic> json = tourDetailData.toJson();

      /// assert
      expect(json, isA<Map<String, dynamic>>());
    });
  });
}
