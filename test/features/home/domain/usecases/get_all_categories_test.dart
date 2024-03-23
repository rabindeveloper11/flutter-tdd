import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/features/home/domain/entities/category.dart';
import 'package:flutter_assesment/features/home/domain/usecases/get_all_categories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  /// dependencies
  late GetAllCategoriesUserCase usecase;
  late MockCategoryRepository mockCategoryRepository;

  /// setup for test cases
  setUp(() {
    mockCategoryRepository = MockCategoryRepository();
    usecase = GetAllCategoriesUserCase(mockCategoryRepository);
  });

  /// dummy data for list of categories
  const categories = [
    CategoryEntity(
      id: '12324fdf',
      name: "Category 1",
      image: 'image_url',
    ),
    CategoryEntity(
      id: '12324fdf',
      name: "Category 2",
      image: 'image_url',
    ),
    CategoryEntity(
      id: '12324fdf',
      name: "Category 3",
      image: 'image_url',
    ),
  ];

  test('should get all the categories', () async {
    // arrange

    when(mockCategoryRepository.getCategories())
        .thenAnswer((_) async => const Right(categories));
    // act

    final result = await usecase.call();

    // assert

    expect(result, const Right(categories));
  });
}
