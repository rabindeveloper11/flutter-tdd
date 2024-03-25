import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/home/data/models/category_model.dart';
import 'package:flutter_assesment/features/home/data/repositories/category_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockCategoryRemoteDataSource mockCategoryRemoteDataSource;
  late CategoryRepositoryImpl categoryRepositoryImpl;

  setUp(() {
    mockCategoryRemoteDataSource = MockCategoryRemoteDataSource();

    categoryRepositoryImpl =
        CategoryRepositoryImpl(remoteDataSource: mockCategoryRemoteDataSource);
  });

  group('get the categories', () {
    test('getCategories() returns a list of CategoryEntity when successful',
        () async {
      /// arrange
      List<CategoryModel> categories = [];
      when(mockCategoryRemoteDataSource.getCategories())
          .thenAnswer((_) async => categories);

      /// act

      final result = await categoryRepositoryImpl.getCategories();

      /// assert

      expect(result, equals(Right(categories)));
    });

    test("Testing for server exception", () async {
      /// arrange
      when(mockCategoryRemoteDataSource.getCategories())
          .thenThrow(ServerException());

      // act

      final result = await categoryRepositoryImpl.getCategories();

      // assert

      expect(
        result,
        equals(
          const Left(
            ServerFailure(message: 'Server Error'),
          ),
        ),
      );
    });

    test('Testing for Socket Exception', () async {
      /// arrange
      when(mockCategoryRemoteDataSource.getCategories())
          .thenThrow(SocketException());

// act
      final result = await categoryRepositoryImpl.getCategories();

      // assert
      expect(
        result,
        equals(
            const Left(ConnectionFailure(message: 'No Internet Connection'))),
      );
    });
  });

  group('Testing for Category Search Functionality', () {
    test(
        'search(query) should return the List<CategoryModel> when the query is empty',
        () async {
      /// arrange

      List<CategoryModel> categories = [];
      when(mockCategoryRemoteDataSource.search(''))
          .thenAnswer((_) async => categories);

      ///act

      final result = await categoryRepositoryImpl.search('');

      /// assert

      expect(result, equals(Right(categories)));
    });

    test(
        'search(query) should return the List<CategoryModel> when the query is not empty',
        () async {
      /// arrange

      List<CategoryModel> categories = [];
      when(mockCategoryRemoteDataSource.search(''))
          .thenAnswer((_) async => categories);

      ///act

      final result = await categoryRepositoryImpl.search('');

      /// assert

      expect(result, equals(Right(categories)));
    });

    test('Testing for server exception', () async {
      /// arrange
      when(mockCategoryRemoteDataSource.search(''))
          .thenThrow(ServerException());

      /// act
      final result = await categoryRepositoryImpl.search('');

      /// assert
      expect(
        result,
        equals(
          const Left(
            ServerFailure(message: 'Server Error'),
          ),
        ),
      );
    });
  });
}
