import 'dart:ffi';

import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/home/data/data_sources/category_remote_data_source.dart';
import 'package:flutter_assesment/features/home/domain/entities/category.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_bloc.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_event.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/category_bloc/category_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetAllCategoriesUserCase getAllCategoriesUserCase;
  late CategoryBloc categoryBloc;

  setUp(() {
    getAllCategoriesUserCase = MockGetAllCategoriesUserCase();
    categoryBloc =
        CategoryBloc(getAllCategoriesUserCase: getAllCategoriesUserCase);
  });

  group('Testing the bloc', () {
    test('Inital state should be WeatherInitial()', () {
      expect(categoryBloc.state, CategoryInitial());
    });

    final List<CategoryEntity> categories = [];

    blocTest(
      'should emit [CategoryLoading, CategoryLoaded] in order when success',
      build: () {
        when(getAllCategoriesUserCase.call())
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
        when(getAllCategoriesUserCase.call()).thenAnswer(
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
}
