import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/home/domain/entities/popular.dart';
import 'package:flutter_assesment/features/home/domain/usecases/get_all_popular.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/popular_bloc/popular_bloc.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/popular_bloc/popular_event.dart';
import 'package:flutter_assesment/features/home/presentation/bloc/popular_bloc/popular_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetAllPopularUsecase getAllPopularUsecase;
  late PopularBloc popularBloc;

  setUp(() {
    getAllPopularUsecase = MockGetAllPopularUsecase();
    popularBloc = PopularBloc(getAllPopularUseCase: getAllPopularUsecase);
  });

  tearDown(() {
    popularBloc.close();
  });

  group('PopularBloc', () {
    final List<PopularEntity> populars = [];

    test('Initial bloc state should be [PopularInital]', () {});

    blocTest<PopularBloc, PopularState>(
      'emits [PopularLoading, PopularLoaded] when GetPopularsEvent is added',
      build: () {
        when(getAllPopularUsecase.call())
            .thenAnswer((_) async => Right(populars));

        return popularBloc;
      },
      act: (bloc) => bloc.add(const GetPopularsEvent()),
      expect: () => [
        PopularLoading(),
        const PopularLoaded(categories: []),
      ],
    );

    blocTest<PopularBloc, PopularState>(
      'emits [PopularLoading, PopularError] when GetPopularsEvent is added and an exception is thrown',
      build: () {
        when(getAllPopularUsecase.call()).thenAnswer(
            (_) async => const Left(ServerFailure(message: 'Server Error')));

        return popularBloc;
      },
      act: (bloc) => bloc.add(const GetPopularsEvent()),
      expect: () => [
        PopularLoading(),
        PopularError(message: 'Server Error'),
      ],
    );
  });
}
