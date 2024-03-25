import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/features/home/data/data_sources/popular_remote_data_source.dart';
import 'package:flutter_assesment/features/home/data/models/popular_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../../../../helpers/json_reader.dart';
import '../../../../helpers/test_helper.mocks.dart';
import 'package:http/http.dart' as http;

void main() {
  /// dependencies
  late MockHttpClient mockHttpClient;
  late PopularRemoteDataSourceImpl mockPopularRemoteDataSource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    mockPopularRemoteDataSource =
        PopularRemoteDataSourceImpl(client: mockHttpClient);
  });

  group("Testing the popular remote data source", () {
    test("Testing for the popular when response is 200", () async {
      // arrange
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response(
          readJson('dummy_data/popular_all_response.json'),
          200,
        ),
      );

      /// act

      final result = await mockPopularRemoteDataSource.getPopulars();

      /// assert
      expect(result, isA<List<PopularModel>>());
    });

    test("Testing for the popular when the response is not 200", () async {
      /// testing the class
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response(
          'Error occurred',
          404,
        ),
      );

      /// assert
      expect(
        () async => mockPopularRemoteDataSource.getPopulars(),
        throwsA(isA<ServerException>()),
      );
    });

    test("Testing for the search when the query is empty", () async {
      /// testing the class
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response(
          readJson('dummy_data/popular_all_response.json'),
          200,
        ),
      );

      /// act
      final result = await mockPopularRemoteDataSource.search('');

      /// assert
      expect(result, isA<List<PopularModel>>());
    });

    test("Testing for the search when the query is not empty", () async {
      /// testing the class
      when(mockHttpClient.get(any)).thenAnswer(
        (_) async => http.Response(
          readJson('dummy_data/popular_all_response.json'),
          200,
        ),
      );

      /// act
      final result = await mockPopularRemoteDataSource.search('a');

      /// assert
      expect(result, isA<List<PopularModel>>());
    });
  });
}
