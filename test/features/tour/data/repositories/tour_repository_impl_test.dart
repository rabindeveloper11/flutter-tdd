import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/exception.dart';
import 'package:flutter_assesment/features/tour/data/models/tour_detail_model.dart';
import 'package:flutter_assesment/features/tour/data/repositories/tour_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockTourRemoteDetailDataSource mockTourRemoteDetailDataSource;

  late TourRepositoryImpl mockCategoryRepository;

  setUp(() {
    mockTourRemoteDetailDataSource = MockTourRemoteDetailDataSource();
    mockCategoryRepository =
        TourRepositoryImpl(remoteDataSource: mockTourRemoteDetailDataSource);
  });

  group("testing the tour detail repository implementation", () {
    final tourDetailData = TourDetailModel(
      id: '1',
      title: 'teting',
      rating: 4.6,
      description: 'This is cool tour guys you are gonna love it',
      image: '',
      localGuide:
          LocalGuideModel(id: '1', name: 'John Doe', image: 'This is image'),
      features: [
        TourFeatureModel(
            id: '1', title: 'Feature 1', image: 'This is feature 1'),
        TourFeatureModel(
            id: '1', title: 'Feature 2', image: 'This is feature 2'),
      ],
    );

    test("get the tour detail", () async {
      when(mockTourRemoteDetailDataSource.getTourDetail())
          .thenAnswer((_) async => tourDetailData);

      final result = await mockCategoryRepository.getTourDetail();

      expect(mockCategoryRepository.getTourDetail(), completes);
      expect(result, equals(Right(tourDetailData)));
    });

    test("Testing for server exception", () async {
      /// arrange
      when(mockTourRemoteDetailDataSource.getTourDetail())
          .thenThrow(ServerException());

      // act

      /// not given the await keyword, because exception is cannot be stored in  variable
      final result = mockCategoryRepository.getTourDetail();

      // assert

      expect(
        result,
        throwsA(isA<ServerException>()),
      );
    });
  });
}
