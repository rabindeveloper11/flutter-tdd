import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/features/home/data/data_sources/category_remote_data_source.dart';
import 'package:flutter_assesment/features/home/data/models/category_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:http/http.dart' as http;
import '../../../../helpers/json_reader.dart';
import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockHttpClient mockHttpClient;
  late CategoryRemoteDataSource categoryRemoteDataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    categoryRemoteDataSource = CategorySourceDataImpl(client: mockHttpClient);
  });

  group('Categories Testing', () {
    test('Testing for the categories when response is 200 ', () async {
      // arrange
      /// passing the empty url to the string because of the fact that the UI and
      /// the public API are not quite a match

      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response(
          readJson('dummy_data/category_response.json'),
          200,
        ),
      );

      ///act

      final result = await categoryRemoteDataSource.getCategories();

      ///assert

      expect(result, isA<List<CategoryModel>>());
    });
  });

  test("Testing for the categories when the response is not 200 ", () async {
    /// testing the class
    when(mockHttpClient.get(any)).thenAnswer(
      (_) async => http.Response(
        'Error occurred',
        404,
      ),
    );

    expect(
      () async => categoryRemoteDataSource.getCategories(),
      throwsA(isA<ServerException>()),
    );
  });

  test("Testing for the search when the query is empty", () async {
    /// testing the class
    when(mockHttpClient.get(any)).thenAnswer(
      (_) async => http.Response(
        readJson('dummy_data/category_response.json'),
        200,
      ),
    );

    final result = await categoryRemoteDataSource.search('');

    expect(result, isA<List<CategoryModel>>());
  });

  test("Testing for the search when the query is not empty", () async {
    /// testing the class
    when(mockHttpClient.get(Uri.parse(''))).thenAnswer(
      (_) async => http.Response(
        readJson('dummy_data/category_response.json'),
        200,
      ),
    );

    final result = await categoryRemoteDataSource.search('Top 30 Places');

    expect(result, isA<List<CategoryModel>>());
  });
}
