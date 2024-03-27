import 'package:flutter_assesment/config/dummy_data/tour_detail_dummy_data.dart';
import 'package:flutter_assesment/config/local_database/hive_db_service.dart';
import 'package:flutter_assesment/features/tour/data/data-sources/local/tour_local_data_source.dart';
import 'package:flutter_assesment/features/tour/data/models/tour_detail_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockHiveService hiveService;
  late TourLocalDataSourceImpl tourLocalDataSourceImpl;

  setUp(() {
    hiveService = MockHiveService();
    tourLocalDataSourceImpl = TourLocalDataSourceImpl(hiveService: hiveService);
  });

  group('Testing the local data for Tour Feature', () {
    test(
        'Hiveservice.getData() should throw exception when Hive throws the exeception',
        () {
      // arrange

      when(hiveService.getData(HiveService.savedTours)).thenThrow(Exception());

      // act
      final result = tourLocalDataSourceImpl.getTours();

      // assert

      expect(() => result, throwsA(isA<Exception>()));
    });

    test('Hiveservice.getData() should return the list of Map<String, dynamic>',
        () async {
      // arrange
      final List<Map<String, dynamic>> mockData = [];

      when(hiveService.getData(HiveService.savedTours))
          .thenAnswer((_) async => []);

      // act
      final result = await tourLocalDataSourceImpl.getTours();

      // assert
      expect(result, mockData);
    });

    test('Hiveservice.addData() should add the data to the savedTours',
        () async {
      // arrange
      final Map<String, dynamic> mockData = tourDetailJson;

      // act
      await tourLocalDataSourceImpl.saveTour(mockData);

      // assert
      verify(hiveService.addData(HiveService.savedTours, mockData)).called(1);
    });

    test(
        'HiveService.addData should throw an exception if Hive throws the Execption',
        () {
      // arrange
      final Map<String, dynamic> mockData = tourDetailJson;

      when(hiveService.addData(HiveService.savedTours, mockData))
          .thenThrow(Exception());

      // act
      final result = tourLocalDataSourceImpl.saveTour(mockData);

      // assert

      expect(() => result, throwsA(isA<Exception>()));
    });

    test('Hiveservice.deleteData() should delete the data from the savedTours',
        () async {
      // arrange
      const int index = 0;

      // act
      await tourLocalDataSourceImpl.deleteTour(index);

      // assert
      verify(hiveService.deleteData(HiveService.savedTours, index)).called(1);
    });

    test(
        'HiveService.deleteData should throw an exception if Hive throws the Execption',
        () {
      // arrange
      const int index = 0;

      when(hiveService.deleteData(HiveService.savedTours, index))
          .thenThrow(Exception());

      // act
      final result = tourLocalDataSourceImpl.deleteTour(index);

      // assert

      expect(() => result, throwsA(isA<Exception>()));
    });

    test('getTours() should return the List<TourDetailModel> ', () async {
      final List<TourDetailModel> mockData = [];
      when(hiveService.getData(HiveService.savedTours))
          .thenAnswer((_) async => []);

      final result = await tourLocalDataSourceImpl.getTours();

      expect(result, mockData);
    });

    test('getTours() should throw exception when get fails', () {
      when(hiveService.getData(HiveService.savedTours)).thenThrow(Exception());

      expect(
          () => tourLocalDataSourceImpl.getTours(), throwsA(isA<Exception>()));
    });

    test('search() should return the List<TourDetailModel> ', () async {
      final List<TourDetailModel> mockData = [];
      when(hiveService.getData(HiveService.savedPopular))
          .thenAnswer((_) async => []);

      final result = await tourLocalDataSourceImpl.search('category');

      expect(result, mockData);
    });

    test(
        'search() should throw the exception when it hive throws the exeception  ',
        () {
      when(hiveService.getData(HiveService.savedPopular))
          .thenThrow(Exception());

      expect(() => tourLocalDataSourceImpl.search('category'),
          throwsA(isA<Exception>()));
    });

    test('deleteTour() should delete the tour on particular index ', () async {
      const int index = 0;
      when(hiveService.getData(HiveService.savedTours))
          .thenAnswer((_) async => []);

      await tourLocalDataSourceImpl.deleteTour(index);

      verify(hiveService.deleteData(HiveService.savedTours, 0)).called(1);
    });

    test('deleteTour() should throw exception when delete fails', () async {
      when(hiveService.deleteData(HiveService.savedTours, 0))
          .thenThrow(Exception());

      expect(() => tourLocalDataSourceImpl.deleteTour(0),
          throwsA(isA<Exception>()));
    });

    test('saveTour() should save the passed data into local database',
        () async {
      final Map<String, dynamic> data = {
        "id": "1",
        "title": "The Test 1",
        "rating": 4.8,
        "image": "https://www.imdb.com/title/tt0111161/mediaviewer/rm4248991232"
      };

      when(hiveService.addData(HiveService.savedTours, data))
          .thenAnswer((_) async {});

      await tourLocalDataSourceImpl.saveTour(data);

      verify(hiveService.addData(HiveService.savedTours, data)).called(1);
    });

    test('saveTour() should throw exception when save fails', () {
      final Map<String, dynamic> data = {
        "id": "1",
        "title": "The Test 1",
        "rating": 4.8,
        "image": "https://www.imdb.com/title/tt0111161/mediaviewer/rm4248991232"
      };

      when(hiveService.addData(HiveService.savedTours, data))
          .thenThrow(Exception());

      expect(() => tourLocalDataSourceImpl.saveTour(data),
          throwsA(isA<Exception>()));
    });
  });
}
