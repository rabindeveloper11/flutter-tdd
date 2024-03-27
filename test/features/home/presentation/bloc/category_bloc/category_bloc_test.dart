import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/home/domain/entities/category.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_event.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetAllCategoriesUserCase getAllCategoriesUseCase;
  late CategoryBloc categoryBloc;

  setUp(() {
    getAllCategoriesUseCase = MockGetAllCategoriesUserCase();
    categoryBloc = CategoryBloc(getAllCategoriesUseCase);
  });

  group('Testing the get all categori', () {
    test('Inital state should be CategoryInital()', () {
      expect(categoryBloc.state, CategoryInitial());
    });

    final List<CategoryEntity> categories = [];

    blocTest(
      'should emit [CategoryLoading, CategoryLoaded] in order when success',
      build: () {
        when(getAllCategoriesUseCase.call())
            .thenAnswer((_) async => Right(categories));

        return categoryBloc;
      },
      act: (bloc) {
        bloc.add(const GetCategoriesEvent());
      },
      expect: () => [
        CategoryLoading(),
        CategoryLoaded(categories: categories),
      ],
    );

    blocTest(
      "should emit [CategoryLoading, CategoryFailure] in order when the data fetching gives some errors.",
      build: () {
        when(getAllCategoriesUseCase.call()).thenAnswer(
            (_) async => const Left(ServerFailure(message: 'Server Failure')));

        return categoryBloc;
      },
      act: (bloc) {
        bloc.add(const GetCategoriesEvent());
      },
      expect: () => [
        CategoryLoading(),
        const CategoryError(message: 'Server Failure'),
      ],
    );
  });

  group('Testing for search functionality of [CategoryBloc]', () {
    final List<CategoryEntity> categories = [];

    test('Initial State should be CategoryInitial', () {
      expect(categoryBloc.state, CategoryInitial());
    });

    blocTest<CategoryBloc, CategoryState>(
      'should emit CategoryLoading() and CategoryLoaded() with results on successful search',
      build: () {
        when(getAllCategoriesUseCase.search('a')).thenAnswer(
            (_) async => const Left(ServerFailure(message: 'Server Failure')));
        return categoryBloc;
      },
      act: (bloc) async => bloc.add(const SearchCategoriesEvent('a')),
      expect: () =>
          [CategoryLoading(), const CategoryError(message: 'Server Failure')],
    );

    blocTest<CategoryBloc, CategoryState>(
      'CategoryBloc should emit [CategoryLoading(), CategoryLoaded()] in order',
      build: () {
        when(getAllCategoriesUseCase.search('a'))
            .thenAnswer((_) async => Right(categories));
        return categoryBloc;
      },
      act: (bloc) async => bloc.add(const SearchCategoriesEvent('a')),
      expect: () => [CategoryLoading(), CategoryLoaded(categories: categories)],
    );
  });
}
