import 'dart:convert';

import 'package:flutter_assesment/features/home/data/models/popular_model.dart';
import 'package:flutter_assesment/features/home/domain/entities/popular.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  final testPopularModel = PopularModel(
    id: '1',
    title: 'test',
    image: 'test',
    rating: 4.8,
  );

  group('Testing [PopularModel]', () {
    /// this test will test if the [PopularModel] is a subtype of [PopularEntity]
    /// if it is not a subtype of [PopularEntity] then the test will fail
    /// if it is a subtype of [PopularEntity] then the test will pass
    test('[PopularModel] should be subtype of [PopularEntity]', () async {
      expect(testPopularModel, isA<PopularEntity>());
    });

    test(
        'fromJson of [PopularModel] should give back the instance of the PopularModel',
        () async {
      /// arrange
      final jsonData = readJson('dummy_data/popular_response.json');
      final jsonMap = json.decode(jsonData);

      /// act

      final result = PopularModel.fromJson(jsonMap);

      /// assert

      expect(result, isA<PopularModel>());
    });
  });

  test(
      'toJson of [PopularModel] should give back the json map with correct data in the model',
      () async {
    /// act

    final result = testPopularModel.toJson();

    /// assert

    final expectedJsonMap = {
      "id": "1",
      "title": "test",
      "image": "test",
      "rating": 4.8,
    };

    expect(result, expectedJsonMap);
  });
}
