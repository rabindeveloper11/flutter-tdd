import 'package:flutter_assesment/config/dummy_data/category_dummy_data.dart';
import 'package:flutter_assesment/config/local_database/hive_db_service.dart';
import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/features/home/data/data_sources/local/category_local_data_source.dart';
import 'package:flutter_assesment/features/home/data/models/category_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockHiveService hiveService;
  late CategoryLocalDataSourceImpl popularLocalDataSourceImpl;

  setUp(() {
    hiveService = MockHiveService();
    popularLocalDataSourceImpl =
        CategoryLocalDataSourceImpl(hiveService: hiveService);
  });

  group('Testing the category local data source', () {
    test(
      'should throw a ServerException when HiveService throws an exception',
      () async {
        // Mock HiveService behavior
        when(hiveService.getData(HiveService.savedCategories))
            .thenThrow(Exception());

        // Call the method
        expect(() => popularLocalDataSourceImpl.getSavedCategories(),
            throwsA(isA<ServerException>()));
      },
    );

    test(
      'should call HiveService.addData with the provided data',
      () async {
        // Mock data
        final Map<String, dynamic> mockData = dummyCategories[0].toJson();

        // Mock HiveService behavior
        when(hiveService.addData(HiveService.savedCategories, mockData))
            .thenAnswer((_) async {});

        // Call the method
        await popularLocalDataSourceImpl.saveCategory(mockData);

        // Verify results
        verify(hiveService.addData(HiveService.savedCategories, mockData))
            .called(1);
      },
    );
    test(
      'should return a list of from List<Map<String, dynamic>> from HiveService.getData',
      () async {
        // Mock data
        final List<Map<String, dynamic>> mockData = [];

        // Mock HiveService behavior
        when(hiveService.getData(HiveService.savedCategories))
            .thenAnswer((_) async => []);

        // Call the method
        final result = await popularLocalDataSourceImpl.getSavedCategories();

        // Verify results
        expect(result, equals(mockData));
      },
    );

    test('getSavedCategories() should the List<CategoryModel> ', () async {
      final List<CategoryModel> mockData = [];

      when(hiveService.getData(HiveService.savedCategories))
          .thenAnswer((_) async => []);

      final result = await popularLocalDataSourceImpl.getSavedCategories();

      expect(result, mockData);
    });

    test(
        'getSavedCategories() should throw the exception when it hive throws the exeception  ',
        () {
      when(hiveService.getData(HiveService.savedCategories))
          .thenThrow(Exception());

      expect(() => popularLocalDataSourceImpl.getSavedCategories(),
          throwsA(isA<ServerException>()));
    });

    test('search() should return the List<CategoryModel> ', () async {
      final List<CategoryModel> mockData = [];
      when(hiveService.getData(HiveService.savedCategories))
          .thenAnswer((_) async => []);

      final result = await popularLocalDataSourceImpl.search('category');

      expect(result, mockData);
    });

    test(
        'search() should throw the exception when it hive throws the exeception  ',
        () {
      when(hiveService.getData(HiveService.savedPopular))
          .thenThrow(Exception());

      expect(() => popularLocalDataSourceImpl.search('category'),
          throwsA(isA<ServerException>()));
    });

    test('deleteCategory() should return the List<CategoryModel> ', () async {
      when(hiveService.getData(HiveService.savedCategories))
          .thenAnswer((_) async => []);

      await popularLocalDataSourceImpl.deleteCategory(0);

      verify(hiveService.deleteData(HiveService.savedCategories, 0)).called(1);
    });

    test('deleteCategory() should throw exception when delete fails', () {
      when(hiveService.deleteData(HiveService.savedCategories, 0))
          .thenThrow(Exception());

      expect(() => popularLocalDataSourceImpl.deleteCategory(0),
          throwsA(isA<ServerException>()));
    });

    test('saveCategory() should save the data to the local storage ', () {
      final Map<String, dynamic> mockData = dummyCategories[0].toJson();

      when(hiveService.addData(HiveService.savedCategories, mockData))
          .thenAnswer((_) async {});

      popularLocalDataSourceImpl.saveCategory(mockData);

      verify(hiveService.addData(HiveService.savedCategories, mockData))
          .called(1);
    });

    test('saveCategory() should throw exception when save fails', () {
      final Map<String, dynamic> mockData = dummyCategories[0].toJson();

      when(hiveService.addData(HiveService.savedCategories, mockData))
          .thenThrow(Exception());

      expect(() => popularLocalDataSourceImpl.saveCategory(mockData),
          throwsA(isA<ServerException>()));
    });
  });
}
