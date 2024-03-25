import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/home/domain/entities/popular.dart';
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

  final List<PopularEntity> populars = [];
  group('PopularBloc', () {
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
        const PopularLoaded(populars: []),
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
        const PopularError(message: 'Server Error'),
      ],
    );
  });

  group("Testing the search functionality of the popular", () {
    test(
      'Inital state should be PopularInitial()',
      () => expect(
        popularBloc.state,
        PopularInitial(),
      ),
    );

    blocTest<PopularBloc, PopularState>(
      'should emit [PopularLoading(), PopularError()] in order when the exception occurs',
      build: () {
        when(getAllPopularUsecase.search('query')).thenAnswer(
            (_) async => const Left(ServerFailure(message: 'Server Error')));

        return popularBloc;
      },
      act: (bloc) async => bloc.add(const SeachPopularsEvent('query')),
      expect: () => [
        PopularLoading(),
        const PopularError(message: 'Server Error'),
      ],
    );

    blocTest<PopularBloc, PopularState>(
     'should emit [PopularLoading(), PopularLoaded()] in order when the exception occurs',
      build: () {
        when(getAllPopularUsecase.search('query'))
            .thenAnswer((_) async => Right(populars));

        return popularBloc;
      },
      act: (bloc) async => bloc.add(const SeachPopularsEvent('query')),
      expect: () => [PopularLoading(), const PopularLoaded(populars: [])],
    );

    ///
  });
}
