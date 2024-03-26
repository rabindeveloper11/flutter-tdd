import 'package:flutter_assesment/config/local_database/hive_db_service.dart';
import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/features/home/data/data_sources/local/popular_local_data_source.dart';
import 'package:flutter_assesment/features/home/data/models/popular_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockHiveService hiveService;
  late PopularLocalDataSourceImpl popularLocalDataSourceImpl;

  setUp(() {
    hiveService = MockHiveService();
    popularLocalDataSourceImpl =
        PopularLocalDataSourceImpl(hiveService: hiveService);
  });
  group('Testing for HiveService class', () {
    test(
      'should throw a ServerException when HiveService throws an exception',
      () async {
        // Mock HiveService behavior
        when(hiveService.getData(HiveService.savedPopular))
            .thenThrow(Exception());

        // Call the method
        expect(() => popularLocalDataSourceImpl.getSavedPopulars(),
            throwsA(isA<ServerException>()));
      },
    );

    test(
      'should call HiveService.addData with the provided data',
      () async {
        // Mock data
        final Map<String, dynamic> mockData = {'title': 'New Popular Item'};

        // Mock HiveService behavior
        when(hiveService.addData(HiveService.savedPopular, mockData))
            .thenAnswer((_) async {});

        // Call the method
        await popularLocalDataSourceImpl.savePopular(mockData);

        // Verify results
        verify(hiveService.addData(HiveService.savedPopular, mockData))
            .called(1);
      },
    );
    test(
      'should return a list of from List<Map<String, dynamic>> from HiveService.getData',
      () async {
        // Mock data
        final List<Map<String, dynamic>> mockData = [];

        // Mock HiveService behavior
        when(hiveService.getData(HiveService.savedPopular))
            .thenAnswer((_) async => []);

        // Call the method
        final result = await popularLocalDataSourceImpl.getSavedPopulars();

        // Verify results
        expect(result, mockData);
        expect(result.length, mockData.length);
      },
    );

    test("getSavedPopular() should give the List<PopularModel>", () async {
      // Arrange

      final List<PopularModel> populars = [];

      // Act

      when(hiveService.getData(HiveService.savedPopular))
          .thenAnswer((_) async => []);

      final result = await popularLocalDataSourceImpl.getSavedPopulars();

      /// assert
      expect(result, populars);

      // Assert
    });

    test('getSavedPopular() should throw exception when get fails', () {
      when(hiveService.getData(HiveService.savedPopular))
          .thenThrow(Exception());

      expect(() => popularLocalDataSourceImpl.getSavedPopulars(),
          throwsA(isA<ServerException>()));
    });

    test('search() should return the List<PopularModel> ', () async {
      final List<PopularModel> searchedData = [];

      /// arrange

      when(hiveService.getData(HiveService.savedPopular))
          .thenAnswer((_) async => []);

      final result = await popularLocalDataSourceImpl.search('query');

      expect(result, searchedData);
    });

    test('search() should throw exception when search fails', () {
      when(hiveService.getData(HiveService.savedPopular))
          .thenThrow(Exception());

      expect(() => popularLocalDataSourceImpl.search('query'),
          throwsA(isA<ServerException>()));
    });

    test('savePopular() should save the data to the local storage', () async {
      final Map<String, dynamic> data = {
        "id": "1",
        "title": "The Test 1",
        "rating": 4.8,
        "image": "https://www.imdb.com/title/tt0111161/mediaviewer/rm4248991232"
      };

      when(hiveService.addData(HiveService.savedPopular, data))
          .thenAnswer((_) async {});

      await popularLocalDataSourceImpl.savePopular(data);

      verify(hiveService.addData(HiveService.savedPopular, data)).called(1);
    });

    test('savePopular() should throw exception when saving fails', () {
      final Map<String, dynamic> data = {
        "id": "1",
        "title": "The Test 1",
        "rating": 4.8,
        "image": "https://www.imdb.com/title/tt0111161/mediaviewer/rm4248991232"
      };

      when(hiveService.addData(HiveService.savedPopular, data))
          .thenThrow(Exception());

      expect(() => popularLocalDataSourceImpl.savePopular(data),
          throwsA(isA<ServerException>()));
    });

    test('deletePopular() should delete the data from the local storage',
        () async {
      const int index = 1;

      when(hiveService.deleteData(HiveService.savedPopular, index))
          .thenAnswer((_) async {});

      await popularLocalDataSourceImpl.deletePopular(index);

      verify(hiveService.deleteData(HiveService.savedPopular, index)).called(1);
    });

    test('deletePopular() should throw exception when deleting fails', () {
      const int index = 1;

      when(hiveService.deleteData(HiveService.savedPopular, index))
          .thenThrow(Exception());

      expect(() => popularLocalDataSourceImpl.deletePopular(index),
          throwsA(isA<ServerException>()));
    });
  });
}
