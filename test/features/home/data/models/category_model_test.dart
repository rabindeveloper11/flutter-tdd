import 'dart:convert';

import 'package:flutter_assesment/features/home/data/models/category_model.dart';
import 'package:flutter_assesment/features/home/domain/entities/category.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../helpers/json_reader.dart';

void main() {
  const testCategoryModel = CategoryModel(
    id: '1',
    name: 'test',
    image: 'test',
  );
  test("Category model should be the subclass of category entity", () async {
    expect(testCategoryModel, isA<CategoryEntity>());
  });

  test('fromJson function should return a valid model', () async {
    /// Arrange :  Reading the dummy json file

    final jsonData = readJson('dummy_data/category_response.json');
    final jsonMap = json.decode(jsonData);

    /// Act : Converting the jsonMap to CategoryModel object
    final result = CategoryModel.fromJson(jsonMap);

    /// Assert :  Comparing the result with the expected model
    expect(result, testCategoryModel);
  });

  test(
      'toJson function should give the json map with correct data in the model',
      () async {
    /// Act : Converting the CategoryModel object to json map

    final result = testCategoryModel.toJson();

    /// Assert :  Comparing the result with the expected json map
    final expectedJsonMap = {
      "id": "1",
      "name": "test",
      "image": "test",
    }; 

    expect(result, expectedJsonMap);
  });
}
