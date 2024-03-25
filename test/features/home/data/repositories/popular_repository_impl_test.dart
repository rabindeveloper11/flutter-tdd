import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/home/data/models/popular_model.dart';
import 'package:flutter_assesment/features/home/data/repositories/popular_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockPopularRemoteDataSource mockPopularRemoteDataSource;
  late PopularRepositoryImpl popularRepositoryImpl;

  setUp(() {
    mockPopularRemoteDataSource = MockPopularRemoteDataSource();

    popularRepositoryImpl =
        PopularRepositoryImpl(remoteDataSource: mockPopularRemoteDataSource);
  });

  group('get the popular', () {
    test('getPopular() returns a list of PopularEntity when successful',
        () async {
      /// arrange
      List<PopularModel> populars = [];
      when(mockPopularRemoteDataSource.getPopulars())
          .thenAnswer((_) async => populars);

      /// act

      final result = await popularRepositoryImpl.getAllPopular();

      /// assert

      expect(result, equals(Right(populars)));
    });

    test("Testing for server exception", () async {
      /// arrange
      when(mockPopularRemoteDataSource.getPopulars())
          .thenThrow(ServerException());

      // act

      final result = await popularRepositoryImpl.getAllPopular();

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
      when(mockPopularRemoteDataSource.getPopulars())
          .thenThrow(SocketException());
    });
  });

  group('search the popular', () {
    test('search() returns a list of PopularEntity when successful', () async {
      /// arrange
      List<PopularModel> populars = [];
      when(mockPopularRemoteDataSource.search(''))
          .thenAnswer((_) async => populars);

      /// act

      final result = await popularRepositoryImpl.search('');

      /// assert

      expect(result, equals(Right(populars)));
    });

    test("Testing for server exception", () async {
      /// arrange
      when(mockPopularRemoteDataSource.search('')).thenThrow(ServerException());

      // act

      final result = await popularRepositoryImpl.search('');

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
      when(mockPopularRemoteDataSource.search('')).thenThrow(SocketException());
    });
  });
}
