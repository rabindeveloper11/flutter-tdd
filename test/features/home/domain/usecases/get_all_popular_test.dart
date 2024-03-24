import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/features/home/domain/entities/popular.dart';
import 'package:flutter_assesment/features/home/domain/usecases/get_all_popular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  /// dependencies
  late GetAllPopularUsecase getAllPopularUsecase;
  late MockPopularRepository mockPopularRepository;

  setUp(() {
    /// initialize the mock objects
    ///

    mockPopularRepository = MockPopularRepository();
    getAllPopularUsecase = GetAllPopularUsecase(mockPopularRepository);
  });

  /// dummy data for list of populars

  final allPopulars = [
    PopularEntity(
      id: '12324fdf',
      title: "Popular 1",
      rating: 4.5,
      image: 'image_url',
    ),
    PopularEntity(
      id: '12324fdf',
      title: "Popular 2",
      rating: 4.5,
      image: 'image_url',
    ),
  ];

  test('Should get list of the popular data', () async {
// arrange

    when(mockPopularRepository.getAllPopular()).thenAnswer((_) async {
      return Right(allPopulars);
    });

    // act
    final result = await getAllPopularUsecase.call();
    // assert
    expect(result, Right(allPopulars));
  });
}
