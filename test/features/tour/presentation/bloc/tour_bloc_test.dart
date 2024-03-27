import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_assesment/config/dummy_data/tour_detail_dummy_data.dart';
import 'package:flutter_assesment/core/error/failure.dart';
import 'package:flutter_assesment/features/tour/presentation/bloc/tour_bloc.dart';
import 'package:flutter_assesment/features/tour/presentation/bloc/tour_event.dart';
import 'package:flutter_assesment/features/tour/presentation/bloc/tour_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetTourDetailUseCase mockGetTourDetailUseCase;
  late TourBloc tourBloc;

  setUp(() {
    mockGetTourDetailUseCase = MockGetTourDetailUseCase();
    tourBloc = TourBloc(mockGetTourDetailUseCase);
  });

  group('Testing the Tour Bloc', () {
    test('Initial State should be [TourInitial]', () {
      expect(tourBloc.state, TourInitial());
    });

    blocTest<TourBloc, TourState>(
      'Should emit [TourLoading() TourError()] in order when expection occurs',
      build: () {
        when(mockGetTourDetailUseCase.call()).thenAnswer(
            (_) async => const Left(ServerFailure(message: 'Server Failure')));
        return tourBloc;
      },
      act: (bloc) => bloc.add(const GetTourDetailEvent()),
      expect: () => [TourLoading(), TourError(message: 'Server Failure')],
    );

    blocTest<TourBloc, TourState>(
      'Should emit [TourLoading() TourLoaded()] in order when expection occurs',
      build: () {
        when(mockGetTourDetailUseCase.call())
            .thenAnswer((_) async => Right(tourDetailData));
        return tourBloc;
      },
      act: (bloc) => bloc.add(const GetTourDetailEvent()),
      expect: () =>
          [TourLoading(), TourLoaded(tourDetailEntity: tourDetailData)],
    );
  });
}
